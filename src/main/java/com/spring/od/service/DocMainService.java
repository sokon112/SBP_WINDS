package com.spring.od.service;

import java.util.List; 

import com.spring.od.domain.Criteria;
import com.spring.od.domain.OfficeNoticeVO;

public interface DocMainService {
	
	public List<OfficeNoticeVO> mainwaitlist();
	public List<OfficeNoticeVO> mainsuccesslist();
	public List<OfficeNoticeVO> maintemplist();
	public List<OfficeNoticeVO> mainsearchlist(Criteria criteria, String Keyword);
}
