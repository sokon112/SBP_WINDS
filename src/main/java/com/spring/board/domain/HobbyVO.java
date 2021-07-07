package com.spring.board.domain;

import java.util.Date;
import java.util.List;

import com.spring.board.domain.BoardAttachFileDTO;

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
public class HobbyVO {
	private int no;
	private String writer;
	private String title;
	private String contents;
	private String password;
	private Date uploaddate;
	
	//첨부파일 리스트
	private List<BoardAttachFileDTO> attachList;
	
}