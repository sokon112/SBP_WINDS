package com.spring.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.spring.board.domain.BoardCriteria;
import com.spring.board.domain.BoardEventAttachFileDTO;
import com.spring.board.domain.BoardEventVO;
import com.spring.board.mapper.BoardEventAttachMapper;
import com.spring.board.mapper.BoardEventMapper;


@Service
public class BoardEventServieImpl implements BoardEventService {

	@Autowired
	private BoardEventMapper emapper;
	
	@Autowired
	private BoardEventAttachMapper eattachMapper;
	
	
	
	@Transactional
	@Override
	public boolean beinsert(BoardEventVO vo) {
		//새글 등록		
		boolean result=emapper.beinsert(vo)>0?true:false;
			
		//첨부파일 등록
		if(vo.getEimages()==null || vo.getEimages().size()<=0) {
			return result;
		}		
		
		vo.getEimages().forEach(attach ->{
			attach.setEno(vo.getEno());
			eattachMapper.beinsert(attach);			
		});
		
		return result;
		
	}

	@Transactional
	@Override
	public boolean bedelete(int bno) {
		

		//첨부파일 삭제
		eattachMapper.bedelete(bno);
		
		//게시글 삭제
		return emapper.bedelete(bno)>0?true:false;
	}

	@Transactional
	@Override
	public boolean beupdate(BoardEventVO vo) {
		//기존에 첨부파일 정보 모두 삭제 후 삽입
		
		eattachMapper.bedelete(vo.getEno());
		
		//게시글 수정
		boolean modifyResult = emapper.beupdate(vo)>0?true:false;
		
		if(vo.getEimages() == null) {
			return modifyResult;
		}
		
		
		
		//첨부파일 삽입
		if(modifyResult && vo.getEimages().size()>0) {
			for(BoardEventAttachFileDTO dto:vo.getEimages()) {
				dto.setEno(vo.getEno());
				eattachMapper.beinsert(dto);
			}
		}
		return modifyResult;
	}

	@Override
	public List<BoardEventVO> belist(BoardCriteria cri) {		
		return emapper.belist(cri);
	}

	@Override
	public BoardEventVO beread(int bno) {		
		return emapper.beread(bno);
	}

	@Override
	public int betotalCnt(BoardCriteria cri) {		
		return emapper.betotalCnt(cri);
	}

	@Override
	public List<BoardEventAttachFileDTO> beAttachList(int bno) {		
		return eattachMapper.befindByBno(bno);
	}

	

	

	
	

}




