package com.spring.od.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.log4j.Log4j2;

@Controller
@Log4j2
@RequestMapping("/od/*")
public class ODController {

	@GetMapping("/")	
	public String odMain() {
		log.info("od 메인 접속....");
		return "/od/od_home";
	}
	
}
