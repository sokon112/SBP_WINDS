package com.spring.od.mapper;

import java.util.List;

import com.spring.od.domain.Criteria;
import com.spring.od.domain.StorageListVO;

public interface StorageMapper {
	public List<StorageListVO> waitList(Criteria cri);
	public List<StorageListVO> completeList(Criteria cri);
	public List<StorageListVO> tempList(Criteria cri);
	
	public int totalCnt(Criteria cri);
	
}
