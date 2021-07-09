package com.spring.od.service;

import java.util.List;

import com.spring.od.domain.AttachFileDTO;
import com.spring.od.domain.OfficeNoticeVO;

public interface DocService {
	public boolean write(OfficeNoticeVO vo);
	public boolean returned(OfficeNoticeVO vo);
	public boolean approve(OfficeNoticeVO vo);
	public OfficeNoticeVO read(int docNum);
	
	public List<AttachFileDTO> getAttachList(int docNum);
	
	public int test();
}
