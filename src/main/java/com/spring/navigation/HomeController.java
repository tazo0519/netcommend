package com.spring.navigation;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.spring.login.KakaoController;

@Controller
public class HomeController {

	@RequestMapping(value = "/main.tz", method = RequestMethod.GET)
	public String main(Model model) {

		return "main";
	}

	@RequestMapping(value = "/about.nv")
	public String about(Model model) {
		return "about";
	}

	@RequestMapping(value = "/category.nv")
	public String category(Model model, HttpSession session, HttpServletResponse response) throws IOException {
		
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		Object principal = auth.getPrincipal();
		
		
//		String email = (String) session.getAttribute("email");
		String email = auth.getName();
		System.out.println(email);
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		if(email == null) {
			PrintWriter writer = response.getWriter();
			writer.write("<script>alert('로그인 후 이용하실수 있습니다.'); location.href=history.back();</script>");
			return null;
		} else {
			return "category";
		}
		
	}

	@RequestMapping(value = "/login.nv")
	public String login(Model model) {
		return "login";
	}

	private static KakaoController apiHelper = new KakaoController();

	@RequestMapping(value = "/logout.nv")
	public String logout(HttpSession session) throws IOException {

		apiHelper.logout();

		session.invalidate();
		return "redirect:main.tz";
	}

	@RequestMapping(value = "/signup.me")
	public String signup(Model model) {
		return "signup";
	}
	
	@RequestMapping(value = "/forgotIdPw.me")
	public String forgotIdPw(Model model) {
		return "forgotIdPw";
	}

}
