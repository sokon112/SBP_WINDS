package com.spring.od.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.spring.od.domain.Criteria;
import com.spring.od.domain.StorageListVO;

public interface StorageMapper {
	public List<StorageListVO> waitList(@Param("cri")Criteria cri,@Param("deptNum")int deptNum);
	public List<StorageListVO> completeList(@Param("cri")Criteria cri,@Param("deptNum")int deptNum);
	public List<StorageListVO> tempList(@Param("cri")Criteria cri,@Param("id")String id);
	
	public int totalCnt(@Param("cri") Criteria cri);
	
}
