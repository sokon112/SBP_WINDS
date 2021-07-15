package com.spring.od.service;

import java.util.List;  

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.od.domain.Criteria;
import com.spring.od.domain.OfficeNoticeVO;
import com.spring.od.mapper.DocMainMapper;

@Service
public class DocMainServiceImpl implements DocMainService {

	@Autowired
	private DocMainMapper mapper;
	
	//미결 불러오기
	@Override
	public List<OfficeNoticeVO> mainwaitlist() {
		return mapper.mainwaitlist();
	}

	//결재완료보관함 불러오기
	@Override
	public List<OfficeNoticeVO> mainsuccesslist() {
		return mapper.mainsuccesslist();
	}

	//임시보관함 불러오기!
	@Override
	public List<OfficeNoticeVO> maintemplist() {
		return mapper.maintemplist();
	}
	
	//검색
	@Override
	public List<OfficeNoticeVO> mainsearchlist(Criteria cri) {
		return mapper.mainsearchlist(cri);
	}

}
