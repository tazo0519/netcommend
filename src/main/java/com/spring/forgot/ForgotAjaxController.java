package com.spring.forgot;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.spring.forgot.ForgotService;
import com.spring.member.MemberVO;

@RestController
public class ForgotAjaxController {

	@Autowired(required = false)
	private ForgotService forgotService;
	
	/* Email 찾기 */
	
	@PostMapping(value = "/findEmail.do", produces = "application/json; charset=UTF-8")
	public @ResponseBody Map<String, Object> findEmail(MemberVO membervo) throws Exception{

		Map<String, Object> retVal = new HashMap<String, Object>();
		
//		MemberVO memVO = new MemberVO();
		
		try {
			/* DB에서 Email 찾기 */
			MemberVO dbemail = forgotService.findEmail(membervo);

			retVal.put("dbemail", dbemail.getEmail()); // 맵객체 "res"는 키 , "OK" 값
			
		} catch (Exception e) {
			retVal.put("dbemail", null);
			retVal.put("message", "Failure");
		}

		return retVal;
		
	}
}
