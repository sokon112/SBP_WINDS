package com.spring.board.service;

import java.util.List;

import com.spring.board.domain.EventAttachFileDTO;
import com.spring.board.domain.BoardVO;
import com.spring.board.domain.CommentVO;
import com.spring.board.domain.Criteria;

public interface CommentService {

	public boolean insert(CommentVO comment);
	public boolean delete(int bno);
	public boolean update(CommentVO comment);
	public List<CommentVO> list(Criteria cri,int bno);
	public CommentVO read(int bno);
	public int total(Criteria cri);
	
}
