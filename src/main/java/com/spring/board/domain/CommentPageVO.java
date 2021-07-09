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
public class CommentPageVO { //댓글페이지
	private int commentCnt; //댓글 전체 개수
	private List<CommentVO> list; //댓글 리스트
	
	
}