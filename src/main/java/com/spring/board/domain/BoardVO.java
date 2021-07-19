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
public class BoardVO { //게시판
	private int bno; //게시물 번호
	private String nickname; //닉네임
	private String title; //제목
	private String contents; //내용
	private String password; //비번
	private Date uploaddate; //날짜
	private int views; //조회수
	
	
}