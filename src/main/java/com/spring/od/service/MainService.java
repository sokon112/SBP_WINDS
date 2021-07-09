package com.spring.od.service;

import java.util.List;

import com.spring.od.domain.OfficeNoticeVO;

public interface MainService {
	
	public List<OfficeNoticeVO> MainWaitList();
	public List<OfficeNoticeVO> MainSuccessList();
	public List<OfficeNoticeVO> MainTempList();
	public List<OfficeNoticeVO> searchList(String criteria, String Keyword);
}
