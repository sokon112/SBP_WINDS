package com.spring.vacation.domain;

import java.util.Date;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;

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
	private String id;
	private String type;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date startterm;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date endterm;
	private int term;
	private String state;
	private Date applicationDate;
	private Date approvalDate;
	private String reason;
	private String refusalReason;	
	
	@Autowired
	private VacationApplicationVO vacationApplication;
}
