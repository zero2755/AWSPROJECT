package com.mvc.myapp.service;

import java.util.List;

import com.mvc.myapp.domain.BoardVO;

public interface BoardService {
	
	public void createBoard(BoardVO board);
	
	public BoardVO readBoard(Long boardNum);
	
	public boolean updateBoard(BoardVO board);
	
	public boolean deleteBoard(Long boardNum);
	
	public List<BoardVO> getBoardList();
	
}
