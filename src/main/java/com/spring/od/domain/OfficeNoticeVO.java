package com.spring.od.domain;

import java.sql.Date;

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
public class OfficeNoticeVO {
	private int docNum; //공문번호
	private String title; //공문제목
	private String contents; //공문내용
	private String authority; //권한
	private boolean sign; //사인 여부 판단 후 확인
	private boolean attachFile; //첨부파일 있으면 확인
	private int retentDate; // 만료기한 (1~3)
	private int send; // 송신처/송신자사번
	private int dest; // 수신처/결재자사번
	private int review; // 검토자사번
	private String state; // 공문 상태
	private String storage; // 공문보관함
	private String message; // 결재/반려시 메세지 추가
	private Date regDate; //수신일자
}
