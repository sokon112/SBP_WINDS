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
public class BoardCommentVO { //댓글
	private int dno; //댓글 번호
	private int bno; //게시물 번호
	private String nickname; //닉네임
	private String content; //내용
	private String password; //비번
	private Date uploaddate; //날짜
	//
	
	
}