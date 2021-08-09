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
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.board.domain.BoardCriteria;
import com.spring.board.domain.BoardPageVO;
import com.spring.board.domain.BoardVO;
import com.spring.board.domain.BoardEventAttachFileDTO;
import com.spring.board.domain.BoardEventVO;
import com.spring.board.service.BoardService;
import com.spring.board.service.BoardEventService;

import lombok.extern.log4j.Log4j2;

@Controller
@Log4j2
@RequestMapping("/board/*")
public class BoardEventController {    //이벤트

	@Autowired
	BCryptPasswordEncoder passwordEncoder;
	
	@Autowired
	private BoardEventService beservice;
	
	@GetMapping("/event/eventlist")
	public void list(Model model,BoardCriteria cri) {
		log.info("전체 리스트 요청 ");
		
		//사용자가 선택한 페이지 게시물
		List<BoardEventVO> eventlist=beservice.belist(cri);
		//전체 게시물 수 
		int total = beservice.betotalCnt(cri);
				
		model.addAttribute("eventlist", eventlist);
		model.addAttribute("BoardEventVO", new BoardPageVO(cri, total));
	}	
	
	
	@GetMapping("/event/eventregister")
	public void register() {
		log.info("새글 등록 폼 요청");
	}
	
	//게시글 등록
	@PostMapping("/event/eventregister")
	public String registerPost(BoardEventVO vo,RedirectAttributes rttr) {
		log.info("새글 등록 요청 "+vo);
		
		//첨부 파일 확인
		if(vo.getEattachList()!=null) {
			vo.getEattachList().forEach(attach -> log.info(""+attach));
		}	
		
		vo.setEpassword(passwordEncoder.encode(vo.getEpassword()));
	      log.info("암호화 패스워드"+vo.getEpassword());
	      
		if(beservice.beinsert(vo)) {
			//log.info("입력된 글 번호 "+vo.getBno());
			rttr.addFlashAttribute("result","올리기 완료");
			return "redirect:eventlist";    
		}else {
			return "redirect:eventregister"; 
		}
	}
	
	
	
	@GetMapping("/event/ehitread")
	public String read(int eno,@ModelAttribute("cri") BoardCriteria cri,Model model) {
		log.info("글 하나 가져오기 "+eno+" cri : "+cri);  
		beservice.beupdateviews(eno);
		model.addAttribute("cri", cri);
		model.addAttribute("eno",eno);
		return "redirect:eventread";
	}
	
	@GetMapping({"/event/eventmodify","/event/eventread"})
	public void modifyget(int eno,@ModelAttribute("cri") BoardCriteria cri,Model model) {
		log.info("글 하나 가져오기 "+eno+" cri : "+cri);  
			
		BoardEventVO vo=beservice.beread(eno);
		model.addAttribute("vo", vo);	//	/board/read  or  /board/modify 
		model.addAttribute("cri", cri);
	}
	
	// modify+post 수정한 후 list
	@PostMapping("/event/eventmodify")
	public String modify(BoardEventVO vo,BoardCriteria cri,RedirectAttributes rttr) {
		log.info("수정 요청 "+vo+" 페이지 나누기 "+cri);
		
		//첨부 파일 확인
		if(vo.getEattachList()!=null) {
			vo.getEattachList().forEach(attach -> log.info(""+attach));
			
		
		beservice.beupdate(vo);		
		
		
		rttr.addFlashAttribute("result","수정 완료");
		
		rttr.addAttribute("type", cri.getType());
		rttr.addAttribute("keyword", cri.getKeyword());
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		
		}
		return "redirect:eventlist";
	}
	
	//수정처리 비밀번호 확인
	@PostMapping("/event/emodifypassword")
	public String eventUpdate(int eno, String epassword, @ModelAttribute BoardEventVO vo,BoardCriteria cri,RedirectAttributes rttr, Model model) {
		//비밀번호 체크
		//log.info("정보 : ",vo);
		
		BoardEventVO pwvo=beservice.besalt(eno);
		
		boolean check=passwordEncoder.matches(vo.getEpassword(), pwvo.getEpassword());
		log.info("비밀번호 확인!! ");
		log.info(check+vo.getEpassword());
		
		if(check) {		
			model.addAttribute("vo",vo);
			rttr.addAttribute("eno",eno);

			rttr.addAttribute("type", cri.getType());
			rttr.addAttribute("keyword", cri.getKeyword());
			rttr.addAttribute("pageNum", cri.getPageNum());
			rttr.addAttribute("amount", cri.getAmount());
				
			return "redirect:eventmodify";
		}else {
			return "redirect:eventlist";
		}
	}
	
	// 관리자 삭제
	@PostMapping("/event/beaddelete")
	public String delete(int eno,BoardCriteria cri,RedirectAttributes rttr) {
		log.info("게시글 삭제 "+eno);
		
		List<BoardEventAttachFileDTO> eattachList=beservice.beAttachList(eno);
		
		deleteFiles(eattachList);
		beservice.beaddelete(eno);	
		
		rttr.addFlashAttribute("result","삭제 완료");
	
		rttr.addAttribute("type", cri.getType());
		rttr.addAttribute("keyword", cri.getKeyword());
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		
		return "redirect:eventlist";
	}
	
	//게시글 삭제 + post
	@PostMapping("/event/eventdelete")
	public String remove(int eno,String epassword,BoardCriteria cri,RedirectAttributes rttr) {
		log.info("게시글 삭제 "+eno);
				
		//서버(폴더)에 저장된 첨부파일 삭제
		//① eno에 해당하는 첨부파일 목록 알아내기
		List<BoardEventAttachFileDTO> eattachList=beservice.beAttachList(eno);
		
		boolean result = beservice.becheckpw(eno, epassword);

		//게시글 삭제 + 첨부파일 삭제
		BoardEventVO pwvo=beservice.besalt(eno);
		boolean check=passwordEncoder.matches(epassword, pwvo.getEpassword());
		log.info(check);
		
		if(check) {
		
			//② 폴더 파일 삭제
			deleteFiles(eattachList);
			
			beservice.bedelete(eno,epassword);
			
			rttr.addFlashAttribute("result","삭제 완료");
		
		
			rttr.addAttribute("type", cri.getType());
			rttr.addAttribute("keyword", cri.getKeyword());
			rttr.addAttribute("pageNum", cri.getPageNum());
			rttr.addAttribute("amount", cri.getAmount());
			
			return "redirect:eventlist";
		}else {
			rttr.addAttribute("eno",eno);
	
			rttr.addAttribute("type", cri.getType());
			rttr.addAttribute("keyword", cri.getKeyword());
			rttr.addAttribute("pageNum", cri.getPageNum());
			rttr.addAttribute("amount", cri.getAmount());
			
			return "redirect:eventread";
		}
	}
	
	
	//첨부물 가져오기
	@GetMapping("/event/getEattachList")
	public ResponseEntity<List<BoardEventAttachFileDTO>> getEattachList(int eno){
		log.info("첨부물 가져오기 "+eno);
		return new ResponseEntity<List<BoardEventAttachFileDTO>>(beservice.beAttachList(eno),HttpStatus.OK);
	}
	
	
	private void deleteFiles(List<BoardEventAttachFileDTO> attachList) {
		log.info("첨부파일 삭제 "+attachList);
		
		if(attachList==null || attachList.size()<=0) {
			return;
		}
		
		for(BoardEventAttachFileDTO dto:attachList) {
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
