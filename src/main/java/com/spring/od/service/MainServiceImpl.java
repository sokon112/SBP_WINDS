package com.spring.od.service;

import java.util.List;  

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.od.domain.Criteria;
import com.spring.od.domain.OfficeNoticeVO;
import com.spring.od.mapper.MainMapper;

@Service
public class MainServiceImpl implements MainService {

	@Autowired
	private MainMapper mapper;
	
	@Override
	public List<OfficeNoticeVO> mainwaitlist() {
		return mapper.mainwaitlist();
	}

	@Override
	public List<OfficeNoticeVO> mainsuccesslist() {
		return mapper.mainsuccesslist();
	}

	@Override
	public List<OfficeNoticeVO> maintemplist() {
		return mapper.maintemplist();
	}
	
	@Override
	public List<OfficeNoticeVO> searchlist(Criteria criteria, String Keyword) {
		return mapper.searchlist(criteria, Keyword);
	}

}
