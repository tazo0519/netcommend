package com.spring.signup;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.spring.member.MemberService;
import com.spring.member.MemberVO;

@RestController
public class SignupAjaxController {
	
	@Autowired(required = false)
	private MemberService memberService;

	@ResponseBody
	@PostMapping(value = "/emailCheck.do", produces = "application/json;charset=UTF-8")
	public Map<String, Object> emailCheck(MemberVO membervo) {
		Map<String, Object> retVal = new HashMap<String, Object>();

		try {
			int res = memberService.emailCheck(membervo);

			if (res == 0) {
				retVal.put("res", "OK"); // 맵객체 "res"는 키 , "OK" 값
			} else if (res == 1) {
				retVal.put("res", "FAIL"); // 맵객체 "res"는 키 , "OK" 값
			}

		} catch (Exception e) {
			retVal.put("res", "FAIL");
			retVal.put("message", "Failure");
		}
		return retVal;
	}
}
