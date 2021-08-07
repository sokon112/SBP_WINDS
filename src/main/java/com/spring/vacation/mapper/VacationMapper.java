package com.spring.vacation.mapper;


import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.spring.vacation.domain.VacationCriteria;
import com.spring.vacation.domain.VacationVO;

public interface VacationMapper {

//관리자
	//월에 따라 분류해 정보를 가져오는 mapper
	public List<VacationVO> vSelectMonth(VacationCriteria cri);
	//월에 따라 가져오는 정보를 다르게 해서  총 개수를 가져옴-페이지 넘기기에서 사용
	public int vTotalCnt(VacationCriteria cri);
	//type이 '신청'인 신청서 갯수 추출
	public int vCountApp();
	//type이 '신청'인 리스트만 조회
	public List<VacationVO> vApplicationList();
	// 휴가 심사 버튼-승인
	public int vOk(int vacationAppNum);
	// 휴가 심사 버튼-거절
	public int vNo(@Param("vacationAppNum")int vacationAppNum,@Param("refusalreason")String refusalreason);

	
//공통
	//승인,거절,반납  변동사항 생기는 경우!
	public int  vChangeCnt(@Param("vcnt")int vcnt,@Param("id")String id);
	

//사용자
	//신청서 등록 구문
	public int vInsertUserApp(VacationVO vacation);
	//사용자 기간 확인하는 구문
	public List<VacationVO> vShowUserTerm(String id);
	
	//사용자 페이지에서 보여주는 리스트
	public List<VacationVO> vShowUser(@Param("id")String id,@Param("cri")VacationCriteria cri);
	//신청서 보는 페이지
	public VacationVO vShowUserOne(int vacationAppNum);
	//신청서 페이지 수정구문
	public int vUserUpdateApp(VacationVO vacation);
	//신청서 페이지 - 삭제구문
	public int vDeleteUserApp(int vacationAppNum);
	//신청서 페이지 - 반납구문
	public int vCancleVacation(VacationVO vacation);
	//휴가 개수를 불러오는 구문
	public int vIdCnt(String id);
	//현재 월을 불러오는 구문
	public Date vVacationDay(int vacationAppNum);
	
}
