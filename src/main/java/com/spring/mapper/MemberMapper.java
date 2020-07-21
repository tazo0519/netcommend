package com.spring.mapper;

import com.spring.login.LoginVO;
import com.spring.member.MemberVO;

public interface MemberMapper {
	MemberVO emailCheck(MemberVO membervo); //이메일 중복체크
	int verifyEmail(MemberVO membervo); //이메일 인증
	int memberInsert(MemberVO membervo); //회원 등록
}
