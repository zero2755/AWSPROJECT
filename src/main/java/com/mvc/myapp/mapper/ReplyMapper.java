package com.mvc.myapp.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;


import com.mvc.myapp.domain.ReplyVO;

public interface ReplyMapper {
	
	public int createReply(ReplyVO vo);
	
	public ReplyVO readReply(Long rno);
	
	public int updateReply(ReplyVO vo);
	
	public int deleteReply (Long rno);
	
	public List<ReplyVO> getReplyList(
			Long boardNum);
	
	
	public int getCountByboardNum(Long boardNum);
	
}
