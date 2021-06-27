package com.mvc.myapp.controller;

import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.mvc.myapp.domain.MemberVO;
import com.mvc.myapp.service.MemberService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@AllArgsConstructor
public class MemberController {
	
	private MemberService memberService;
	
	
	@GetMapping("/signUp")
	public void signUp() {
		log.info("signUp get");
		 
	}
	
	@Transactional
	@PostMapping("/signUp")
	public String signUp(MemberVO vo) {

		log.info("signUp post");
		
		memberService.signUpMember(vo);
		memberService.signUpMemberAuth(vo);
		
		return "redirect:/board/list";
	}
	
	@GetMapping("/all")
	  public void doAll() {
	    
	    log.info("do all can access everybody");
	  }
	   
	 @GetMapping("/member")
	  public void doMember() {
	    
	    log.info("logined member");
	  }
	  
	  @GetMapping("/admin")
	  public void doAdmin() {
	    
	    log.info("admin only");
	  }  
}
