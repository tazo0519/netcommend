package com.spring.member;

import com.spring.login.LoginVO;

public interface MemberService {
	public int emailCheck(MemberVO membervo); //이메일 중복체크
	public int verifyEmail(MemberVO membervo); //이메일 인증
	public int memberInsert(MemberVO membervo); // 회원 등록
}
