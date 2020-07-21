package com.spring.mapper;

import com.spring.login.LoginVO;

public interface LoginMapper {
	int checkMember(String email);
	int checkEmail_state(String email);
	int checkAdmin(String email);
	LoginVO getAdmin(String email);
	LoginVO getDetail(String email);
	int insertMember(LoginVO vo);
	
}
