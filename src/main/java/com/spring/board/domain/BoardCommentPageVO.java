package com.spring.board.domain;

import java.util.Date;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter 
@Setter
@ToString
@AllArgsConstructor
public class BoardCommentPageVO { //댓글페이지 나누는 것 
	private int commentCnt; //댓글 전체 개수
	private List<BoardCommentVO> list; //댓글 리스트
	//
	
}