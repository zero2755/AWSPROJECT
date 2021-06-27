package com.mvc.myapp.mapper;


import com.mvc.myapp.domain.MemberVO;


public interface MemberMapper {
	
	

	
	
	public MemberVO read(String userid);
	
	//public void signUp(MemberVO vo);
	
	public void signUpMember(MemberVO vo);
	public void signUpMemberAuth(MemberVO vo);
	
}
