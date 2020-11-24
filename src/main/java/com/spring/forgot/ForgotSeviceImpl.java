package com.spring.forgot;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.mapper.ForgotMapper;
import com.spring.mapper.MemberMapper;
import com.spring.member.MemberVO;

@Service("forgotService")
public class ForgotSeviceImpl implements ForgotService {

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public MemberVO findEmail(MemberVO membervo) {
		
		MemberVO email = null;
		
		try {
			ForgotMapper forgotMapper = sqlSession.getMapper(ForgotMapper.class);
			
			email = forgotMapper.findEmail(membervo);
			
			if (email != null) {
				return email; //해당하는 email 존재함.
				
			} else {	
				return null;	//해당하는 email 존재안함.
				
			}
			
		}catch (Exception e) {
			System.out.println("이메일 중복 확인 실패." +  e.getMessage());
		}
		
		return null;
	}

	@Override
	public int findPassword(MemberVO membervo) {
		return 0;
	}

}
