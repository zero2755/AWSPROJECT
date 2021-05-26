package com.mvc.myapp.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.mvc.myapp.domain.BoardVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class BoardMapperTests {
	
	@Setter(onMethod_= @Autowired)
	private BoardMapper mapper;
	
	/*
	 * @Test public void testGetList() { mapper.getBoardList().forEach(board ->
	 * log.info(board)); }
	 */
	
	
	/*
	 * @Test public void testCreate() {
	 * 
	 * BoardVO board=new BoardVO(); board.setBoardTitle("테스트제목1");
	 * board.setBoardContent("테스트글1"); board.setBoardWriter("테스트유저1");
	 * 
	 * mapper.createBoard(board);
	 * 
	 * log.info(board); }
	 */
	
	/*
	 * @Test public void testRead() {
	 * 
	 * BoardVO board=mapper.readBoard(3L);
	 * 
	 * log.info(board);
	 * 
	 * 
	 * }
	 */
	
	/*
	 * @Test public void testUpdate() { BoardVO board=new BoardVO();
	 * 
	 * board.setBoardNum(3L); board.setBoardTitle("수정된3번보드");
	 * board.setBoardContent("수정내용"); board.setBoardWriter("수정글쓴이");
	 * 
	 * int count = mapper.updateBoard(board);
	 * 
	 * System.out.println("==========" + count); }
	 */
	
	@Test
	public void testDelete() {
		
		log.info("================ "+mapper.deleteBoard(4L));
		
	}

}
