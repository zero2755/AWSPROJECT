package com.mvc.myapp.service;

import java.util.List;

import com.mvc.myapp.domain.Criteria;
import com.mvc.myapp.domain.ReplyPageDTO;
import com.mvc.myapp.domain.ReplyVO;

public interface ReplyService {
	
	public int createReply(ReplyVO vo);
	
	public ReplyVO readReply(Long rno);
	
	public int updateReply(ReplyVO vo);
	
	public int deleteReply(Long rno);
	
	
	public List<ReplyVO> getReplyListWithPaging(Criteria cri,Long boardNum);
	
	public ReplyPageDTO getListPage(Criteria cri, Long bno);
	
	
	public int getCountByBoardNum(Long boardNum);
	
	
}
