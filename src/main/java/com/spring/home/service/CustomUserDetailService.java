package com.spring.home.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import com.spring.home.domain.CustomUser;
import com.spring.home.domain.MemberVO;
import com.spring.home.mapper.MemberMapper;


import lombok.extern.log4j.Log4j2;


@Log4j2
public class CustomUserDetailService implements UserDetailsService {

	@Autowired
	private MemberMapper mapper;	
	
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		// username => id 와 동일
		log.info("id : "+username);
		
		MemberVO member = mapper.read(username);
		
		log.info("[Member] : "+member);	
		
		
		return new CustomUser(member);
	}

}










