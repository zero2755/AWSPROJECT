package com.mvc.myapp.controller;

import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.mvc.myapp.domain.Criteria;
import com.mvc.myapp.domain.ReplyPageDTO;
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
	
	 
	
	
	
	
	
		@GetMapping(value = "/{rno}", produces = { MediaType.APPLICATION_XML_VALUE,
				MediaType.APPLICATION_JSON_UTF8_VALUE })
		public ResponseEntity<ReplyVO> readReply(@PathVariable("rno") Long rno) {

			log.info("readRNO: " + rno);

			return new ResponseEntity<>(service.readReply(rno), HttpStatus.OK);
		}
	 
		
		
		
		
		
		
		@RequestMapping(method = { RequestMethod.PUT,
				RequestMethod.PATCH }, value = "/{rno}", consumes = "application/json", produces = {
						MediaType.TEXT_PLAIN_VALUE })
		public ResponseEntity<String> updateReply(@RequestBody ReplyVO vo, @PathVariable("rno") Long rno) {

			vo.setRno(rno);

			log.info("rno : " + rno);

			log.info("update vo info : " + vo);

			return service.updateReply(vo) == 1 ? new ResponseEntity<>("success", HttpStatus.OK)
					: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);

		}
	 
	 
		
		
	 
		@DeleteMapping(value = "/{rno}", produces = { MediaType.TEXT_PLAIN_VALUE })
		public ResponseEntity<String> deleteReply(@PathVariable("rno") Long rno) {

			log.info("remove RNO : " + rno);

			return service.deleteReply(rno) == 1 ? new ResponseEntity<>("success", HttpStatus.OK)
					: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);

		}
		
		
		
		
		
		
		@GetMapping(value = "/pages/{bno}/{page}", 
				produces = { MediaType.APPLICATION_XML_VALUE,
				MediaType.APPLICATION_JSON_UTF8_VALUE })
		public ResponseEntity<ReplyPageDTO> getList(@PathVariable("page") int page, @PathVariable("bno") Long bno) {

			Criteria cri = new Criteria(page, 10);
			
			log.info("get Reply List bno: " + bno);

			log.info("cri:" + cri);

			return new ResponseEntity<>(service.getListPage(cri, bno), HttpStatus.OK);
		}
	
}
