package com.spring.handler;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

import lombok.extern.log4j.Log4j2;

@Log4j2
public class CustomLoginSuccessHandler implements AuthenticationSuccessHandler {

	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws IOException, ServletException {
		
		log.info("Login success");
		
		//�������� Ȯ��
		List<String> roleNames = new ArrayList<String>();
		authentication.getAuthorities().forEach(auth -> roleNames.add(auth.getAuthority()));
		
		log.info("roleNames "+roleNames);
		
		
		if(roleNames.contains("ROLE_ADMIN")) {
			response.sendRedirect("/");
			return;
		}
		
		if(roleNames.contains("ROLE_MANAGER") || roleNames.contains("ROLE_USER")) {
			response.sendRedirect("/");
			return;
		}
		response.sendRedirect("/");
	}
}













