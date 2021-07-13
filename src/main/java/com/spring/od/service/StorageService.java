package com.spring.od.service;

import java.util.List;

import com.spring.od.domain.Criteria;
import com.spring.od.domain.OfficeNoticeVO;

public interface StorageService {
	public List<OfficeNoticeVO> WaitList(Criteria cri);
	public List<OfficeNoticeVO> CompleteList(Criteria cri);
	public List<OfficeNoticeVO> TempList(Criteria cri);
	public List<OfficeNoticeVO> WaitSearch(String criteria, String Keyword);
	public List<OfficeNoticeVO> CompleteSearch(String criteria, String Keyword);
	public List<OfficeNoticeVO> TempSearch(String criteria, String Keyword);
	public int total(Criteria cri);
	public OfficeNoticeVO read(int docNum);
}
