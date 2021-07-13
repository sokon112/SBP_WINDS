package com.spring.od.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.od.domain.Criteria;
import com.spring.od.domain.OfficeNoticeVO;
import com.spring.od.mapper.StorageMapper;

@Service
public class StorageServiceImpl implements StorageService {
	
	@Autowired
	private StorageMapper mapper;


	@Override
	public int total(Criteria cri) {
		return mapper.totalCnt(cri);
	}
	@Override
	public List<OfficeNoticeVO> WaitList(OfficeNoticeVO vo, Criteria cri) {
		return mapper.waitList(vo, cri);
	}

	@Override
	public List<OfficeNoticeVO> CompleteList(OfficeNoticeVO vo, Criteria cri) {
		return mapper.completeList(vo, cri);
	}

	@Override
	public List<OfficeNoticeVO> TempList(OfficeNoticeVO vo, Criteria cri) {
		return mapper.tempList(vo, cri);
	}

}
