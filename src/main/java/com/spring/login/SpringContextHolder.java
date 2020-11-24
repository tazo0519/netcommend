package com.spring.login;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;

public class SpringContextHolder {

	Authentication auth = SecurityContextHolder.getContext().getAuthentication();
	
	String email = auth.getName();

}
