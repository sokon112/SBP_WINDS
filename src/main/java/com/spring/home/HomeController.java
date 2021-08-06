package com.spring.home;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
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
	public String home(Model model,HttpServletRequest request) {
		log.info("SBP_Winds MAIN ");
		
		String loginSuccessKey = "";
		
		HttpSession session = request.getSession();		
		loginSuccessKey = (String)session.getAttribute("loginSuccessKey");
		log.info(loginSuccessKey);
		
		if(loginSuccessKey!="") {;
			model.addAttribute("loginSuccessKey", loginSuccessKey);
		}
		session.removeAttribute("loginSuccessKey");
		
		return "home";
	}
	
	@GetMapping("/login")
	public String loginGet() {
		log.info("login 페이지 접속");
		return "/member/loginForm";
	}
	
	@PostMapping("/login")
	public String loginPost() {
		log.info("login 시도");
		return "redirect: /";
	}
	

	@GetMapping("/member/login-error")
	public String loginError(Model model) {
		
		model.addAttribute("loginError", "아이디 또는 비밀번호가 일치하지 않습니다.");
		
		return "home";
	}
	
}
