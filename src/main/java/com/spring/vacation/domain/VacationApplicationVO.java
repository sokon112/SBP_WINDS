package com.spring.vacation.domain;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@ToString
@AllArgsConstructor
@Setter
@Getter
public class VacationApplicationVO {

	private int id;
	private String name;
	private int VacationCnt;
}
