package com.spring.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.spring.board.domain.BoardVO;
import com.spring.board.domain.CommentVO;
import com.spring.board.domain.Criteria;
import com.spring.board.mapper.CommentMapper;

@Service
public class CommentServiceImpl implements CommentService {

	@Autowired
	private CommentMapper cmapper;

	@Override
	public boolean insert(BoardVO vo) {
		return false;
	}

	@Override
	public boolean delete(int bno) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean update(BoardVO vo) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public List<BoardVO> list(Criteria cri) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public BoardVO read(int bno) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int total(Criteria cri) {
		// TODO Auto-generated method stub
		return 0;
	}
	
	
	

	

}