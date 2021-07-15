package com.spring.vacation.controller;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;


import com.spring.vacation.domain.VacationCriteria;
import com.spring.vacation.domain.VacationVO;
import com.spring.vacation.service.VacationServiceImpl;

import lombok.extern.log4j.Log4j2;

@Controller
@Log4j2
@RequestMapping("/vacation/*")
public class VacationController {

	@Autowired
	private VacationServiceImpl service;
	
VacationCriteria cri=new VacationCriteria();
	
	//vacationMine화면 
	@GetMapping("/")	
	public String vacationMain() {
		log.info("vacation 메인 접속....");
		return "/vacation/vacation_home";
	}
	
	//메인메뉴 3가지 
	//id에 따른 휴가 목록 보여주는 페이지 
	@GetMapping("/vacationUserList")
	public void showUserMain( Model model, int id) {
		
		
		log.info("showUser페이지 " +id+" cri : "+cri.getNowMonth());
		
		List<VacationVO> vlist=service.showUser(id,cri);
		
		
		log.info(vlist);
		
		model.addAttribute("cri",cri);
		model.addAttribute("list",vlist);
		
	}//휴가신청서 작성하는 페이지
	@GetMapping("/vacationApply")
	public void vacationApply() {
		log.info("휴가신청 페이지");	
		
	}//관리자가 보는 페이지 
	@GetMapping("/vacationManager")
	public void showAdmin(Model model) {
		log.info("휴가관리 페이지");
		VacationCriteria cri=new VacationCriteria();
		
		List<VacationVO> list=service.selectMonth(cri);
		log.info("list"+list);
		/**/
		
		 for (VacationVO vacation:list) {
		 log.info("vacation.getVacationApplication() :  "
		  +vacation.getVacationApplication().getId()
		  +vacation.getVacationApplication().getName()
		  +vacation.getVacationApplication().getVacationCnt() ); }
		 
		int cnt=service.countApp();
		model.addAttribute("cri",cri);
		model.addAttribute("list",list);
		model.addAttribute("cnt",cnt);		
	}
	
	//사용자 페이지에서 작동하는 컨트롤러
	//리스트에 있는 목록 클릭시
	@GetMapping("/vacationUserListOne")
	public String showUserOne(Model model, int vacationAppNum){
		log.info("사용자의 페이지");
		
		VacationVO vacation = service.showUserOne(vacationAppNum);
		log.info("vacation : "+vacation);
		
		model.addAttribute("vacation",vacation);
		
		if(vacation.getState().equals("승인")) {
			return "redirect:/vacationUserListSuccess";
		}
		else if(vacation.getState().equals("거절")) {
			return "redirect:/vacationUserListReject";
		}else if(vacation.getState().equals("신청")) {
			return "redirect:/vacationUserListModify";
		}else {
			return "/";
		}
	}
	//showUserOne으로 들어온 후 작성했던 휴가신청서 페이지
	@PostMapping("/update")
	public String update(VacationVO vacation) {
		log.info("수정버튼 눌렀을때");
		if(service.userUpdateApp(vacation)) {
			return "redirect:/";
		}else {
			return "redirect:/showUserOne";
		}
	}
	@PostMapping("/delete")
	public String delete(int vacationAppNum) {
		log.info("삭제버튼 눌렀을때");
		if(service.deleteUserApp(vacationAppNum)){
			return "redirect:/vacation/";
		}else {
			return "redirect:/vacation/showUserOne";
		}
		
	}
	@PostMapping("/cancle")
	public String cancle(VacationVO vacation,VacationCriteria cri,Model model,RedirectAttributes rttr) {
		log.info("반납버튼 눌렀을때");
		Date date=new Date();
		boolean result=false;
		Date startday=service.vacationDay(vacation.getVacationApplication().getId());
		if(!date.after(startday)){
			result=service.cancleVacation(vacation);
			if(result) {
				return "redirect:/";
			}else {
				return "redirect:/showUserOne";
			}
		}
		else {
			rttr.addFlashAttribute("cancleError","기간이 지난 휴가입니다.");
			return "redirect:/showUserOne";
		}
			
		
	}

//	휴가신청 작성 페이지
	@PostMapping("/vacationApply")
	public void applyPost(VacationVO vacation,RedirectAttributes rttr){
		log.info("휴가 신청!!");
		
		if(service.idCnt(vacation.getVacationApplication().getId())) {
			//휴가가 20개 이상이면 알람창
			rttr.addFlashAttribute("error","휴가신청 갯수가 넘어 더이상 신청할 수 없습니다.");
			
		}else {
			//휴가가 20개 이하이면
			service.insertUserApp(vacation);
		}
	}
	//관리자가 신청리스트 보는 페이지 
	@GetMapping("/vacationManagerConfirm")
	public void applicationList(Model model) {
		List<VacationVO> list = service.applicationList();
		model.addAttribute("list", list);
	}
	//관리자가 목록중에 하나 눌렀을때 
	@GetMapping("/vacationManagerCheckOne")
	public void vacationManagerCheckOne(Model model, int vacationAppNum){
		log.info("관리자 페이지");
		
		VacationVO vo = service.showUserOne(vacationAppNum);
		model.addAttribute("vo",vo);
	}
	
//	휴가심사 페이지
//	승인 -> PutMapping("/ok")
	//경로지정
	@PutMapping("/{vacationAppNum}/ok")
	public String ok(int vacationAppNum){
		log.info("문서 승인");
		boolean result = service.ok(vacationAppNum);
		return "승인";
	}
	
	
//	거절 -> 모달창 거절사유 작성 후 '확인' ->  PutMapping("/no")
	@PutMapping("/{vacationAppNum}/no")
	public String no(int vacationAppNum,String refusalreason){
		log.info("문서 거절");
		boolean result = service.no(vacationAppNum,refusalreason);
		return "거절";
	}
//	닫기 -> showAdmin 페이지로 넘어감
	
}
