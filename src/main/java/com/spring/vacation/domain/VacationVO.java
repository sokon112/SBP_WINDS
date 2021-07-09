package com.spring.vacation.domain;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Setter
@Getter
@ToString
public class VacationVO {

	private int vacationAppNum;
	private String type;
	private Date startterm;
	private Date endterm;
	private String state;
	private Date applicationDate;
	private Date approvalDate;
	private String reason;
	private String refusalReason;	
	
	private VacationApplicationVO vacationApplication;
}
