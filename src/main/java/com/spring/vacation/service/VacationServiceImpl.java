package com.spring.vacation.service;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.vacation.domain.VacationApplicationVO;
import com.spring.vacation.domain.VacationCriteria;
import com.spring.vacation.domain.VacationVO;
import com.spring.vacation.mapper.VacationMapper;

@Service
public class VacationServiceImpl implements VacationService {

	@Autowired
	private VacationMapper mapper;

	@Override
	public List<VacationVO> selectMonth(VacationCriteria cri) {
		// TODO Auto-generated method stub
		return mapper.vSelectMonth(cri);
	}

	@Override
	public int countApp() {
		// TODO Auto-generated method stub
		return mapper.vCountApp();
	}

	@Override
	public List<VacationVO> applicationList() {
		// TODO Auto-generated method stub
		return mapper.vApplicationList();
	}

	@Override
	public boolean ok(int vacationAppNum) {
		boolean flag=mapper.vOk(vacationAppNum)>0?true:false;
		return flag;
	}

	@Override
	public boolean no(int vacationAppNum,String refusalreason) {
		
		return mapper.vNo(vacationAppNum,refusalreason)>0?true:false;
	}

	@Override
	public boolean insertUserApp(VacationVO vacation) {
		
		return mapper.vInsertUserApp(vacation)>0?true:false;
	}

	
	  @Override 
	  public List<VacationVO> showUser(int id,VacationCriteria cri) {
		  return mapper.vShowUser(id,cri);
	  }
	 



	@Override
	public VacationVO showUserOne(int vacationAppNum) {
		// TODO Auto-generated method stub
		return mapper.vShowUserOne(vacationAppNum);
	}

	@Override
	public boolean userUpdateApp(VacationVO vacation) {

		return mapper.vUserUpdateApp(vacation)>0?true:false;
	}

	@Override
	public boolean deleteUserApp(int vacationAppNum) {
		// TODO Auto-generated method stub
		return mapper.vDeleteUserApp(vacationAppNum)>0?true:false;
	}

	@Override
	public boolean cancleVacation(VacationVO vacation) {
		boolean flag=mapper.vCancleVacation(vacation)>0?true:false;
		
		//mapper.changeCnt(vacation.getVacationApplication().getUserid());
		return flag; 

	}

	@Override
	public boolean idCnt(int id) {
		return mapper.vIdCnt(id)>20?true:false;
	}

	@Override
	public Date vacationDay(int vacationAppNum) {

		return mapper.vVacationDay(vacationAppNum);
	}
	

}
