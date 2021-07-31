package com.spring.vacation.service;

import java.util.Date;
import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.vacation.domain.VacationCriteria;
import com.spring.vacation.domain.VacationVO;
import com.spring.vacation.mapper.VacationMapper;



@Service
public class VacationServiceImpl implements VacationService {
//vacationMapper가져와서 사용
	@Autowired
	private VacationMapper mapper;
	
//관리자 페이지에서 데이터 리스트 불러오는 구문
	@Override
	public List<VacationVO> selectMonth(VacationCriteria cri) {//선택한 월별로 정보 가져오기
		List<VacationVO> selectMapper = mapper.vSelectMonth(cri);
		return selectMapper;
	}
	//월에 따라 가져오는 정보를 다르게 해서  총 개수를 가져옴-페이지 넘기기에서 사용
	@Override
	public int total(VacationCriteria cri) {// 조건에 맞는 문서 갯수
		return mapper.vTotalCnt(cri);
	}
	//type이 '신청'인 신청서 갯수 추출
	@Override
	public int countApp() {
		return mapper.vCountApp();
	}
	//type이 '신청'인 리스트만 조회	
	@Override
	public List<VacationVO> applicationList() {
		return mapper.vApplicationList();
	}
	// 휴가 심사 버튼-승인
	@Override
	public boolean ok(int vacationAppNum) {//심사- 승인
		boolean flag=mapper.vOk(vacationAppNum)>0?true:false;
		return flag;
	}
	// 휴가 심사 버튼-거절
	@Override
	public boolean no(int vacationAppNum,String refusalreason) {//심사 거절
		return mapper.vNo(vacationAppNum,refusalreason)>0?true:false;
	}
	
	//공통
	//승인,거절,반납  변동사항 생기는 경우!
	@Override
	public boolean vChangeCnt(int vcnt, String id) {
		// TODO Auto-generated method stub
		return mapper.vChangeCnt(vcnt, id)>0?true:false;
	}
	
	//사용자
	//신청서 등록 구문
	@Override
	public boolean insertUserApp(VacationVO vacation) {//신청서 등록
		return mapper.vInsertUserApp(vacation)>0?true:false;
	}
	//사용자 페이지에서 보여주는 리스트
	@Override 
	public List<VacationVO> showUser(String id,VacationCriteria cri) {//사용자 페이지 목록
		return mapper.vShowUser(id,cri);
	}
	//신청서 보는 페이지
	@Override
	public VacationVO showUserOne(int vacationAppNum) {// 원하는 문서를 선택시 보여줌
		// TODO Auto-generated method stub
		return mapper.vShowUserOne(vacationAppNum);
	}
	//신청서 페이지 수정구문
	@Override
	public boolean userUpdateApp(VacationVO vacation) {

		return mapper.vUserUpdateApp(vacation)>0?true:false;
	}
	//신청서 페이지 - 삭제구문
	@Override
	public boolean deleteUserApp(int vacationAppNum) {
		// TODO Auto-generated method stub
		return mapper.vDeleteUserApp(vacationAppNum)>0?true:false;
	}
	//신청서 페이지 - 반납구문
	@Override
	public boolean cancleVacation(VacationVO vacation) {
		boolean flag=mapper.vCancleVacation(vacation)>0?true:false;
		return flag; 
	}
	//휴가 개수를 불러오는 구문
	@Override
	public int idCnt(String id) {
		return mapper.vIdCnt(id);
	}
	//현재 월을 불러오는 구문
	@Override
	public Date vacationDay(int vacationAppNum) {
		return mapper.vVacationDay(vacationAppNum);
	}

	

	
	

}
