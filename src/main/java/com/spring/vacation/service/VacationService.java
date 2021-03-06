package com.spring.vacation.service;


import java.util.Date;
import java.util.List;

import com.spring.vacation.domain.VacationCriteria;
import com.spring.vacation.domain.VacationVO;

public interface VacationService {
//관리자
	//월별 조회
	public List<VacationVO> selectMonth(VacationCriteria cri);
	//게시글 갯수 조회
	public int total(VacationCriteria cri);
	
	public int countApp();
	//상태가 신청인 것 조회
	public List<VacationVO> applicationList();
	//관리자 승인.거절
	public boolean ok(int vacationAppNum);
	public boolean no(int vacationAppNum,String refusalreason);
	
	//사용자 
	//휴가 신청서 제출
	public boolean insertUserApp(VacationVO vacation);
	//사용자 기간 확인하는 구문
	public List<VacationVO> ShowUserTerm(String id);
	
	//userid에 맞게 정보 검색
	public List<VacationVO> showUser( String id,VacationCriteria cri);
	
	//ㅇ선택한 문서 정보 가져오기 
	public VacationVO showUserOne(int vacationAppNum);
	//문서 수정
	public boolean userUpdateApp(VacationVO vacation);
	//문서 삭제
	public boolean deleteUserApp(int vacationAppNum);
	//반려
	public boolean cancleVacation(VacationVO vacation);
	
	public int idCnt(String id);
	
	
	public Date vacationDay(int vacationAppNum);
	
	//여부에 따라 갯수 수정
	public boolean vChangeCnt(int vcnt,String id);
}
