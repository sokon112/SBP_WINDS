package com.spring.od.mapper;

import java.util.List;

import com.spring.od.domain.Criteria;
import com.spring.od.domain.OfficeNoticeVO;

public interface StorageMapper {
	public List<OfficeNoticeVO> waitList(Criteria cri);
	public List<OfficeNoticeVO> completeList(Criteria cri);
	public List<OfficeNoticeVO> tempList(Criteria cri);
	
	public int totalCnt(Criteria cri);
	
}
