package com.spring.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.spring.board.domain.BoardCommentVO;
import com.spring.board.domain.BoardCriteria;
import com.spring.board.mapper.BoardMapper;
import com.spring.board.mapper.BoardCommentMapper;

@Service
public class BoardCommentServiceImpl implements BoardCommentService {

	@Autowired
	private BoardCommentMapper cmapper;

	@Autowired
	private BoardMapper bmapper;
	
	@Override	
	public boolean insert(BoardCommentVO comment) {
		
		boolean result = cmapper.insert(comment)>0?true:false;
		return result;
	}
	
	@Override
	public boolean update(BoardCommentVO comment) {
		return cmapper.update(comment)>0?true:false;
	}

	@Override
	public boolean delete(int rno) {

		BoardCommentVO comment = cmapper.read(rno);
		return cmapper.delete(rno)>0?true:false;
	}

	
	@Override
	public List<BoardCommentVO> list(BoardCriteria cri, int bno) {
		return cmapper.list(cri,bno);
	}

	@Override
	public BoardCommentVO read(int rno) {
		return cmapper.read(rno);
	}

	@Override
	public int total(BoardCriteria cri) {
		return cmapper.total(cri);

	}
	
	
	

	

}