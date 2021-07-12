package com.spring.vacation.domain;



import java.util.Calendar;
import java.util.Date;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class VacationCriteria { 
	
	private Date nowMonth;
	private Date nextMonth;
	
	private String keyType;
	private String keyword;
	
	Calendar cal = Calendar.getInstance();

	
	
	public VacationCriteria(Date nowMonth) {
		super();
		cal.setTime(nowMonth);
		cal.set(Calendar.DATE, 1);
		this.nowMonth=cal.getTime();
		cal.add(Calendar.MONTH, 1);
		this.nextMonth=cal.getTime();
	}
	public void upVacationMonth() {
		this.nowMonth=this.nextMonth;
		cal.setTime(nextMonth);
		cal.add(Calendar.MONTH, +1);
		this.nextMonth=cal.getTime();
		System.out.println("nowMonth : "+nowMonth+"nextMonth : "+nextMonth);
	}
	public void downVacationMonth() {
		this.nextMonth=this.nowMonth;
		cal.setTime(nowMonth);
		cal.add(Calendar.MONTH, -1);
		this.nowMonth=cal.getTime();
		System.out.println("nowMonth : "+nowMonth+"nextMonth : "+nextMonth);
	}
	
	private String[] getTypeArr() {
		return keyType==null?new String[] {}:keyType.split("");
	
	}
}
