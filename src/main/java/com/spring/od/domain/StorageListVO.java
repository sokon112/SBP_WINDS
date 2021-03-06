package com.spring.od.domain;



import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@ToString

public class StorageListVO {
	private int docNum;
	private String title;
	private String state;
	private String deptName;
	private String id;
	private int deptNum;
	private String name;
	private Date regDate;
	private int retentDate;
	private String storage;
}
