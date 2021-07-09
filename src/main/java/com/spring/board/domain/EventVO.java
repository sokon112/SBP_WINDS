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
public class EventVO { //이벤트
	private int no; //게시물 번호
	private String writer; //작성자
	private String title; //제목
	private String contents; //내용
	private String password; //비번
	private Date uploaddate; //날짜
	
	//첨부파일 리스트
	private List<EventAttachFileDTO> attachList;
	
}