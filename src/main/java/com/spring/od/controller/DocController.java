package com.spring.od.controller;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.home.domain.AuthVO;
import com.spring.home.domain.CustomUser;
import com.spring.od.domain.AttachFileDTO;
import com.spring.od.domain.Criteria;
import com.spring.od.domain.OfficeNoticeVO;
import com.spring.od.service.DocService;

import lombok.extern.log4j.Log4j2;

@Controller
@Log4j2
@RequestMapping("/od/*")
public class DocController {
	
	@Autowired
	private DocService service;
	
	
	@PreAuthorize("isAuthenticated()")
	@GetMapping("/register")
	public void register() {
		log.info("새로운 공문 작성 폼 요청");
	}
	
	//공문 등록
	@PreAuthorize("isAuthenticated()")
	@PostMapping("/register")
	public String registerPost(OfficeNoticeVO vo,RedirectAttributes rttr) {
		log.info("새 공문 등록 요청"+vo);
		
		if(vo.getAttach()!=null) {
			vo.getAttach().forEach(attach -> log.info(""+attach));
		}
		
		if(service.owrite(vo)) {
			rttr.addFlashAttribute("result", vo.getDocNum());
			return "redirect:/od/";
		}
		else {
			return "redirect:register";
		}
	}
	@GetMapping({"/tempread","/modify"})
	public void readtemp(int docNum,@ModelAttribute("cri") Criteria cri,Model model) {
		log.info("공문 페이지 가져오기"+docNum+" cri : "+cri);
		
		OfficeNoticeVO vo = service.oread(docNum);
		model.addAttribute("vo", vo);
	}

	@PostMapping("/modify")
	public String modify(OfficeNoticeVO vo,Criteria cri,RedirectAttributes rttr) {
		log.info("수정 요청 "+vo+" 페이지 나누기 "+cri);
		
		//첨부 파일 확인
		if(vo.getAttach()!=null) {
			vo.getAttach().forEach(attach -> log.info(""+attach));
		}	
		
		service.omodify(vo);		
		
		
		rttr.addFlashAttribute("result","성공");
		
		rttr.addAttribute("type", cri.getType());
		rttr.addAttribute("keyword", cri.getKeyword());
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		
		
		return "redirect:/od/";
	}
	
	@PostMapping("/tempread")
	public String tempreadPost(OfficeNoticeVO vo,Criteria cri,@AuthenticationPrincipal CustomUser user,RedirectAttributes rttr) {
		log.info("상신 요청 "+vo+" 페이지 나누기 "+cri);
		
		List<AuthVO> authlist = user.getMemberVO().getAuthority();
		
		String auth="";
		
		for(AuthVO avo:authlist) {
			auth = avo.getAuthority();
		}
		
		if(auth.equals("mg")) {
			service.omodify(vo);					
		}
		else if(auth.equals("ad")) {
			service.oapprove(vo);
		}
		else {
			service.omodify(vo);
		}		
		//첨부 파일 확인
		if(vo.getAttach()!=null) {
			vo.getAttach().forEach(attach -> log.info(""+attach));
		}
		
		rttr.addFlashAttribute("result","성공");
		
		rttr.addAttribute("type", cri.getType());
		rttr.addAttribute("keyword", cri.getKeyword());
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		
		
		return "redirect:/od/";
	}
	
	
	@PostMapping("/remove")
	public String remove(int docNum,Criteria cri,RedirectAttributes rttr) {
		log.info("공문 삭제"+docNum);
		
		List<AttachFileDTO> attachList=service.getAttachList(docNum);
		
		if(service.oremove(docNum)) {
			deleteFiles(attachList);
			rttr.addFlashAttribute("result","성공");
		}
		else {
			log.info("실패");
		}
		
		rttr.addAttribute("type", cri.getType());
		rttr.addAttribute("keyword", cri.getKeyword());
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		
		return "redirect:/od/";
	}
	
	@GetMapping("/getAttachList")
	public ResponseEntity<List<AttachFileDTO>> getAttachList(int docNum){
		log.info("첨부파일 가져오기"+docNum);
		
		return new ResponseEntity<List<AttachFileDTO>>(service.getAttachList(docNum),HttpStatus.OK);
	}
	
	private void deleteFiles(List<AttachFileDTO> attachList) {
		log.info("첨부파일 삭제 "+attachList);
		
		if(attachList==null || attachList.size()<=0) {
			return;
		}
		
		for(AttachFileDTO dto:attachList) {
			String rootPath = "c:\\upload\\od\\"; //개인 첨부파일 저장 최상위 경로(서버측)
			Path path = Paths.get(rootPath,dto.getUploadPath()+"\\"+dto.getUuid()+"_"+dto.getFileName());
			
			try {
				Files.deleteIfExists(path);
				
				if(Files.probeContentType(path).startsWith("image")) {
					Path thumbnail = Paths.get(rootPath, 
							dto.getUploadPath()+"\\s_"+dto.getUuid()+"_"+dto.getFileName());
					Files.delete(thumbnail);
				}
			} catch (IOException e) {				
				e.printStackTrace();
			}
			
		}
	}
	
	
}
