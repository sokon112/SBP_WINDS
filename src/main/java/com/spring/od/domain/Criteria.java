package com.spring.od.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@ToString
@Getter
@Setter
public class Criteria {
	private int pageNum;
	private int amount;
	
	
	private String type; 
	private String keyword; 
	
	public Criteria() {
		this(1,10);
	}

	public Criteria(int pageNum, int amount) {
		super();
		this.pageNum = pageNum;
		this.amount = amount;
	}
	
	public String[] getTypeArr() {
		//type => TCW =>{"T","C","W"}
		return type==null?new String[] {}:type.split("");
	}
	
}
