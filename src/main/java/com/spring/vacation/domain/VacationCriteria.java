package com.spring.vacation.domain;



import java.util.Calendar;
import java.util.Date;

public class VacationCriteria { 
	
	private Date nowMonth;
	private Date nextMonth;
	
	private String keyType;
	private String keyword;
	
	Calendar cal = Calendar.getInstance();
	Date term=null;
	
	
	public VacationCriteria(Date nowMonth) {
		super();
		this.nowMonth=nowMonth;
		cal.setTime(nowMonth);
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
