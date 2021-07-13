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
	public boolean bspecialinsert(BoardSpecialVO vo) {
		//새글 등록		
		boolean result=smapper.bspecialinsert(vo)>0?true:false;
			
		//첨부파일 등록
		if(vo.getAttachList()==null || vo.getAttachList().size()<=0) {
			return result;
		}		
		
		vo.getAttachList().forEach(attach ->{
			attach.setBno(vo.getNo());
			sattachMapper.bspecialinsert(attach);			
		});
		
		return result;
		
	}

	@Transactional
	@Override
	public boolean bspecialdelete(int bno) {
		

		//첨부파일 삭제
		sattachMapper.bspecialdelete(bno);
		
		//게시글 삭제
		return smapper.bspecialdelete(bno)>0?true:false;
	}

	@Transactional
	@Override
	public boolean bspecialupdate(BoardSpecialVO vo) {
		//기존에 첨부파일 정보 모두 삭제 후 삽입
		
		sattachMapper.bspecialdelete(vo.getNo());
		
		//게시글 수정
		boolean modifyResult = smapper.bspecialupdate(vo)>0?true:false;
		
		if(vo.getAttachList() == null) {
			return modifyResult;
		}
		
		
		
		//첨부파일 삽입
		if(modifyResult && vo.getAttachList().size()>0) {
			for(BoardSpecialAttachFileDTO dto:vo.getAttachList()) {
				dto.setBno(vo.getNo());
				sattachMapper.bspecialinsert(dto);
			}
		}
		return modifyResult;
	}

	@Override
	public List<BoardSpecialVO> bspeciallist(BoardCriteria cri) {		
		return smapper.bspeciallist(cri);
	}

	@Override
	public BoardSpecialVO bspecialread(int bno) {		
		return smapper.bspecialread(bno);
	}

	@Override
	public int bspecialtotalCnt(BoardCriteria cri) {		
		return smapper.bspecialtotalCnt(cri);
	}

	@Override
	public List<BoardSpecialAttachFileDTO> bspecialAttachList(int bno) {		
		return sattachMapper.bspecialfindByBno(bno);
	}

	

	

	
	

}




