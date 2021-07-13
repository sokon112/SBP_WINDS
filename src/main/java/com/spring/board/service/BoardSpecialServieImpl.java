package com.spring.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.spring.board.domain.BoardCriteria;
import com.spring.board.domain.BoardSpecialAttachFileDTO;
import com.spring.board.domain.BoardSpecialVO;
import com.spring.board.mapper.BoardSpecialAttachMapper;
import com.spring.board.mapper.BoardSpecialMapper;


@Service
public class BoardSpecialServieImpl implements BoardSpecialService {

	@Autowired
	private BoardSpecialMapper smapper;
	
	@Autowired
	private BoardSpecialAttachMapper sattachMapper;
	
	
	
	@Transactional
	@Override
	public boolean insert(BoardSpecialVO vo) {
		//새글 등록		
		boolean result=smapper.insert(vo)>0?true:false;
			
		//첨부파일 등록
		if(vo.getAttachList()==null || vo.getAttachList().size()<=0) {
			return result;
		}		
		
		vo.getAttachList().forEach(attach ->{
			attach.setBno(vo.getNo());
			sattachMapper.insert(attach);			
		});
		
		return result;
		
	}

	@Transactional
	@Override
	public boolean delete(int bno) {
		

		//첨부파일 삭제
		sattachMapper.delete(bno);
		
		//게시글 삭제
		return smapper.delete(bno)>0?true:false;
	}

	@Transactional
	@Override
	public boolean update(BoardSpecialVO vo) {
		//기존에 첨부파일 정보 모두 삭제 후 삽입
		
		sattachMapper.delete(vo.getNo());
		
		//게시글 수정
		boolean modifyResult = smapper.update(vo)>0?true:false;
		
		if(vo.getAttachList() == null) {
			return modifyResult;
		}
		
		
		
		//첨부파일 삽입
		if(modifyResult && vo.getAttachList().size()>0) {
			for(BoardSpecialAttachFileDTO dto:vo.getAttachList()) {
				dto.setBno(vo.getNo());
				sattachMapper.insert(dto);
			}
		}
		return modifyResult;
	}

	@Override
	public List<BoardSpecialVO> list(BoardCriteria cri) {		
		return smapper.list(cri);
	}

	@Override
	public BoardSpecialVO read(int bno) {		
		return smapper.read(bno);
	}

	@Override
	public int total(BoardCriteria cri) {		
		return smapper.totalCnt(cri);
	}

	@Override
	public List<BoardSpecialAttachFileDTO> getAttachList(int bno) {		
		return sattachMapper.findByBno(bno);
	}


	
	

}




