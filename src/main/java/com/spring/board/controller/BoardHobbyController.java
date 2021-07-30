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
import com.spring.board.domain.BoardEventAttachFileDTO;
import com.spring.board.domain.BoardEventVO;
import com.spring.board.domain.BoardHobbyAttachFileDTO;
import com.spring.board.domain.BoardHobbyVO;
import com.spring.board.domain.BoardPageVO;
import com.spring.board.domain.BoardVO;
import com.spring.board.service.BoardService;
import com.spring.board.service.BoardHobbyService;

import lombok.extern.log4j.Log4j2;

@Controller
@Log4j2
@RequestMapping("/board/*")
public class BoardHobbyController { //동호회


	@Autowired
	private BoardHobbyService bhservice;
	
	@GetMapping("/hobby/hobbylist")
	public void list(Model model,BoardCriteria cri) {
		log.info("전체 리스트 요청 ");
		
		//사용자가 선택한 페이지 게시물
		List<BoardHobbyVO> hobbylist=bhservice.bhlist(cri);
		//전체 게시물 수 
		int total = bhservice.bhtotalCnt(cri);
				
		model.addAttribute("hobbylist", hobbylist);
		model.addAttribute("BoardHobbyVO", new BoardPageVO(cri, total));  
	}	
	
	
	@GetMapping("/hobby/hobbyregister")
	public void register() {
		log.info("새글 등록 폼 요청");
	}
	
	//게시글 등록
	@PostMapping("/hobby/hobbyregister")
	public String registerPost(BoardHobbyVO vo,RedirectAttributes rttr) {
		log.info("새글 등록 요청 "+vo);
		
		//첨부 파일 확인
		if(vo.getHattachList()!=null) {
			vo.getHattachList().forEach(attach -> log.info(""+attach));
		}	
		
		
		if(bhservice.bhinsert(vo)) {
			//log.info("입력된 글 번호 "+vo.getBno());
			rttr.addFlashAttribute("result", vo.getHno());
			return "redirect:hobbylist";    //   redirect:/board/list
		}else {
			return "redirect:hobbyregister"; //  redirect:/board/register
		}
	}
	
	
	
	@GetMapping("/hobby/hhitread")
	public String read(int hno,@ModelAttribute("cri") BoardCriteria cri,Model model) {
		log.info("글 하나 가져오기 "+hno+" cri : "+cri);  
		bhservice.bhupdateviews(hno);
		model.addAttribute("cri", cri);
		model.addAttribute("hno",hno);
		return "redirect:hobbyread";
	}
	
	@GetMapping({"/hobby/hobbymodify","/hobby/hobbyread"})
	public void modifyget(int hno,@ModelAttribute("cri") BoardCriteria cri,Model model) {
		log.info("글 하나 가져오기 "+hno+" cri : "+cri);  
		
		BoardHobbyVO vo=bhservice.bhread(hno);
		model.addAttribute("vo", vo);	//	/board/read  or  /board/modify 
		model.addAttribute("cri", cri);
	}
	
	// modify+post 수정한 후 list
	@PostMapping("/hobby/hobbymodify")
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
		
		
		return "redirect:hobbylist";
	}
	
	//수정처리 비밀번호 확인
	@PostMapping("/hobby/hmodifypassword")
	public String eventUpdate(int hno, String hpassword, @ModelAttribute BoardHobbyVO vo,BoardCriteria cri,RedirectAttributes rttr, Model model) {
		//비밀번호 체크
		log.info("정보 : ",vo);
		boolean result = bhservice.bhcheckpw(hno, hpassword);
		if(result) {
			model.addAttribute("vo",vo);
			rttr.addAttribute("hno",hno);

			rttr.addAttribute("type", cri.getType());
			rttr.addAttribute("keyword", cri.getKeyword());
			rttr.addAttribute("pageNum", cri.getPageNum());
			rttr.addAttribute("amount", cri.getAmount());
					
			return "redirect:hobbymodify";
		}else {
			return "redirect:hobbylist";
		}
	}
		
		//관리자 삭제
		@PostMapping("/hobby/bhaddelete")
		public String delete(int hno,BoardCriteria cri,RedirectAttributes rttr) {
			log.info("게시글 삭제 "+hno);
				
			List<BoardHobbyAttachFileDTO> hattachList=bhservice.bhAttachList(hno);
			
			deleteFiles(hattachList);
			bhservice.bhaddelete(hno);	
			
			rttr.addFlashAttribute("result","성공");
		
			rttr.addAttribute("type", cri.getType());
			rttr.addAttribute("keyword", cri.getKeyword());
			rttr.addAttribute("pageNum", cri.getPageNum());
			rttr.addAttribute("amount", cri.getAmount());
				
			return "redirect:hobbylist";
		}
	
	
	//게시글 삭제 + post
	@PostMapping("/hobby/hobbydelete")
	public String remove(int hno,String hpassword,String hwriter,BoardCriteria cri,RedirectAttributes rttr) {
		log.info("게시글 삭제 "+hno);
		
		
		//서버(폴더)에 저장된 첨부파일 삭제
		//① hno에 해당하는 첨부파일 목록 알아내기
		List<BoardHobbyAttachFileDTO> attachList=bhservice.bhAttachList(hno);
		
		boolean result = bhservice.bhcheckpw(hno, hpassword);
		
		//게시글 삭제 + 첨부파일 삭제
		if(result) {
			bhservice.bhdelete(hno,hpassword);
			//② 폴더 파일 삭제
			deleteFiles(attachList);
			rttr.addFlashAttribute("result","성공");
		
		
			rttr.addAttribute("type", cri.getType());
			rttr.addAttribute("keyword", cri.getKeyword());
			rttr.addAttribute("pageNum", cri.getPageNum());
			rttr.addAttribute("amount", cri.getAmount());
			
			return "redirect:hobbylist";
		}else {
			rttr.addAttribute("hno",hno);
	
			rttr.addAttribute("type", cri.getType());
			rttr.addAttribute("keyword", cri.getKeyword());
			rttr.addAttribute("pageNum", cri.getPageNum());
			rttr.addAttribute("amount", cri.getAmount());
			
			return "redirect:hobbyread";
		}
	}
	
	
	//첨부물 가져오기
	@GetMapping("/hobby/getHattachList")
	public ResponseEntity<List<BoardHobbyAttachFileDTO>> getAttachList(int hno){
		log.info("첨부물 가져오기 "+hno);		
		return new ResponseEntity<List<BoardHobbyAttachFileDTO>>(bhservice.bhAttachList(hno),HttpStatus.OK);
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
