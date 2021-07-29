package com.spring.vacation.controller;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.spring.vacation.domain.VacationCriteria;
import com.spring.vacation.domain.VacationPageVO;
import com.spring.vacation.domain.VacationVO;
import com.spring.vacation.service.VacationServiceImpl;

import lombok.extern.log4j.Log4j2;

@Controller
@Log4j2
@RequestMapping("/vacation/*")
public class VacationController {

	@Autowired
	private VacationServiceImpl service;

	//휴가 관리에 들어오면 처음으로 보여주는화면=> 신청서 작성
	@PreAuthorize("isAuthenticated()")
	@RequestMapping("/")	
	public String vacationMain() {
		log.info("vacation 메인 접속....");
		return "/vacation/vacationApply";
	}
	
	//메인메뉴 3가지 
	//id에 따라 휴가 목록 보여주는 페이지
	@PreAuthorize("isAuthenticated()")
	@PostMapping("/vacationUserList")
	public void showUserMain(Model model,String id, VacationCriteria cri,String monthMove) {
		log.info("showUser페이지 " );
		
		List<VacationVO> vlist=service.showUser(id,cri);
		
		int total = service.total(cri);
		model.addAttribute("VacationPageVO",new VacationPageVO(cri, total));
		model.addAttribute("list",vlist);
		
	}
	
	//휴가신청서 작성하는 페이지
	@PreAuthorize("isAuthenticated()")
	@PostMapping("/vacationApply")
	public void vacationApply(Model model) {
		log.info("휴가신청 페이지");	
	
	}//관리자 페이지 
	@PreAuthorize("isAuthenticated()")
	@PostMapping("/vacationManager")
	public void showAdmin(Model model, VacationCriteria cri) {
		log.info("휴가관리 페이지");
		
		int total=service.total(cri);
		List<VacationVO> list=service.selectMonth(cri);
		
		int cnt=service.countApp();
		
		model.addAttribute("VacationPageVO",new VacationPageVO(cri, total));
		model.addAttribute("list",list);
		model.addAttribute("cnt",cnt);
	}
	
