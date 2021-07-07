package com.spring.od.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class AttachFileDTO {
	private String uploadPath;
	private String fileName;
	private boolean fileType;
	private int docnum;
}
