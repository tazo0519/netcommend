package com.spring.member;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.login.LoginVO;
import com.spring.mapper.MemberMapper;

@Service("memberService")
public class MemberServiceImpl implements MemberService{

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public int emailCheck(MemberVO membervo) {
		MemberVO dbemail = null;
		int res = -1;
		
		try {
			MemberMapper memberMapper = sqlSession.getMapper(MemberMapper.class);
			dbemail = memberMapper.emailCheck(membervo);
			
			if (dbemail != null) {
				res = 1; //이메일 중복
				
			} else {	//이메일 중복체크 했을 때 중복되지 않는 값
				res = 0;	//중복된 이메일이 없는 것
				
			}
		} catch(Exception e) {
			System.out.println("이메일 중복 확인 실패." +  e.getMessage());
		}
		return res;
	}

	@Override
	public int verifyEmail(MemberVO membervo) {
		//인증 안된 회원의 디폴트 값은 N
		//인증 된 회원의 값은 Y
		int res = 0;
		
		try {
			MemberMapper memberMapper = sqlSession.getMapper(MemberMapper.class);
			res = memberMapper.verifyEmail(membervo);
			
		}catch(Exception e) {
			System.out.println("이메일 인증 실패." +  e.getMessage());
		}
		
		return res;
	}

	@Override
	public int memberInsert(MemberVO membervo) {
		int res = 0;
		try {
			MemberMapper memberMapper = sqlSession.getMapper(MemberMapper.class);
			res = memberMapper.memberInsert(membervo); // res == 1
			
		}catch (Exception e) {
			System.out.println("회원 등록 실패."+ e.getMessage());
		}
		return res;
	}
}
