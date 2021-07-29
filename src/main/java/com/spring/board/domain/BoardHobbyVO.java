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
public class BoardHobbyVO { //이벤트,동호회
	private int hno; //번호
	private String hwriter;  //작성자
	private String htitle; //제목
	private String hcontents; //내용
	private String hpassword; //비번
	private Date huploaddate; //날짜
	private int hviews; //조회수

	//첨부파일 리스트
	private List<BoardHobbyAttachFileDTO> hattachList;

}