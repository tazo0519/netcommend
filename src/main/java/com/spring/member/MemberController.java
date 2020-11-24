package com.spring.member;

import java.io.PrintWriter;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

@Controller
public class MemberController {
	
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);

	@Autowired
	private MemberService memberService;

	@Autowired
	private JavaMailSender mailSender;
	
	@Autowired
	BCryptPasswordEncoder pwdEncoder;

	/* 회원가입 DB Insert */
	@RequestMapping(value = "/memberInsert.me", method = RequestMethod.POST)
	public String memberInsert(HttpServletRequest request, HttpServletResponse response, MemberVO membervo,
			RedirectAttributes redirect) throws Exception {

		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		PrintWriter writer;

		try {
			
			/* DB insert */
			String inputPass = membervo.getPassword();
			String password = pwdEncoder.encode(inputPass);
			membervo.setPassword(password);
			int res = memberService.memberInsert(membervo);
			writer = response.getWriter();

			/* 페이지 이동 */
			if (res == 1) {
				redirect.addAttribute("email", request.getParameter("email"));
				return "redirect:/mailSending.me";
			} else {
				writer.write("<script>alert('회원 가입 실패.'); location.href='main.tz';</script>");
			}
		} catch (Exception e) {
			System.out.println(e);
		}

		return null;
	} // memberInsert.me 끝

	/* mailSending 코드 */
	@RequestMapping(value = "/mailSending.me")
	public String mailSending(HttpServletRequest request, HttpServletResponse response,
			@RequestParam("email") String email) throws Exception {

		String setfrom = "netcommend@gmail.com"; // host 메일 주소
		String title = "NetCommend 회원가입 인증메일"; // 제목
		String content = "http://localhost:8080/netflix/verifyEmail.me?id=" + email; // 메일 내용

		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		PrintWriter writer = response.getWriter();

		try {
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");

			messageHelper.setFrom(setfrom); // 보내는 사람 생략하면 정상작동 안함
			messageHelper.setTo(email); // 받는사람 이메일
			messageHelper.setSubject(title); // 메일 제목은 생략 가능
			messageHelper.setText(content); // 메일 내용

			mailSender.send(message);

			writer.write("<script>alert('인증 메일을 확인해주세요.'); location.href='main.tz';</script>");
		} catch (Exception e) {
			System.out.println(e);
		}

		return null;
	}	//mailSending.me 끝

	/* 메일 인증 url */
	@RequestMapping(value = "/verifyEmail.me", method = RequestMethod.GET)
	public String verifyEmail(HttpServletRequest request, HttpServletResponse response, MemberVO membervo) {
		membervo.setEmail(request.getParameter("id"));

		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		PrintWriter writer;
		int res = memberService.verifyEmail(membervo);

		try {

			writer = response.getWriter();

			if (res == 1) {
				writer.write("<script>alert('회원 가입 성공!!'); location.href='main.tz';</script>");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return null;
	}
}
