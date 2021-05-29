package com.mvc.myapp.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Select;

import com.mvc.myapp.domain.BoardVO;
import com.mvc.myapp.domain.Criteria;

public interface BoardMapper {
	
	
	
	public List<BoardVO> getBoardList();
	
	public List<BoardVO> getBoardListWithPaging(Criteria cri);
	
	public void createBoard(BoardVO board);
	
	public BoardVO readBoard(Long boardNum);
	
	public int updateBoard(BoardVO board);
	
	public int deleteBoard(Long boardNum);
	
	public int getTotalCount(Criteria cri);
	
	
	
}
