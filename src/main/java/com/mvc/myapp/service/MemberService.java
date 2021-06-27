package com.mvc.myapp.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.mvc.myapp.domain.MemberVO;
import com.mvc.myapp.mapper.BoardMapper;
import com.mvc.myapp.mapper.MemberMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;


@Log4j
@AllArgsConstructor
@Service
public class MemberService {
	
	private MemberMapper mapper;
	 
	@Setter(onMethod_ = @Autowired)
	private PasswordEncoder pwencoder;
	

	
	public void signUpMember(MemberVO vo) {
		vo.setUserpw(pwencoder.encode(vo.getUserpw()));
		
		log.info("service ================Member"+vo);
		
		
		mapper.signUpMember(vo);
	}
	public void signUpMemberAuth(MemberVO vo) {
		vo.setUserpw(pwencoder.encode(vo.getUserpw()));
		
		log.info("service ================MemberAuth"+vo);
		
		
		mapper.signUpMemberAuth(vo);
	}
	
}
