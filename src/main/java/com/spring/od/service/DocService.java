package com.spring.od.service;

import com.spring.od.domain.OfficeNoticeVO;

public interface DocService {
	public boolean write(OfficeNoticeVO vo);
	public boolean returned(OfficeNoticeVO vo);
	public boolean approve(OfficeNoticeVO vo);
	public OfficeNoticeVO read(int docNum);
}
