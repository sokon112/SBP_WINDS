package com.spring.board.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.board.domain.BoardCommentPageVO;
import com.spring.board.domain.BoardCommentVO;
import com.spring.board.domain.BoardCriteria;
import com.spring.board.domain.BoardVO;
import com.spring.board.service.BoardCommentService;

import lombok.extern.log4j.Log4j2;

@Controller
@Log4j2
@RequestMapping("/comment/*")
public class BoardCommentController {

	@Autowired
	BCryptPasswordEncoder passwordEncoder;

	@Autowired
	private BoardCommentService service;

	// 댓글 등록
	@PostMapping("/new")
	public ResponseEntity<String> create(@RequestBody BoardCommentVO comment) {
		log.info("댓글 삽입 요청 " + comment);

		comment.setPassword(passwordEncoder.encode(comment.getPassword()));
		log.info("암호화 패스워드" + comment.getPassword());

		return service.bcinsert(comment) ? new ResponseEntity<String>("success", HttpStatus.OK)
				: new ResponseEntity<String>("fail", HttpStatus.INTERNAL_SERVER_ERROR);
	}

	// 댓글 읽기
	@GetMapping("/{dno}")
	public ResponseEntity<BoardCommentVO> get(@PathVariable("dno") int dno) {
		log.info("댓글 하나 불러오기" + dno);

		return new ResponseEntity<>(service.bcread(dno), HttpStatus.OK);
	}

	// 댓글 수정
	@PutMapping("/{dno}")
	public ResponseEntity<String> update(@PathVariable("dno") int dno, @RequestBody BoardCommentVO comment) {
		log.info("댓글 수정 " + dno + " 수정 내용 " + comment);

		BoardCommentVO pwvo=service.bcsalt(dno);
		
		boolean check=passwordEncoder.matches(comment.getPassword(), pwvo.getPassword());
		log.info(check + comment.getPassword());
		
		comment.setDno(dno);
		boolean result = false;
		String password = service.bcread(dno).getPassword();
		log.info(password + " ?? " + comment.getPassword());
		
		if (check) {
			result = service.bcupdate(comment);
		}
		
		log.info(result);
		return result ? new ResponseEntity<String>("success", HttpStatus.OK)
				: new ResponseEntity<String>("fail", HttpStatus.INTERNAL_SERVER_ERROR);
	}

	// 댓글 삭제
	@DeleteMapping("/{dno}")
	public ResponseEntity<String> delete(@PathVariable("dno") int dno, @RequestBody BoardCommentVO vo) {
		log.info("댓글 삭제 " + dno);
		log.info("정보" + vo.getPassword());

		BoardCommentVO pwvo=service.bcsalt(dno);
		boolean check=passwordEncoder.matches(vo.getPassword(), pwvo.getPassword());
		log.info(check);
		
		boolean result = false;
		String passworddefault = service.bcread(dno).getPassword();
		
		if (check) {
			result = service.bcdelete(dno);
		}

		return result ? new ResponseEntity<String>("success", HttpStatus.OK)
				: new ResponseEntity<String>("fail", HttpStatus.BAD_REQUEST);
	}

	// 댓글 가져오기
	@GetMapping("/pages/{bno}/{page}")
	public ResponseEntity<BoardCommentPageVO> getList(@PathVariable("bno") int bno, @PathVariable("page") int page) {
		log.info("댓글 가져오기 " + bno + " page " + page);

		BoardCriteria cri = new BoardCriteria(page, 10);

		return new ResponseEntity<BoardCommentPageVO>(service.bclist(cri, bno), HttpStatus.OK);

	}

}