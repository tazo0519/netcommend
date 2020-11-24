package com.spring.forgot;

import com.spring.member.MemberVO;

public interface ForgotService {

	public MemberVO findEmail(MemberVO membervo);
	public int findPassword(MemberVO membervo);
}
