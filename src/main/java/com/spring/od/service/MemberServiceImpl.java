package com.spring.od.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.home.domain.MemberVO;
import com.spring.home.mapper.MemberMapper;

@Service
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	private MemberMapper mapper;
	
	
	@Override
	public MemberVO memread(String id) {
		return mapper.read(id);
	}

}
