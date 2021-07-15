package com.spring.od.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;   

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
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
		return "/od/od_main";
	}
	
	@GetMapping("/mainsearchlist")
	public void mainsearchlist(Model model,Criteria cri) {
		log.info("검색 리스트 요청 "+cri);
	
		List<OfficeNoticeVO> searchlist= service.mainsearchlist(cri);
		
		model.addAttribute("searchlist", searchlist);
	}

	
}
