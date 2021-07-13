package com.spring.board.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@ToString
@Setter
@Getter
public class BoardCriteria { //검색
	private int pageNum; //사용자가 클릭하는 페이지 번호
	private int amount; //하나의 페이지에 보여줄 게시물 갯수
	
	
	//검색 추가
	private String type;  //검색조건
	private String keyword; //검색어
	
	
	
	public BoardCriteria() {
		this(1,10);
	}
	public BoardCriteria(int pageNum, int amount) {
		super();
		this.pageNum = pageNum;
		this.amount = amount;
	}
	
	public String[] getTypeArr() {
		// type => TCW => {"T","C","W"}, TC=>{"T","C"}, T=>{"T"}
		return type==null?new String[] {}:type.split("");
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
}
