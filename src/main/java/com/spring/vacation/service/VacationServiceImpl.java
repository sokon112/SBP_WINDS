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
	public List<VacationVO> selectMonth(VacationCriteria cri) {
		List<VacationVO> selectMapper = mapper.vSelectMonth(cri);
		log.info("selectMonth : "+selectMapper);
//		for(VacationVO vo : selectMapper) {
//
//			 
//			VacationApplicationVO vo1=mapper.vSelectMonthUserData(vo.getVacationAppNum());
//
//			vo.getVacationApplication().setId(vo1.getId());
//			vo.getVacationApplication().setName(vo1.getName());
//		}
		log.info("selectMonth : "+selectMapper);
		
		return selectMapper;
		
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
	  public List<VacationVO> showUser(String id,VacationCriteria cri) {
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
	public boolean idCnt(String id) {
		return mapper.vIdCnt(id)<40?true:false;
	}

	@Override
	public Date vacationDay(int vacationAppNum) {

		return mapper.vVacationDay(vacationAppNum);
	}

	@Override
	public int total(VacationCriteria cri) {
		return mapper.vTotalCnt(cri);
	}

	@Override
	public boolean vChangeCnt(int vcnt, String id) {
		// TODO Auto-generated method stub
		return mapper.vChangeCnt(vcnt, id)>0?true:false;
	}
	

}
