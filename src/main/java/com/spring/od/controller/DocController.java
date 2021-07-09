package com.spring.od.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.od.domain.OfficeNoticeVO;
import com.spring.od.service.DocService;

import lombok.extern.log4j.Log4j2;

@Controller
@Log4j2
@RequestMapping("/od/*")
public class DocController {
	
	@Autowired
	private DocService service;
	
	//공문 등록
	@PostMapping("/registre")
	public String registerPost(OfficeNoticeVO vo,RedirectAttributes rttr) {
		log.info("새 공문 등록 요청"+vo);
		
		if(vo.getAttach()!=null) {
			vo.getAttach().forEach(attach -> log.info(""+attach));
		}
		
		if(service.write(vo)) {
			rttr.addFlashAttribute("result", vo.getDocNum());
			return "";
		}
		else {
			return "od/od_home";
		}
	}
	
}
