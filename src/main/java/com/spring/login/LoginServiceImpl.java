package com.spring.login;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.mapper.LoginMapper;

@Service
public class LoginServiceImpl implements LoginService {
	
	@Autowired
	SqlSession sqlSession;

	@Override
	public int checkMember(String email, HttpServletResponse response) throws Exception {
		PrintWriter writer = response.getWriter();
		try {
			LoginMapper loginmapper = sqlSession.getMapper(LoginMapper.class);
			int checkmember = loginmapper.checkMember(email);
			int checkemail_state = loginmapper.checkEmail_state(email);
			if(checkemail_state == 1) {
				writer.write("<script>alert('이메일 인증을 완료해주세요.');location.href='./login.nv';</script>");
				return 0;
			} else if(checkmember == 1){
				return checkmember;
			} else {
				return 0;
			}
			
		} catch (Exception e) {
			throw new Exception("이메일 체크 실패", e);
		}
	}

	@Override
	public int checkAdmin(String email) throws Exception {
		try {
			LoginMapper loginmapper = sqlSession.getMapper(LoginMapper.class);
			int checkadmin = loginmapper.checkAdmin(email);
			return checkadmin;
		} catch (Exception e) {
			throw new Exception("관리자 체크 실패", e);
		}
	}

	@Override
	public LoginVO getAdmin(String email) throws Exception {
		try {
			LoginMapper loginmapper = sqlSession.getMapper(LoginMapper.class);
			LoginVO adminDetail = loginmapper.getAdmin(email);
			return adminDetail;
		} catch (Exception e) {
			throw new Exception("관리자 정보조회 실패", e);
		}
	}

	@Override
	public LoginVO getDetail(String email) throws Exception {
		try {
			LoginMapper loginmapper = sqlSession.getMapper(LoginMapper.class);
			LoginVO detail = loginmapper.getDetail(email);
			return detail;
		} catch (Exception e) {
			throw new Exception("이메일 정보조회 실패", e);
		}
	}
	
	@Override
	public int insertMember(LoginVO vo) throws Exception {
		try {
			LoginMapper loginmapper = sqlSession.getMapper(LoginMapper.class);
			int check = loginmapper.insertMember(vo);
			return check;
		} catch (Exception e) {
			throw new Exception("네이버/카카오 등록 실패", e);
		}
	}

}
