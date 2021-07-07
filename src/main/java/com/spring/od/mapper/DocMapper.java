package com.spring.od.mapper;

import com.spring.od.domain.OfficeNoticeVO;

public interface DocMapper {
	public int write(OfficeNoticeVO vo);
	public int returned(OfficeNoticeVO vo);
	public int approve(OfficeNoticeVO vo);
	public OfficeNoticeVO read(int docNum);
}
