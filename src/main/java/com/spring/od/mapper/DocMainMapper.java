package com.spring.od.mapper;

import java.util.List; 


import org.apache.ibatis.annotations.Param;

import com.spring.od.domain.Criteria;
import com.spring.od.domain.OfficeNoticeVO;

public interface DocMainMapper {
	
	public List<OfficeNoticeVO> mainwaitlist();
	public List<OfficeNoticeVO> mainsuccesslist();
	public List<OfficeNoticeVO> maintemplist();
	public List<OfficeNoticeVO> mainsearchlist(Criteria cri);
	
	
	
}
