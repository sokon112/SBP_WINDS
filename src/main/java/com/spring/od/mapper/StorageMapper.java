package com.spring.od.mapper;

import java.util.List;

import com.spring.od.domain.Criteria;
import com.spring.od.domain.OfficeNoticeVO;

public interface StorageMapper {
	public List<OfficeNoticeVO> waitList(OfficeNoticeVO vo, Criteria cri);
	public List<OfficeNoticeVO> completeList(OfficeNoticeVO vo, Criteria cri);
	public List<OfficeNoticeVO> tempList(OfficeNoticeVO vo, Criteria cri);
	
	public int totalCnt(Criteria cri);
	
}
