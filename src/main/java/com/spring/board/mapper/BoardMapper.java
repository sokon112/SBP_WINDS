package com.spring.board.mapper;

import java.util.List;

import com.spring.board.domain.BoardVO;
import com.spring.board.domain.Criteria;

public interface BoardMapper {

	public int insert(BoardVO vo); //삽입
	public int delete(int bno);  //삭제
	public int update(BoardVO vo);  //수정
	public List<BoardVO> list(Criteria cri);  //전체 리스트 검색
	public BoardVO read(int bno); //읽기
	public int totalCnt(Criteria cri); //
	
	
}
