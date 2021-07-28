package com.spring.od.service;

import java.util.List;

import com.spring.od.domain.Criteria;
import com.spring.od.domain.StorageListVO;

public interface StorageService {
	public List<StorageListVO> WaitList(Criteria cri,int deptNum);
	public List<StorageListVO> CompleteList(Criteria cri,int deptNum);
	public List<StorageListVO> TempList(Criteria cri,String id);
	
	public int total(Criteria cri);
	
}
