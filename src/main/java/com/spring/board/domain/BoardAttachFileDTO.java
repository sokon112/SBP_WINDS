package com.spring.board.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;


@ToString
@Setter
@Getter
public class BoardAttachFileDTO { //파일 첨부(이벤트,동호회)
	private String uuid; //
	private String uploadPath; //
	private String fileName; //파일명
	private boolean fileType; //파일타입
	private int bno; //번호
	
	
	
	
}
