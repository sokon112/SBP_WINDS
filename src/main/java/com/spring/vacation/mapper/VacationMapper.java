package com.spring.vacation.mapper;


import java.util.Date;
import java.util.List;

import com.spring.vacation.domain.VacationCriteria;
import com.spring.vacation.domain.VacationVO;

public interface VacationMapper {
	//관리자
	public List<VacationVO> selectMonth(VacationCriteria cri);
	public int countApp();
	public List<VacationVO> applicationList();
	
	
	//승인
	public int ok(int holidayAppNum);
	public int no(int holidayAppNum,String refusalreason);

	//cnt계산 다시 하기
	//public int  changeCnt(int id);

	//사용자
	public int insertUserApp(VacationVO vacation);
	public List<VacationVO> showUser(int id);
	public VacationVO showUserOne(int vacationAppNum);
	public int userUpdateApp(VacationVO vacation);
	public int deleteUserApp(int vacationAppNum);
	public int cancleVacation(VacationVO vacation);
	public int idCnt(int id);
	public Date vacationDay(int vacationAppNum);
}
