package com.spring.vacation.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.spring.vacation.domain.VacationApplicationVO;
import com.spring.vacation.domain.VacationCriteria;
import com.spring.vacation.domain.VacationVO;
import com.spring.vacation.mapper.VacationMapper;

public class VacationServiceImpl implements VacationService {

	@Autowired
	private VacationMapper mapper;

	@Override
	public List<VacationVO> selectMonth(VacationCriteria cri) {
		// TODO Auto-generated method stub
		return mapper.selectMonth(cri);
	}

	@Override
	public int countApp() {
		// TODO Auto-generated method stub
		return mapper.countApp();
	}

	@Override
	public List<VacationVO> applicationList() {
		// TODO Auto-generated method stub
		return mapper.applicationList();
	}

	@Override
	public boolean ok(int vacationAppNum, int userid) {
		boolean flag=mapper.ok(vacationAppNum)>0?true:false;
		mapper.changeCnt(userid);
		return flag;
	}

	@Override
	public boolean no(int vacationAppNum) {
		
		return mapper.no(vacationAppNum)>0?true:false;
	}

	@Override
	public boolean insertUserApp(VacationVO vacation) {
		
		return mapper.insertUserApp(vacation)>0?true:false;
	}

	@Override
	public List<VacationVO> showUser(int userid) {
		
		return mapper.showUser(userid);
	}

	@Override
	public VacationVO showUserOne(int vacationAppNum) {
		// TODO Auto-generated method stub
		return mapper.showUserOne(vacationAppNum);
	}

	@Override
	public boolean userUpdateApp(VacationVO vacation) {

		return mapper.userUpdateApp(vacation)>0?true:false;
	}

	@Override
	public boolean deleteUserApp(int vacationAppNum) {
		// TODO Auto-generated method stub
		return mapper.deleteUserApp(vacationAppNum)>0?true:false;
	}

	@Override
	public boolean cancleVacation(VacationVO vacation) {
		boolean flag=mapper.cancleVacation(vacation)>0?true:false;
		
		mapper.changeCnt(vacation.getVacationApplication().getUserid());
		return flag; 

	}
	

}
