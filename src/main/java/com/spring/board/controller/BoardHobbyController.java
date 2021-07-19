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
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.board.domain.BoardCriteria;
import com.spring.board.domain.BoardHobbyAttachFileDTO;
import com.spring.board.domain.BoardHobbyVO;
import com.spring.board.domain.BoardPageVO;
import com.spring.board.service.BoardService;
import com.spring.board.service.BoardHobbyService;

import lombok.extern.log4j.Log4j2;

@Controller
@Log4j2
@RequestMapping("/board/hobby/*")
public class BoardHobbyController {


	@Autowired
	private BoardHobbyService bhservice;
	
	@GetMapping("/hobbylist")
	public void list(Model model,BoardCriteria cri) {
		log.info("전체 리스트 요청 ");
		
		//사용자가 선택한 페이지 게시물
		List<BoardHobbyVO> hobbylist=bhservice.bhlist(cri);
		//전체 게시물 수 
		int total = bhservice.bhtotalCnt(cri);
				
		model.addAttribute("hobbylist", hobbylist);
		model.addAttribute("BoardhobbyVO", new BoardPageVO(cri, total));  
	}	
	
	
//	@PreAuthorize("isAuthenticated()") 
	@GetMapping("/hobbyregister")
	public void register() {
		log.info("새글 등록 폼 요청");
	}
	
	//게시글 등록
//	@PreAuthorize("isAuthenticated()")
	@PostMapping("/hobbyregister")
	public String registerPost(BoardHobbyVO vo,RedirectAttributes rttr) {
		log.info("새글 등록 요청 "+vo);
		
		//첨부 파일 확인
		if(vo.getHattachList()!=null) {
			vo.getHattachList().forEach(attach -> log.info(""+attach));
		}	
		
		
		if(bhservice.bhinsert(vo)) {
			//log.info("입력된 글 번호 "+vo.getBno());
			rttr.addFlashAttribute("result", vo.getHno());
			return "redirect:list";    //   redirect:/board/list
		}else {
			return "redirect:register"; //  redirect:/board/register
		}
	}
	
	
	
	@GetMapping({"/hobbyread","/hobbymodify"})
	public void read(int no,@ModelAttribute("cri") BoardCriteria cri,Model model) {
		log.info("글 하나 가져오기 "+no+" cri : "+cri);  
		
		BoardHobbyVO vo=bhservice.bhread(no);
		model.addAttribute("vo", vo);	//	/board/read  or  /board/modify 
	}
	
	// modify+post 수정한 후 list
//	@PreAuthorize("principal.username == #vo.writer")
	@PostMapping("/hobbymodify")
	public String modify(BoardHobbyVO vo,BoardCriteria cri,RedirectAttributes rttr) {
		log.info("수정 요청 "+vo+" 페이지 나누기 "+cri);
		
		//첨부 파일 확인
		if(vo.getHattachList()!=null) {
			vo.getHattachList().forEach(attach -> log.info(""+attach));
		}	
		
		bhservice.bhupdate(vo);		
		
		
		rttr.addFlashAttribute("result","성공");
		
		rttr.addAttribute("type", cri.getType());
		rttr.addAttribute("keyword", cri.getKeyword());
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		
		
		return "redirect:list";
	}
	
	//게시글 삭제 + post
//	@PreAuthorize("principal.username == #writer")
	@PostMapping("/hobbydelete")
	public String remove(int no,String writer,BoardCriteria cri,RedirectAttributes rttr) {
		log.info("게시글 삭제 "+no);
		
		
		//서버(폴더)에 저장된 첨부파일 삭제
		//① bno에 해당하는 첨부파일 목록 알아내기
		List<BoardHobbyAttachFileDTO> attachList=bhservice.bhAttachList(no);
		
		//게시글 삭제 + 첨부파일 삭제
		if(bhservice.bhdelete(no)) {
			//② 폴더 파일 삭제
//			deleteFiles(attachList);
			rttr.addFlashAttribute("result","성공");
		}	
		
		rttr.addAttribute("type", cri.getType());
		rttr.addAttribute("keyword", cri.getKeyword());
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		
		return "redirect:list";
	}
	
	
	//첨부물 가져오기
	@GetMapping("/getAttachList")
	public ResponseEntity<List<BoardHobbyAttachFileDTO>> getAttachList(int no){
		log.info("첨부물 가져오기 "+no);		
		return new ResponseEntity<List<BoardHobbyAttachFileDTO>>(bhservice.bhAttachList(no),HttpStatus.OK);
	}
	
	
	private void deleteFiles(List<BoardHobbyAttachFileDTO> attachList) {
		log.info("첨부파일 삭제 "+attachList);
		
		if(attachList==null || attachList.size()<=0) {
			return;
		}
		
		for(BoardHobbyAttachFileDTO dto:attachList) {
			Path path = Paths.get("e:\\upload\\", dto.getUploadPath()+"\\"+dto.getUuid()+"_"+dto.getFileName());
			
			try {
				Files.deleteIfExists(path);
				
				if(Files.probeContentType(path).startsWith("image")) {
					Path thumbnail = Paths.get("e:\\upload\\", 
							dto.getUploadPath()+"\\s_"+dto.getUuid()+"_"+dto.getFileName());
					Files.delete(thumbnail);
				}
			} catch (IOException e) {				
				e.printStackTrace();
			}
			
		}
	}
	
}
