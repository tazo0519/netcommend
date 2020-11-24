package com.spring.mapper;

import com.spring.member.MemberVO;

public interface ForgotMapper {

	public MemberVO findEmail(MemberVO membervo);
	public int findPassword(MemberVO membervo);
	
}
