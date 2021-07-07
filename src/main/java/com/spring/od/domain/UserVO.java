package com.spring.od.domain;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@AllArgsConstructor
@NoArgsConstructor

public class UserVO {
	private String id;
	private String password;
	private String name;
	private String telNum;
	private String email;
	private int deptno;
}
