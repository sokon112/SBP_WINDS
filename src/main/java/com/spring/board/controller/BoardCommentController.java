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

import com.spring.board.domain.BoardCommentPageVO;
import com.spring.board.domain.BoardCommentVO;
import com.spring.board.domain.BoardCriteria;
import com.spring.board.service.BoardCommentService;

import lombok.extern.log4j.Log4j2;

@Controller
@Log4j2
@RequestMapping("/comment/*")
public class BoardCommentController {
   
   @Autowired
   private BoardCommentService service;
   
   
   @PostMapping("/new")
   public ResponseEntity<String> create(@RequestBody BoardCommentVO comment){
      log.info("댓글 삽입 요청 "+comment);
      
      return service.bcinsert(comment)?new ResponseEntity<String>("success",HttpStatus.OK):
         new ResponseEntity<String>("fail",HttpStatus.INTERNAL_SERVER_ERROR);
   }
   
   
   
   @PutMapping("/{dno}")
   public ResponseEntity<String> update(@PathVariable("dno") int dno,@RequestBody BoardCommentVO comment){
      log.info("댓글 수정 "+dno+" 수정 내용 "+comment);
            
      comment.setDno(dno);
      
      return service.bcupdate(comment)?new ResponseEntity<String>("success",HttpStatus.OK):
         new ResponseEntity<String>("fail",HttpStatus.INTERNAL_SERVER_ERROR);
   }
   
   @DeleteMapping("/{dno}")
   public ResponseEntity<String> delete(@PathVariable("dno") int dno,@RequestBody BoardCommentVO vo){
      log.info("댓글 삭제 "+dno);      
      
      return service.bcdelete(dno)?new ResponseEntity<String>("success",HttpStatus.OK):
         new ResponseEntity<String>("fail",HttpStatus.BAD_REQUEST);
   }
   
   @PostMapping("/pages/{bno}/{page}")
   public ResponseEntity<BoardCommentPageVO> getList(@PathVariable("bno") int bno,@PathVariable("page") int page){
      log.info("댓글 가져오기 "+bno+" page "+page);
      
      BoardCriteria cri = new BoardCriteria(page, 10);
      
      return new ResponseEntity<BoardCommentPageVO>(service.bclist(cri, bno),HttpStatus.OK);
      
   }
   
   
}