package com.mvc.myapp.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.mvc.myapp.domain.BoardVO;
import com.mvc.myapp.service.BoardService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@AllArgsConstructor
@RequestMapping("/board/*")
public class BoardController {
	
	private BoardService service;
	
	@GetMapping("/list")
	public void list(Model model) {
		
		log.info("list");
		model.addAttribute("list", service.getBoardList());
		
	}
	
	
	@GetMapping("/createBoard")
	public void register() {
		
	}
	 
	@PostMapping("/createBoard")
	public String createBoard(BoardVO board, RedirectAttributes rttr) {
		
		log.info("컨트롤러 ------보드등록" +board);
		
		service.createBoard(board);
		
		rttr.addFlashAttribute("result", board.getBoardNum());
		
		return "redirect:/board/list";
		
	}
	
	@GetMapping("/readBoard")
	public void readBoard(@RequestParam("boardNum")Long boardNum, Model model) {
		
		log.info("컨트롤러 -------- 보드 조회");
		model.addAttribute("board", service.readBoard(boardNum));
		
	}
	
	@GetMapping("/updateBoard")
	public void updateBoard(@RequestParam("boardNum")Long boardNum, Model model){
		
		log.info("컨트롤러---업데이트 보드 getMapping");
		model.addAttribute("board", service.readBoard(boardNum));
	}
	
	@PostMapping("/updateBoard")
	public String updateBoard(BoardVO board, RedirectAttributes rttr) {
		
		log.info("컨트롤러--------보드 수정");
		
		if(service.updateBoard(board)) {
			rttr.addFlashAttribute("result", "success");
		}
		return "redirect:/board/list";
	}
	
	
	//PostMapping Later
	@GetMapping("/deleteBoard")
	public String deleteBoard(@RequestParam("boardNum") Long boardNum, RedirectAttributes rttr )
	{
	log.info("컨트롤러--------보드 삭제");
		
		if(service.deleteBoard(boardNum)) {
			rttr.addFlashAttribute("result", "success");
		}
		return "redirect:/board/list";
	}
	
 

}
