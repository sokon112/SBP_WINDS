package com.spring.od.service;

import java.util.List;

import com.spring.od.domain.Criteria;
import com.spring.od.domain.StorageListVO;

public interface StorageService {
	public List<StorageListVO> WaitList(Criteria cri);
	public List<StorageListVO> CompleteList(Criteria cri);
	public List<StorageListVO> TempList(Criteria cri);
	
	public int total(Criteria cri);
	
}
