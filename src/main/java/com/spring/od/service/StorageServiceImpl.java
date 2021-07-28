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
	public List<StorageListVO> WaitList(Criteria cri,int deptNum) {
		return mapper.waitList(cri,deptNum);
	}

	@Override
	public List<StorageListVO> CompleteList(Criteria cri,int deptNum) {
		return mapper.completeList(cri,deptNum);
	}

	@Override
	public List<StorageListVO> TempList(Criteria cri,String id) {
		return mapper.tempList(cri,id);
	}

}