	//사용자 페이지에서 작동하는 컨트롤러
	//리스트에 있는 목록 클릭시 작동
	@PreAuthorize("isAuthenticated()")
	@PostMapping("/vacationUserListCheckOne")
	public void showUserOne(Model model, int vacationAppNum){
		log.info("사용자의 페이지");
		
		VacationVO vacation = service.showUserOne(vacationAppNum);
		log.info("vacation : "+vacation);
		
		model.addAttribute("vacation",vacation);

	}
	//목록에서 수정화면으로 이동
	@PreAuthorize("isAuthenticated()")
	@PostMapping("/vacationUserCheckModify")
	public void vacationUserCheckModify(Model model, int vacationAppNum){
		log.info("사용자의 페이지");
		
		VacationVO vacation = service.showUserOne(vacationAppNum);
		log.info("vacation : "+vacation);
		
		model.addAttribute("vacation",vacation);

	}
	
	
	//상태가 신청인 경우 선택할 수 있는 버튼
	//사유 수정하는 부분
	@PreAuthorize("isAuthenticated()")
	@PostMapping("/update")
	public String update(VacationVO vacation,String id,Model model) {
		log.info("수정버튼 눌렀을때");
		VacationCriteria cri=new VacationCriteria();
		if(service.userUpdateApp(vacation)) {
			List<VacationVO> vlist=service.showUser(id,cri);
			int total = service.total(cri);
			model.addAttribute("VacationPageVO",new VacationPageVO(cri, total));
			model.addAttribute("list",vlist);
			return "/vacation/vacationUserList";
		}else {
			return "/vacation/vacation_home";
		}
	}
	//신청서 부분 삭제
	@PreAuthorize("isAuthenticated()")
	@PostMapping("/delete")
	public String delete(int vacationAppNum,String id,Model model) {
		log.info("삭제버튼 눌렀을때");
		VacationCriteria cri=new VacationCriteria();
		if(service.deleteUserApp(vacationAppNum)){
			List<VacationVO> vlist=service.showUser(id,cri);
			int total = service.total(cri);
			model.addAttribute("VacationPageVO",new VacationPageVO(cri, total));
			model.addAttribute("list",vlist);
			return "/vacation/vacationUserList";
		}else {
			return "/vacation/vacation_home";
		}
		
	}
	//승인 상태일때 날짜가 아직이면 반납 가능
	@PreAuthorize("isAuthenticated()")
	@PostMapping("/cancle")
	public String cancle(VacationVO vacation,String id, VacationCriteria cri,Model model) {
		log.info("반납버튼 눌렀을때"+vacation);
		Date date=new Date();
		//VacationCriteria cri=new VacationCriteria();
		boolean result=false;
		Date startday=service.vacationDay(vacation.getVacationAppNum());
		if(!date.after(startday)){
			log.info("날짜 통과"+vacation);
			result=service.cancleVacation(vacation);
			if(result) {
				
				service.vChangeCnt(-1,id);
				model.addAttribute("result","반납 성공");
				
			}else {
				model.addAttribute("result","반납 실패");
			}
			
		}
		else {
			log.info("날짜 실패"+vacation);
			model.addAttribute("result","기간이 지난 휴가입니다.");
		}
			
		List<VacationVO> vlist=service.showUser( id,cri);
		int total = service.total(cri);
		model.addAttribute("VacationPageVO",new VacationPageVO(cri, total));
		model.addAttribute("list",vlist);
		return "/vacation/vacationUserList";
	}

//	휴가신청서 작성 페이지
	@PreAuthorize("isAuthenticated()")
	@PostMapping("/vacationApplyResult")
	public String applyPost(VacationVO vacation,Model model){
		Date nowtoday=new Date();
		VacationCriteria cri=new VacationCriteria();
		//휴가 신청 가능 기간을 넘겼는지 아닌지 확인
		if(!service.idCnt(vacation.getId())) {
			//휴가갯수가 초과하면 알람창
			model.addAttribute("result","휴가승인 갯수가 20가 넘어 신청할 수 없습니다.");
			log.info("신청 실패 !");
			return "/vacation/vacationApply";
		}// 휴가 신청기간이 이전일이면 휴가 신청이 불가능하게 설정
		else if(!vacation.getTerm().after(nowtoday)){
			model.addAttribute("result","기간이 잘못되어 신청이 불가능합니다.");
			return "/vacation/vacationApply";
		}else {
			//휴가가 20개 이하이고 신청날짜가 이전이 아니라면 신청
				log.info("성공");
				if(vacation.getType().equals("half")) {
					vacation.setType("반차");
				}
				else {
					vacation.setType("월차");
				}
				boolean insertVacation=service.insertUserApp(vacation);	
				if(insertVacation) {
					model.addAttribute("result", vacation.getId()+" 휴가가 신청되었습니다.");
					List<VacationVO> vlist=service.showUser(vacation.getId(),cri);
					int total = service.total(cri);
					model.addAttribute("VacationPageVO",new VacationPageVO(cri, total));
					model.addAttribute("list",vlist);
					return "/vacation/vacationUserList";
				}else {
					return "/vacation/vacationApply";
				}
		}
	}
	//관리자가 신청리스트 보는 페이지 
	@PreAuthorize("isAuthenticated()")
	@PostMapping("/vacationManagerConfirm")
	public void applicationList(Model model) {
		List<VacationVO> list = service.applicationList();
		model.addAttribute("list", list);
	}
	//관리자가 목록중에 하나 눌렀을때 
	@PreAuthorize("isAuthenticated()")
	@PostMapping("/vacationManagerCheckOne")
	public void vacationManagerCheckOne(@RequestParam("vacationAppNum") int vacationAppNum,@ModelAttribute("cri") VacationCriteria cri,Model model){
		log.info("관리자 페이지");
		
		VacationVO vacation = service.showUserOne(vacationAppNum);
		model.addAttribute("vacation",vacation);

	}
	
//	휴가심사 페이지
//	승인버튼을 누르게되면 승인으로 update
	@PreAuthorize("isAuthenticated()")
	@GetMapping("/{vacationAppNum}/ok")
	public ResponseEntity<String> ok(@PathVariable("vacationAppNum") int vacationAppNum){
		log.info("vacationAppNum "+vacationAppNum);
		VacationVO vacation=service.showUserOne(vacationAppNum);
		//승인 갯수 확인
		if(service.idCnt(vacation.getId())) {
			//날짜 확인=> 승인 날짜와 신청서를 낸 날짜의 이후라면 승인 불가능
			Date nowtoday=new Date();
			if(!vacation.getTerm().after(nowtoday)){

				return new ResponseEntity<String>("fail",HttpStatus.INTERNAL_SERVER_ERROR);}
				else {
			int vCnt=0;
//휴가 type에 따라 더해지는 값이 다름
			if(vacation.getType().equals("반차")) {
				vCnt=1;
			}
			else {
				vCnt=2;
			}
			service.vChangeCnt(vCnt, vacation.getId());
			log.info("문서 승인"+vacation.getVacationAppNum());
			return service.ok(vacation.getVacationAppNum())?new ResponseEntity<String>("success",HttpStatus.OK):
				new ResponseEntity<String>("fail",HttpStatus.INTERNAL_SERVER_ERROR);
				}
			
		}else {
			return new ResponseEntity<String>("fail",HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		
	}
	
	
//	거절버튼을 누르게되면 거절과 이유가 update
	@PreAuthorize("isAuthenticated()")
	@PostMapping("/{vacationAppNum}/no")
	public ResponseEntity<String> no(@PathVariable("vacationAppNum") int vacationAppNum,@RequestBody  String refusalReason){
		log.info("문서 거절"+vacationAppNum+refusalReason);
			
		return service.no(vacationAppNum,refusalReason)?new ResponseEntity<String>("success",HttpStatus.OK):
			new ResponseEntity<String>("fail",HttpStatus.INTERNAL_SERVER_ERROR);
	}
//	닫기 -> showAdmin 페이지로 넘어감
	
}
