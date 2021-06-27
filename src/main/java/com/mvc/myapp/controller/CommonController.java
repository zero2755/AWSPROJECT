package com.mvc.myapp.controller;


import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.mvc.myapp.domain.MemberVO;
//import com.mvc.myapp.service.MemberService;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class CommonController {
	
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home() {
		return "home";
	}
	
	@GetMapping("/accessError")
	public void accessDenied(Authentication auth, Model model) {

		log.info("access Denied : " + auth);
		log.info("common controller");
		model.addAttribute("msg", "Access Denied");
	}

	@GetMapping("/memberLogin")
	public void loginInput(String error, String logout, Model model) {

		log.info("error: " + error);
		log.info("logout: " + logout);

		if (error != null) {
			model.addAttribute("error", "Login Error Check Your Account");
		}

		if (logout != null) {
			model.addAttribute("logout", "Logout!!");
		}
	}

	@GetMapping("/memberLogout")
	public void logoutGET() {

		log.info("member logout");
	}

	@PostMapping("/memberLogout")
	public void logoutPost() {

		log.info("post member logout");
	}
	
	
	
	
}