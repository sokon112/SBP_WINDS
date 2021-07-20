package com.spring.vacation.domain;

import lombok.Getter;
import lombok.ToString;

@Getter
@ToString
public class VacationPageVO {
	private int startPage;
	private int endPage;
	private boolean prev;
	private boolean next;
	private int total;
	private VacationCriteria cri;
	
	public VacationPageVO(VacationCriteria cri, int total) {
		this.total=total;
		this.cri=cri;
		
		this.endPage=(int)(Math.ceil(cri.getPageNum()/10.0))*10;
		this.startPage=this.endPage-9;
		
		int realEnd=(int)(Math.ceil((total/1.0)/cri.getAmount()));
		if(realEnd<this.endPage) {
			this.endPage=realEnd;
			
		}
		this.prev=this.startPage>1;
		this.next=this.endPage>realEnd;
	}
	
}
