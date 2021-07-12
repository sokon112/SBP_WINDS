package com.spring.board.controller;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.board.domain.CommentPageVO;
import com.spring.board.domain.CommentVO;
import com.spring.board.domain.Criteria;
import com.spring.board.service.CommentService;

import lombok.extern.log4j.Log4j2;

@Controller
@Log4j2
@RequestMapping("/comment/*")
public class CommentController {
	
	@Autowired
	private CommentService service;
	
	
	@PreAuthorize("isAuthenticated()")
	@PostMapping("/new")
	public ResponseEntity<String> create(@RequestBody CommentVO comment){
		log.info("댓글 삽입 요청 "+comment);
		
		return service.insert(comment)?new ResponseEntity<String>("success",HttpStatus.OK):
			new ResponseEntity<String>("fail",HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	
	
	@PreAuthorize("principal.username == #comment.replyer")
	@PutMapping("/{rno}")
	public ResponseEntity<String> update(@PathVariable("bno") int rno,@RequestBody CommentVO comment){
		log.info("댓글 수정 "+bno+" 수정 내용 "+comment);
				
		comment.setBno(bno);
		
		return service.commentUpdate(comment)?new ResponseEntity<String>("success",HttpStatus.OK):
			new ResponseEntity<String>("fail",HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	@PreAuthorize("principal.username == #vo.replyer")
	@DeleteMapping("/{bno}")
	public ResponseEntity<String> delete(@PathVariable("rno") int rno,@RequestBody CommentVO vo){
		log.info("댓글 삭제 "+bno);		
		
		return service.commentDelete(rno)?new ResponseEntity<String>("success",HttpStatus.OK):
			new ResponseEntity<String>("fail",HttpStatus.BAD_REQUEST);
	}
	
	@GetMapping("/pages/{bno}/{page}")
	public ResponseEntity<CommentPageVO> getList(@PathVariable("bno") int bno,@PathVariable("page") int page){
		log.info("댓글 가져오기 "+bno+" page "+page);
		
		Criteria cri = new Criteria(page, 10);
		
		return new ResponseEntity<CommentPageVO>(service.getList(cri, bno),HttpStatus.OK);
		
	}
	
}
