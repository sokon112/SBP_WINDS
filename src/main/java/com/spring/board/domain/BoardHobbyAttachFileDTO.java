package com.spring.board.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@ToString
@Setter
@Getter
public class BoardHobbyAttachFileDTO { //파일첨부(이벤트, 동호회)
	private String uuid;   //아이디
	private String uploadPath; //
	private String fileName;  //파일이름
	private boolean fileType; //파일타입
	private int hno; //번호
	
}
