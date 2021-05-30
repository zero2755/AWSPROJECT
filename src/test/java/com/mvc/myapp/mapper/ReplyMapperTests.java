package com.mvc.myapp.mapper;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringRunner;

import com.mvc.myapp.domain.Criteria;
import com.mvc.myapp.domain.ReplyVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class ReplyMapperTests {
	
	@Setter(onMethod_ = @Autowired)
	private ReplyMapper mapper;
	
	/*
	 * @Test public void testMapper() {
	 * 
	 * log.info(mapper);
	 * 
	 * }
	 */
	
	private Long[] myArr= { 138L,139L,140L,141L,142L};
	
	//createTest
	
	/*
	 * @Test public void testCreate() {
	 * 
	 * IntStream.rangeClosed(1, 10).forEach(i -> {
	 * 
	 * ReplyVO vo = new ReplyVO();
	 * 
	 * 
	 * 
	 * vo.setBoardNum(myArr[i % 5]); vo.setReply("Reply test " + i );
	 * vo.setReplyer("Replyer Test  " + i);
	 * 
	 * mapper.createReply(vo);
	 * 
	 * });
	 * 
	 * }
	 */
	
	
	//read reply
	
	/*
	 * @Test public void testgetListReply() {
	 * 
	 * Long targetRno = 5L;
	 * 
	 * ReplyVO vo= mapper.readReply(targetRno);
	 * 
	 * log.info(vo); }
	 */
	
	//updateReplyTest
	
	/*
	 * @Test public void updateReplyTest() {
	 * 
	 * Long targetRno=1L;
	 * 
	 * ReplyVO vo=mapper.readReply(targetRno);
	 * 
	 * vo.setReply("Update Test reply");
	 * 
	 * int cnt=mapper.updateReply(vo);
	 * 
	 * log.info("UPdate cnt :  " +cnt);
	 * 
	 * }
	 */
	
	//deleteReply TEst
	
	
	/*
	 * @Test public void deleteReplyTest() {
	 * 
	 * Long targetRno=3L;
	 * 
	 * mapper.deleteReply(targetRno);
	 * 
	 * 
	 * }
	 */
	
	@Test
	public void testList() {
		Criteria cri=new Criteria();
		
		
		List<ReplyVO> replies=mapper.getReplyListWithPaging(cri, myArr[0]);
		
		replies.forEach(reply->log.info(reply));
		
	}
	
	
	

}
