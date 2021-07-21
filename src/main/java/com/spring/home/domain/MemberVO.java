package com.spring.home.domain;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@ToString
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class MemberVO {
	private String id;
	private String password;
	private String name;
	private String telNum;
	private String email;
	private String deptNum;
	
	private List<AuthVO> authority; 
}









