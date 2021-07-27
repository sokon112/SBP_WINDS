package com.spring.vacation.mapper;


import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.spring.vacation.domain.VacationApplicationVO;
import com.spring.vacation.domain.VacationCriteria;
import com.spring.vacation.domain.VacationVO;

public interface VacationMapper {
	//관리자
	public List<VacationVO> vSelectMonth(VacationCriteria cri);
	public VacationApplicationVO vSelectMonthUserData(int holidayAppNum);
	public int vCountApp();
	public List<VacationVO> vApplicationList();
	public int vTotalCnt(VacationCriteria cri);
	
	//승인
	public int vOk(int holidayAppNum);
	public int vNo(@Param("holidayAppNum")int holidayAppNum,@Param("refusalreason")String refusalreason);

	//cnt계산 다시 하기
	public int  vChangeCnt(@Param("vcnt")int vcnt,@Param("id")String id);
	
	//사용자
	public int vInsertUserApp(VacationVO vacation);
	public List<VacationVO> vShowUser(@Param("id")String id,@Param("cri")VacationCriteria cri);
	
	public VacationVO vShowUserOne(int vacationAppNum);
	public int vUserUpdateApp(VacationVO vacation);
	public int vDeleteUserApp(int vacationAppNum);
	public int vCancleVacation(VacationVO vacation);
	public int vIdCnt(String id);
	public Date vVacationDay(int vacationAppNum);
}
