package com.spring.vacation.mapper;

import java.util.Date;

import com.spring.vacation.domain.VacationVO;

public interface VacationMapper {
	//관리자
	public VacationVO selectMonth(Date nowMonth, Date nextMonth);
	//public int countApp();
	public VacationVO applicationList();
	//승인
	public int ok(int holidayAppNum);
	public int no(int holidayAppNum);

	
	
	//사용자
}
