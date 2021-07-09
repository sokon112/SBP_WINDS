package com.spring.od.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.od.domain.OfficeNoticeVO;
import com.spring.od.mapper.StorageMapper;

@Service
public class StorageServiceImpl implements StorageService {
	
	@Autowired
	private StorageMapper mapper;

	@Override
	public List<OfficeNoticeVO> WaitList(OfficeNoticeVO vo) {
		return mapper.waitList(vo);
	}

	@Override
	public List<OfficeNoticeVO> SuccessList(OfficeNoticeVO vo) {
		return mapper.successList(vo);
	}

	@Override
	public List<OfficeNoticeVO> TempList(OfficeNoticeVO vo) {
		return mapper.tempList(vo);
	}

	@Override
	public List<OfficeNoticeVO> WaitSearch(String criteria, String Keyword) {
		return mapper.waitSearch(criteria, Keyword);
	}

	@Override
	public List<OfficeNoticeVO> SuccessSearch(String criteria, String Keyword) {
		return mapper.successSearch(criteria, Keyword);
	}

	@Override
	public List<OfficeNoticeVO> TempSearch(String criteria, String Keyword) {
		return mapper.tempSearch(criteria, Keyword);
	}
	
	
}
