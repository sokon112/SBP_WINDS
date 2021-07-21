package com.spring.od.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.od.domain.Criteria;
import com.spring.od.domain.StorageListVO;
import com.spring.od.mapper.StorageMapper;

@Service
public class StorageServiceImpl implements StorageService {
	
	@Autowired
	private StorageMapper mapper;


	@Override
	public int total(Criteria cri) {
		return mapper.totalCnt(cri);
	}
	@Override
	public List<StorageListVO> WaitList(Criteria cri) {
		return mapper.waitList(cri);
	}

	@Override
	public List<StorageListVO> CompleteList(Criteria cri) {
		return mapper.completeList(cri);
	}

	@Override
	public List<StorageListVO> TempList(Criteria cri) {
		return mapper.tempList(cri);
	}

}
