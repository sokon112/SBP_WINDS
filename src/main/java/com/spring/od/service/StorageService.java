package com.spring.od.service;

import java.util.List;

import com.spring.od.domain.Criteria;
import com.spring.od.domain.OfficeNoticeVO;

public interface StorageService {
	public List<OfficeNoticeVO> WaitList(OfficeNoticeVO vo,Criteria cri);
	public List<OfficeNoticeVO> CompleteList(OfficeNoticeVO vo,Criteria cri);
	public List<OfficeNoticeVO> TempList(OfficeNoticeVO vo,Criteria cri);
	
	public int total(Criteria cri);
	
}
