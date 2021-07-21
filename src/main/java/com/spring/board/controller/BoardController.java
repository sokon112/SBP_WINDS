package com.spring.board.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.board.domain.BoardVO;
import com.spring.board.domain.BoardCriteria;
import com.spring.board.domain.BoardPageVO;
import com.spring.board.service.BoardService;

import lombok.extern.log4j.Log4j2;

@Controller
@Log4j2
@RequestMapping("/board/*")
public class BoardController {


	@Autowired
	private BoardService service;
	
	@GetMapping("/")
	public String boardMain() {
		log.info("게시판 메인");
		return "redirect:main/boardlist";
	}
	
	@GetMapping("/main/boardlist")
	public void boardlist(Model model,BoardCriteria cri) {
		log.info("전체 리스트 요청 ");
		
		//사용자가 선택한 페이지 게시물
		List<BoardVO> boardlist=service.boardlist(cri);
		
		//전체 게시물 수 
		int total = service.boardtotal(cri);
		
		log.info("total ",total);
				
		model.addAttribute("boardlist", boardlist);
		model.addAttribute("boardPageVO", new BoardPageVO(cri, total));
	}	
	
	
//	@PreAuthorize("isAuthenticated()") //@PreAuthorize("hasAnyAuthority('ROLE_USER')")
	@GetMapping("/main/boardregister")
	public void boardregister() {
		log.info("새글 등록 폼 요청");
	}
	
	//게시글 등록
//	@PreAuthorize("isAuthenticated()")
	@PostMapping("/main/boardregister")
	public String boardregisterPost(BoardVO vo,RedirectAttributes rttr) {
		log.info("새글 등록 요청 "+vo);
		
		if(service.boardinsert(vo)) {
			//log.info("입력된 글 번호 "+vo.getBno());
			rttr.addFlashAttribute("result", vo.getBno());
			return "redirect:boardlist";    //   redirect:/board/list
		}else {
			return "redirect:boardregister"; //  redirect:/board/register
		}
	}
	
	
	@GetMapping({"/main/boardread","/main/boardmodify"})
	public void read(int bno,@ModelAttribute("cri") BoardCriteria cri,Model model) {
		log.info("글 하나 가져오기 "+bno+" cri : "+cri);  
		
		BoardVO vo=service.boardread(bno);
		model.addAttribute("vo", vo);	//	/board/read  or  /board/modify 
		model.addAttribute("cri", cri);
	}
	
	// modify+post 수정한 후 list
//	@PreAuthorize("principal.username == #vo.nickname")
	@PostMapping("/main/boardmodify")
	public String modify(BoardVO vo,String nickname,BoardCriteria cri,RedirectAttributes rttr) {
		log.info("수정 요청 "+vo+" 페이지 나누기 "+cri);
			
		
		service.boardupdate(vo);		
		
		
		rttr.addFlashAttribute("result","성공");
		
		rttr.addAttribute("type", cri.getType());
		rttr.addAttribute("keyword", cri.getKeyword());
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		
		
		return "redirect:boardlist";
	}
	
	//게시글 삭제 + post
//	@PreAuthorize("principal.username == #nickname")
	@PostMapping("/main/boarddelete")
	public String delete(int bno,String nickname,BoardCriteria cri,RedirectAttributes rttr) {
		log.info("게시글 삭제 "+bno);
		
		
		rttr.addAttribute("type", cri.getType());
		rttr.addAttribute("keyword", cri.getKeyword());
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		
		return "redirect:boardlist";
	}
	
	
	
	
}
