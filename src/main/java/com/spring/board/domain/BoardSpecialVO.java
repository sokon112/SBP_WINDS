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
@NoArgsConstructor
public class BoardSpecialVO { //동호회
	private int no; //번호
	private String writer;  //작성자
	private String title; //제목
	private String contents; //내용
	private String password; //비번
	private Date uploaddate; //날짜
	private String boardname; //이벤트 or 동호회
	
	//첨부파일 리스트
	private List<BoardSpecialAttachFileDTO> attachList;
	
}