package com.spring.od.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.od.domain.Criteria;
import com.spring.od.domain.OfficeNoticeVO;
import com.spring.od.domain.PageVO;
import com.spring.od.service.StorageService;
import com.spring.od.service.DocService;
import lombok.extern.log4j.Log4j2;

@Controller
@Log4j2
@RequestMapping("/od/*")
public class StorageController {
	
	@Autowired
	private StorageService service;
	
	//header '보관함',메인 페이지 '미결 문서 보관함' 클릭시
	@GetMapping("/waitlist")
	public void waitList(Model model,Criteria cri) {
		log.info("미결 문서 보관함 요청");
		
		List<OfficeNoticeVO> waitlist = service.WaitList(cri);
		
		int total = service.total(cri);
		
		model.addAttribute("waitlist",waitlist);
		model.addAttribute("PageVO", new PageVO(cri, total));
	}
	
	//메인페이지 및 각 보관함 사이드바 '결제 완료 문서함' 클릭시
	@GetMapping("/completelist")
	public void completeList(Model model,Criteria cri) {
		log.info("결재 완료 문서 보관함 요청");
		
		List<OfficeNoticeVO> completelist = service.CompleteList(cri);
		
		int total = service.total(cri);
		
		model.addAttribute("completelist",completelist);
		model.addAttribute("PageVO", new PageVO(cri, total));
	}
	
	//메인페이지 및 각 보관함 사이드바 '임시 보관함' 클릭시
	@GetMapping("/templist")
	public void templist(Model model,Criteria cri) {
		log.info("임시 문서 보관함 요청 ");
		
		List<OfficeNoticeVO> templist = service.TempList(cri);
		
		int total = service.total(cri);
		
		model.addAttribute("templist",templist);
		model.addAttribute("PageVO", new PageVO(cri, total));
	}
	
	
}
