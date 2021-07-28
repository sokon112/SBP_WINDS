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
public class BoardEventVO { //이벤트
	private int eno; //번호
	private String ewriter;  //작성자
	private String etitle; //제목
	private String econtents; //내용
	private String epassword; //비번
	private Date euploaddate; //날짜
	private int eviews; //조회수

	
	//첨부파일 리스트
	private List<BoardEventAttachFileDTO> eimages;
	
}