package com.spring.od.service;

import java.util.List; 

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.od.domain.OfficeNoticeVO;
import com.spring.od.mapper.MainMapper;

@Service
public class MainServiceImpl implements MainService {

	@Autowired
	private MainMapper mapper;
	
	@Override
	public List<OfficeNoticeVO> MainWaitList() {
		return mapper.MainWaitList();
	}

	@Override
	public List<OfficeNoticeVO> MainSuccessList() {
		return mapper.MainSuccessList();
	}

	@Override
	public List<OfficeNoticeVO> MainTempList() {
		return mapper.MainTempList();
	}
	
	@Override
	public List<OfficeNoticeVO> searchList(String criteria, String Keyword) {
		return mapper.searchList(criteria, Keyword);
	}

}
