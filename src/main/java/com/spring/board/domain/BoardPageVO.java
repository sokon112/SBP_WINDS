package com.spring.board.domain;

import lombok.Getter;
import lombok.ToString;

@Getter
@ToString
public class BoardPageVO { //게시물 페이지 나누는것
	//페이지 나누기와 관련된 정보를 담고 있는 객체
	private int startPage;
	private int endPage;
	private boolean prev;
	private boolean next;
	private int total; //전체 게시물 수
	private BoardCriteria cri; //현재페이지, 화면에 몇개씩 보여줄것인가?
	
	public BoardPageVO(BoardCriteria cri,int total) {
		this.total = total;
		this.cri = cri;
		
		this.endPage = (int)(Math.ceil(cri.getPageNum()/10.0))*10;
		this.startPage = this.endPage-9;
		
		int realEnd = (int)(Math.ceil((total/1.0)/cri.getAmount()));
		if(realEnd < this.endPage) {
			this.endPage = realEnd;
		}
		
		
		this.prev = this.startPage > 1;
		this.next = this.endPage < realEnd;
	}
}
