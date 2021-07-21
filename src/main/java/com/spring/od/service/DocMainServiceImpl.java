package com.spring.od.service;

import java.util.List;  

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.od.domain.Criteria;
import com.spring.od.domain.StorageListVO;
import com.spring.od.mapper.DocMainMapper;

@Service
public class DocMainServiceImpl implements DocMainService {

	@Autowired
	private DocMainMapper mapper;
	
	//미결 불러오기
	@Override
	public List<StorageListVO> mainwaitlist() {
		return mapper.mainwaitlist();
	}

	//결재완료보관함 불러오기
	@Override
	public List<StorageListVO> maincompletelist() {
		return mapper.maincompletelist();
	}

	//임시보관함 불러오기!
	@Override
	public List<StorageListVO> maintemplist() {
		return mapper.maintemplist();
	}
	
	//검색
	@Override
	public List<StorageListVO> mainsearchlist(Criteria cri) {
		return mapper.mainsearchlist(cri);
	}

	@Override
	public int odmaintotal(Criteria cri) {
		int total = mapper.odmaintotalcnt(cri);
		return total;
	}

}
