package com.spring.od.controller;

import org.springframework.beans.factory.annotation.Autowired;   
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.od.domain.Criteria;
import com.spring.od.domain.OfficeNoticeVO;
import com.spring.od.service.DocMainService;

import lombok.extern.log4j.Log4j2;

@Controller
@Log4j2
@RequestMapping("/od/*")
public class DocMainController {

	@Autowired
	private DocMainService service;
	
	@GetMapping("/")
	public String odMain() {
		log.info("od 메인 접속....");
		service.mainsuccesslist();
		service.maintemplist();
		service.mainwaitlist();
		return "/od/od_home";
	}
	
	@GetMapping("/mainsearchlist")
	public String mainsearchlist(OfficeNoticeVO vo,Criteria cri) {
		
		log.info("검색결과 요청....");
		service.mainsearchlist(cri, null);
		return "";
		
	}

	
}
