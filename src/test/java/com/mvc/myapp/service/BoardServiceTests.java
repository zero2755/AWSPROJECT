package com.mvc.myapp.service;

import static org.junit.Assert.assertNotNull;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.mvc.myapp.domain.BoardVO;
import com.mvc.myapp.domain.Criteria;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class BoardServiceTests {
	
	
	@Setter(onMethod_= {@Autowired})
	private BoardService service;
	
	/*
	 * @Test public void testExist() {
	 * 
	 * log.info(service); assertNotNull(service); }
	 */
	
	/*
	 * @Test public void testCreateBoard() { BoardVO board=new BoardVO();
	 * board.setBoardTitle("서비스테스트제목"); board.setBoardContent("서비스테스트내용");
	 * board.setBoardWriter("서비스테스트작성자");
	 * 
	 * service.createBoard(board);
	 * 
	 * log.info("생성된 보드테스트======="+board); }
	 */
	
	
	/*
	 * @Test public void testGetBoardList() {
	 * 
	 * service.getBoardList().forEach(board -> log.info(board)); }
	 */
	
	/*
	 * @Test public void testReadBoard() {
	 * 
	 * log.info(service.readBoard(5L));
	 * 
	 * }
	 */
	
	
	/*
	 * @Test public void testUpdateBoard() {
	 * 
	 * BoardVO board=service.readBoard(1L);
	 * 
	 * if(board == null) { return; }
	 * 
	 * board.setBoardTitle("서비스  수정 제목");
	 * 
	 * service.updateBoard(board);
	 * 
	 * log.info("서비스테스트- 수정된내용"+board);
	 * 
	 * }
	 */
	
	
	/*
	 * @Test public void testDeleteBoard() {
	 * 
	 * log.info("삭제 리턴값 ============"+service.deleteBoard(2L)); }
	 */
	 
	
	@Test
	public void testPagingList() {
		
		service.getBoardListWithPaging(new Criteria(1,10)).forEach(board ->log.info(board));
	}
	
}
