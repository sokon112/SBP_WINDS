package com.spring.vacation.domain;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@ToString
@AllArgsConstructor
@Setter
@Getter
public class VacationApplicationVO {

//사용자 정보 가져오는 vo
	private String name;
	private int VacationCnt;
}
