package com.spring.od.mapper;

import java.util.List; 


import org.apache.ibatis.annotations.Param;

import com.spring.od.domain.Criteria;
import com.spring.od.domain.StorageListVO;

public interface DocMainMapper {
	
	public List<StorageListVO> mainwaitlist(int deptNum);
	public List<StorageListVO> maincompletelist(int deptNum);
	public List<StorageListVO> maintemplist(String id);
	public List<StorageListVO> mainsearchlist(Criteria cri);
	public int odmaintotalcnt(Criteria cri);
	
	
	
}
