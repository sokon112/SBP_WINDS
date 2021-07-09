package com.spring.board.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.spring.board.domain.CommentVO;
import com.spring.board.domain.Criteria;


public interface CommentMapper { //댓글
	public int insert(CommentVO comment);
	public CommentVO read(int rno);
	public int update(CommentVO comment);
	public int delete(int rno);
	public int deleteAll(int ano);
	public int getCountByBno(int bno);
	public List<CommentVO> list(@Param("cri") Criteria cri,@Param("bno") int bno);
}
