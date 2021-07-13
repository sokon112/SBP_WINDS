package com.spring.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.spring.board.domain.BoardVO;
import com.spring.board.domain.BoardCriteria;
import com.spring.board.mapper.BoardMapper;
import com.spring.board.mapper.BoardCommentMapper;

@Service
public class BoardServieImpl implements BoardService {

	@Autowired
	private BoardMapper bmapper;
	
	@Autowired
	private BoardCommentMapper bcommentMapper;
	
	
	@Override
	public boolean boardinsert(BoardVO vo) {
		//새글 등록		
		boolean result=bmapper.boardinsert(vo)>0?true:false;
				
		return result;
		
	}
	

	@Transactional
	@Override
	public boolean boarddelete(int bno) {
		
		//댓글 삭제
		bcommentMapper.bcommentdeleteAll(bno);		
		
		//게시글 삭제
		return bmapper.boarddelete(bno)>0?true:false;
	}

	@Transactional
	@Override
	public boolean boardupdate(BoardVO vo) {
	
		//게시글 수정
		boolean modifyResult = bmapper.boardupdate(vo)>0?true:false;
		
		return modifyResult;
	}


	@Override
	public BoardVO boardread(int rno) {		
		return bmapper.boardread(rno);
	}

	@Override
	public int boardtotal(BoardCriteria cri) {		
		return bmapper.boardtotalCnt(cri);
	}


	@Override
	public List<BoardVO> boardlist(BoardCriteria cri) {
		return bmapper.boardlist(cri);
	}




	
}

	

