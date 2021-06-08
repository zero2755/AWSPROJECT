package com.mvc.myapp.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.mvc.myapp.domain.ReplyVO;
import com.mvc.myapp.mapper.ReplyMapper;


import lombok.Setter;
import lombok.extern.log4j.Log4j;


@Service
@Log4j
public class ReplyServiceImpl implements ReplyService{
	
	
	
	
	
	@Setter(onMethod_= @Autowired)
	private ReplyMapper mapper;
	
	@Override
	public int createReply(ReplyVO vo) {
		log.info("create reply serviceImpl");
		
		log.info(vo);
		
		return mapper.createReply(vo);
	}

	@Override
	public ReplyVO readReply(Long rno) {
		
		
		log.info("read reply serviceImpl");
		
		return mapper.readReply(rno);
	}

	@Override
	public int updateReply(ReplyVO vo) {
		
		log.info("update reply serviceImpl"+vo);
		
		
		
		return mapper.updateReply(vo);
		
		
	}
 
	@Override
	public int deleteReply(Long rno) {
		log.info("create reply serviceImpl rno: "+rno);
		
		
		return mapper.deleteReply(rno);
	}

	@Override
	public List<ReplyVO> getReplyList(Long boardNum) {
		log.info("create reply serviceImpl  ====boardNum"+boardNum);
		 
		
		
		
		return mapper.getReplyList(boardNum);
	}
	
	
	
	
	
	@Override
	public int getCountByBoardNum(Long boardNum) {
		
		return mapper.getCountByboardNum(boardNum);
		
	}
	
	
	
	

}
