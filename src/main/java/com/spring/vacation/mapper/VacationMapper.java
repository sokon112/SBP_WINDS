package com.spring.vacation.mapper;


import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.spring.vacation.domain.VacationCriteria;
import com.spring.vacation.domain.VacationVO;

public interface VacationMapper {
	//관리자
	public List<VacationVO> vSelectMonth(VacationCriteria cri);
	public int vCountApp();
	public List<VacationVO> vApplicationList();
	
	
	//승인
	public int vOk(int holidayAppNum);
	public int vNo(@Param("holidayAppNum")int holidayAppNum,@Param("refusalreason")String refusalreason);

	//cnt계산 다시 하기
	public int  vChangeCnt(int id);

	//사용자
	public int vInsertUserApp(VacationVO vacation);
	public List<VacationVO> vShowUser(@Param("id")int id,@Param("cri")VacationCriteria cri);
	
	public VacationVO vShowUserOne(int vacationAppNum);
	public int vUserUpdateApp(VacationVO vacation);
	public int vDeleteUserApp(int vacationAppNum);
	public int vCancleVacation(VacationVO vacation);
	public int vIdCnt(int id);
	public Date vVacationDay(int vacationAppNum);
}
