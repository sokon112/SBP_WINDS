package com.spring.home;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import lombok.extern.log4j.Log4j2;

/**
 * 
 */
@Controller
@Log4j2
public class HomeController {
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home() {
		log.info("SBP_Winds MAIN ");
		return "home";
	}
	
	@RequestMapping("/test")
	public String test() {
		return "test";
	}
	
}
