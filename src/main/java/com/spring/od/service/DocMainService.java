package com.spring.od.service;

import java.util.List; 

import com.spring.od.domain.Criteria;
import com.spring.od.domain.StorageListVO;

public interface DocMainService {
	
	public List<StorageListVO> mainwaitlist(int deptNum);
	public List<StorageListVO> maincompletelist(int deptNum);
	public List<StorageListVO> maintemplist(String id);
	public List<StorageListVO> mainsearchlist(Criteria cri);
	public int odmaintotal(Criteria cri);
}
