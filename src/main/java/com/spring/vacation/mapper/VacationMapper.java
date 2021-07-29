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
	
	// 휴가 심사 버튼
	public int vOk(int vacationAppNum);
	public int vNo(@Param("vacationAppNum")int vacationAppNum,@Param("refusalreason")String refusalreason);

	// 관리자의 승인과 type, 반납 버튼등 행동에 따라 사용자의 휴가 갯수를 변화
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
