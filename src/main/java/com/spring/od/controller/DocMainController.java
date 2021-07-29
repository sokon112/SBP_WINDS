package com.spring.od.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.od.domain.Criteria;
import com.spring.od.domain.PageVO;
import com.spring.od.domain.StorageListVO;
import com.spring.od.service.DocMainService;

import lombok.extern.log4j.Log4j2;

@Controller
@Log4j2
@RequestMapping("/od/*")
public class DocMainController {

	@Autowired
	private DocMainService service;
	
	@PreAuthorize("isAuthenticated()")
	@RequestMapping("/")
	public String odMain(Model model,Criteria cri) {
		log.info("od 메인 접속....");
		
		List<StorageListVO> completelist =service.maincompletelist();
		List<StorageListVO> templist =service.maintemplist();
		List<StorageListVO> waitlist =service.mainwaitlist();
		
		log.info("completelist : "+completelist + "templist : "+templist + "waitlist : "+waitlist+"criteria : "+cri);
		
		int total = service.odmaintotal(cri);
		
		model.addAttribute("completelist",completelist);
		model.addAttribute("templist",templist);
		model.addAttribute("waitlist",waitlist);
		model.addAttribute("Critera", cri);
		model.addAttribute("pageVO", new PageVO(cri, total));
		
		
		return "/od/od_main";
		
		
	}
	
	@GetMapping("/mainsearchlist")
	public void mainsearchlist(Model model,Criteria cri) {
		log.info("검색 리스트 요청 "+cri);
	
		List<StorageListVO> searchlist= service.mainsearchlist(cri);
		
		int total = service.odmaintotal(cri);
		
		log.info("total : "+total);
		
		model.addAttribute("searchlist", searchlist);
		model.addAttribute("pageVO",new PageVO(cri, total));
	}

	
}
