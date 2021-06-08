package com.mvc.myapp.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import com.mvc.myapp.domain.Criteria;
import com.mvc.myapp.domain.ReplyVO;
import com.mvc.myapp.service.ReplyService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@RequestMapping("/replies/")
@RestController
@AllArgsConstructor
@Log4j
public class ReplyController {

	private ReplyService service;
	
	 
	
	
	
	 
	@PostMapping(value="/new",consumes = "application/json",
			produces= {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> createReply(@RequestBody ReplyVO vo){
		 
		
		log.info("ReplyVO : "+ vo);
		
		int insertCnt=service.createReply(vo);
		
		log.info("Reply insert cnt : " +insertCnt);
		
		return insertCnt==1 ? new ResponseEntity<>("success",HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
		
	}
	
	 
	
	
	
	
	
		
		
		
		
		
	   
	 
	 
		
	
		@PostMapping(value = "/{rno}/{boardNum}")
		public ModelAndView deleteReply(@PathVariable("rno") Long rno 
				,@PathVariable("boardNum") Long boardNum, 
				@ModelAttribute("cri") Criteria cri ,
				Model model,
				HttpServletResponse response) throws IOException {
				
			 
			
			log.info("remove RNO : " + rno);
			service.deleteReply(rno);
			
			
			ModelAndView mav = new ModelAndView();
			mav.setView(new RedirectView("/board/readBoard"));
			mav.addObject("cri", cri);
			mav.addObject("boardNum", boardNum);
			
			
			
			
			return mav;


		}
		
		
		
		
		 
		
		@GetMapping(value = "/pages/{boardNum}", 
				produces = { MediaType.APPLICATION_XML_VALUE,
				MediaType.APPLICATION_JSON_UTF8_VALUE })
		public List<ReplyVO> getList(@PathVariable("boardNum") Long boardNum) {

			
			
			log.info("get Reply List boardNum: " + boardNum);

			 

			return service.getReplyList(boardNum);
		}
	
}
