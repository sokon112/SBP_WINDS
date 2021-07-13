package com.spring.od.mapper;

import java.util.List;

import com.spring.od.domain.OfficeNoticeVO;

public interface StorageMapper {
	public List<OfficeNoticeVO> waitList(OfficeNoticeVO vo);
	public List<OfficeNoticeVO> completeList(OfficeNoticeVO vo);
	public List<OfficeNoticeVO> tempList(OfficeNoticeVO vo);
	public List<OfficeNoticeVO> waitSearch(String criteria, String Keyword);
	public List<OfficeNoticeVO> completeSearch(String criteria, String Keyword);
	public List<OfficeNoticeVO> tempSearch(String criteria, String Keyword);
	
}
