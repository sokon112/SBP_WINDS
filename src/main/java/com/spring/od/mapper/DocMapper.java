package com.spring.od.mapper;

import com.spring.od.domain.OfficeNoticeVO;

public interface DocMapper {
	public int owrite(OfficeNoticeVO vo);
	public int oreturned(OfficeNoticeVO vo);
	public int oapprove(OfficeNoticeVO vo);
	public int omodify(OfficeNoticeVO vo);
	public int oremove(int docNum);
	public OfficeNoticeVO oread(int docNum);
}
