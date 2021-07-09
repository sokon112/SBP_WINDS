package com.spring.od.service;

import java.util.List;

import com.spring.od.domain.OfficeNoticeVO;

public interface StorageService {
	public List<OfficeNoticeVO> WaitList(OfficeNoticeVO vo);
	public List<OfficeNoticeVO> SuccessList(OfficeNoticeVO vo);
	public List<OfficeNoticeVO> TempList(OfficeNoticeVO vo);
	public List<OfficeNoticeVO> WaitSearch(String criteria, String Keyword);
	public List<OfficeNoticeVO> SuccessSearch(String criteria, String Keyword);
	public List<OfficeNoticeVO> TempSearch(String criteria, String Keyword);
}
