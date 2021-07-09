package com.spring.od.mapper;

import java.util.List; 

import org.apache.ibatis.annotations.Param;

import com.spring.od.domain.OfficeNoticeVO;

public interface MainMapper {
	
	public List<OfficeNoticeVO> MainWaitList();
	public List<OfficeNoticeVO> MainSuccessList();
	public List<OfficeNoticeVO> MainTempList();
	public List<OfficeNoticeVO> search(@Param("criteria")String criteria,@Param("keyword")String keyword);
	
	
	
}
