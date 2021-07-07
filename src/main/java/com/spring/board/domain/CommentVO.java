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
public class CommentVO {
	private int dno;
	private int bno;
	private String nickname;
	private String content;
	private String password;
	private Date uploaddate;
	
	
	
}