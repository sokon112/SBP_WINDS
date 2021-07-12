package com.spring.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.spring.board.domain.CommentVO;
import com.spring.board.domain.Criteria;
import com.spring.board.mapper.BoardMapper;
import com.spring.board.mapper.CommentMapper;

@Service
public class CommentServiceImpl implements CommentService {

	@Autowired
	private CommentMapper cmapper;

	@Autowired
	private BoardMapper bmapper;
	
	@Override	
	public boolean insert(CommentVO comment) {
		
		boolean result = cmapper.insert(comment)>0?true:false;
		return result;
	}
	
	@Override
	public boolean update(CommentVO comment) {
		return cmapper.update(comment)>0?true:false;
	}

	@Override
	public boolean delete(int rno) {

		CommentVO comment = cmapper.read(rno);
		return cmapper.delete(rno)>0?true:false;
	}

	
	@Override
	public List<CommentVO> list(Criteria cri, int bno) {
		return cmapper.list(cri,bno);
	}

	@Override
	public CommentVO read(int rno) {
		return cmapper.read(rno);
	}

	@Override
	public int total(Criteria cri) {
		return cmapper.total(cri);

	}
	
	
	

	

}