package com.mvc.myapp.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.mvc.myapp.domain.BoardVO;
import com.mvc.myapp.mapper.BoardMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@AllArgsConstructor
@Service
public class BoardServiceImpl  implements BoardService{
	
	private BoardMapper mapper;
	
	
	@Override
	public void createBoard(BoardVO board) {
		
		log.info("service - createBoard호출 ==========="+board);
		
		mapper.createBoard(board);
		
	}

	@Override
	public BoardVO readBoard(Long boardNum) {
		
		log.info("service - readBoard호출 ===========보드넘버 : "+boardNum);
		
		return mapper.readBoard(boardNum);
		
	}

	@Override
	public boolean updateBoard(BoardVO board) {
		
		log.info("service - updateBoard호출 ===========보드정보 : "+board);
		
		return mapper.updateBoard(board)==1;
		
	}
	
	@Override
	public boolean deleteBoard(Long boardNum) {
		 
		log.info("service - deleteBoard호출 ===========보드번호 : "+boardNum);
		
		return mapper.deleteBoard(boardNum)==1;
	}

	@Override
	public List<BoardVO> getBoardList() {
		
		log.info("service -  getBoardList호출 ============");
		
		return mapper.getBoardList();
		
	}

	 

}
