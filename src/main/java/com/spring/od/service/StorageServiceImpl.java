package com.spring.od.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.board.domain.Criteria;
import com.spring.od.domain.OfficeNoticeVO;
import com.spring.od.mapper.StorageMapper;

@Service
public class StorageServiceImpl implements StorageService {
	
	@Autowired
	private StorageMapper mapper;

	@Override
	public List<OfficeNoticeVO> WaitList(com.spring.od.domain.Criteria cri) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<OfficeNoticeVO> CompleteList(com.spring.od.domain.Criteria cri) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<OfficeNoticeVO> TempList(com.spring.od.domain.Criteria cri) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<OfficeNoticeVO> WaitSearch(String criteria, String Keyword) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<OfficeNoticeVO> CompleteSearch(String criteria, String Keyword) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<OfficeNoticeVO> TempSearch(String criteria, String Keyword) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int total(com.spring.od.domain.Criteria cri) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public OfficeNoticeVO read(int docNum) {
		// TODO Auto-generated method stub
		return null;
	}

	

	
	
}
