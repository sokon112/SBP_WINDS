package com.spring.vacation.service;

import java.util.Date;
import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.vacation.domain.VacationCriteria;
import com.spring.vacation.domain.VacationVO;
import com.spring.vacation.mapper.VacationMapper;

import lombok.extern.log4j.Log4j2;

@Log4j2
@Service
public class VacationServiceImpl implements VacationService {

	@Autowired
	private VacationMapper mapper;

	@Override
	public List<VacationVO> selectMonth(VacationCriteria cri) {//선택한 월별로 정보 가져오기
		List<VacationVO> selectMapper = mapper.vSelectMonth(cri);
		return selectMapper;
		
	}

	@Override
	public int countApp() {//심사를 하지 않은 신청서의 갯수 추출
		return mapper.vCountApp();
	}

	@Override
	public List<VacationVO> applicationList() {//심사를 받지 않은 신청서 리스트 조회
		return mapper.vApplicationList();
	}

	@Override
	public boolean ok(int vacationAppNum) {//심사- 승인
		boolean flag=mapper.vOk(vacationAppNum)>0?true:false;
		return flag;
	}

	@Override
	public boolean no(int vacationAppNum,String refusalreason) {//심사 거절
		return mapper.vNo(vacationAppNum,refusalreason)>0?true:false;
	}

	@Override
	public boolean insertUserApp(VacationVO vacation) {//신청서 등록
		return mapper.vInsertUserApp(vacation)>0?true:false;
	}

	
	  @Override 
	  public List<VacationVO> showUser(String id,VacationCriteria cri) {//사용자 페이지 목록
		  return mapper.vShowUser(id,cri);
	  }
	 



	@Override
	public VacationVO showUserOne(int vacationAppNum) {// 원하는 문서를 선택시 보여줌
		// TODO Auto-generated method stub
		return mapper.vShowUserOne(vacationAppNum);
	}

	@Override
	public boolean userUpdateApp(VacationVO vacation) {// 문서 내용 수정

		return mapper.vUserUpdateApp(vacation)>0?true:false;
	}

	@Override
	public boolean deleteUserApp(int vacationAppNum) {// 문서 삭제
		// TODO Auto-generated method stub
		return mapper.vDeleteUserApp(vacationAppNum)>0?true:false;
	}

	@Override
	public boolean cancleVacation(VacationVO vacation) { //승인된 문서 반납
		boolean flag=mapper.vCancleVacation(vacation)>0?true:false;
		
		//mapper.changeCnt(vacation.getVacationApplication().getUserid());
		return flag; 

	}

	@Override
	public boolean idCnt(String id) {// 사원의 휴가 개수 가져옴
		return mapper.vIdCnt(id)<40?true:false;
	}

	@Override
	public Date vacationDay(int vacationAppNum) { // 신청서 날짜 불러오는 구문
		return mapper.vVacationDay(vacationAppNum);
	}

	@Override
	public int total(VacationCriteria cri) {// 조건에 맞는 문서 갯수
		return mapper.vTotalCnt(cri);
	}

	@Override
	public boolean vChangeCnt(int vcnt, String id) {// 승인에 변동이 생기는 경우 
		// TODO Auto-generated method stub
		return mapper.vChangeCnt(vcnt, id)>0?true:false;
	}
	

}
