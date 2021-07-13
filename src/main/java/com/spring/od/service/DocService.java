package com.spring.od.service;

import java.util.List;

import com.spring.od.domain.AttachFileDTO;
import com.spring.od.domain.OfficeNoticeVO;

public interface DocService {
	public boolean owrite(OfficeNoticeVO vo);
	public boolean oreturned(OfficeNoticeVO vo);
	public boolean oapprove(OfficeNoticeVO vo);
	public boolean omodify(OfficeNoticeVO vo);
	public boolean oremove(int docNum);
	public OfficeNoticeVO oread(int docNum);
	
	public List<AttachFileDTO> getAttachList(int docNum);

}
