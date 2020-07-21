package com.spring.login;

import javax.servlet.http.HttpServletResponse;

public interface LoginService {
	
	public int checkMember(String email, HttpServletResponse response) throws Exception;
	public int checkAdmin(String email) throws Exception;
	public LoginVO getAdmin(String email) throws Exception;
	public LoginVO getDetail(String email) throws Exception;
	public int insertMember(LoginVO vo) throws Exception;

}
