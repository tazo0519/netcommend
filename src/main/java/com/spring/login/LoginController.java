package com.spring.login;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.databind.JsonNode;
import com.github.scribejava.core.model.OAuth2AccessToken;
import com.spring.member.MemberService;

@Controller
public class LoginController {

	/* NaverLoginBO */
	private NaverLoginBO naverLoginBO;
	private String apiResult = null;

	/* nomalLogin */
	@Autowired(required = false)
	private LoginService service;

	@Autowired(required = false)
	private MemberService service1;

	@Autowired
	private void setNaverLoginBO(NaverLoginBO naverLoginBO) {
		this.naverLoginBO = naverLoginBO;
	}

	@RequestMapping(value = "/normal_login.me")
	public ModelAndView normal_login(LoginVO vo, HttpSession session, HttpServletResponse response,
			HttpServletRequest request) throws Exception {
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		PrintWriter writer = response.getWriter();

		String email = vo.getEmail();
		String password = vo.getPassword();

		/*
		 * // 이전페이지 정보 String pre_url = request.getParameter("pre_url");
		 * System.out.println(pre_url); String url1 = null;
		 * 
		 * // 이전 페이지가 main페이지면 오류해결 if(pre_url.substring(22).equals("/")) { url1 =
		 * "main.tz"; } else { url1 = pre_url.substring(22); }
		 * 
		 * // email, password, url 확인 System.out.println(email +"/"+ password);
		 * System.out.println(pre_url +", "+ url1);
		 * 
		 */
		// DB에서 Email 불러와서 등록된 이메일인지 확인
		LoginVO dbvo = null;
		LoginVO admindbvo = null;
		int check;
		int checkadmin;

		try {
			check = service.checkMember(email, response); // 등록된 이메일인지 확인
			if (check == 0) {
				checkadmin = service.checkAdmin(email);
				if (checkadmin == 0) {
					writer.write("<script>alert('등록되지 않은 이메일입니다.');location.href='./login.nv';</script>");
				} else { // admin테이블에서 이메일 조회후 카운트가0이 아니면 관리자 계정이므로 정보 조회후 세션에 저장
					admindbvo = service.getAdmin(email);
					if (admindbvo.getPassword().equals(password)) {
						session.setAttribute("email", admindbvo.getEmail());

						writer.write("<script>alert('관리자로 로그인했습니다.');location.href='./main.tz';</script>");
					} else {
						writer.write("<script>alert('잘못된 비밀번호입니다.');location.href='./login.nv';</script>");
					}
				}
			} else {
				dbvo = service.getDetail(email); // 등록된 이메일일 경우 상세정보 불러와서 패스워드 확인작업
				if (dbvo.getPassword().equals(password)) {
					session.setAttribute("email", dbvo.getEmail());

//					session.setAttribute("userDetail", dbvo); dbvo.setLast_connection(new
//					Timestamp(System.currentTimeMillis())); service.updateConnection(dbvo);

					writer.write("<script>location.href='./main.tz';</script>");
				} else {
					writer.write("<script>alert('잘못된 비밀번호입니다.');location.href='./login.nv';</script>");
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			writer.write("<script>('시스템 에러');location.href='./main.tz';</script>");
		}

		return null;
	}

	// 로그인 첫 화면 요청 메소드
	@RequestMapping(value = "/login.nv", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView login(Model model, HttpSession session) {

		ModelAndView mav = new ModelAndView();

		/* 네이버아이디로 인증 URL을 생성하기 위하여 naverLoginBO클래스의 getAuthorizationUrl메소드 호출 */
		String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);

		/* 카카오인증 URL을 생성하기 위하여 getAuthorizationUrl을 호출 */
		String kakaoUrl = KakaoController.getAuthorizationUrl(session);

		System.out.println("네이버:" + naverAuthUrl);
		System.out.println("카카오:" + kakaoUrl);

		// 네이버
		mav.setViewName("login");
		mav.addObject("kakao_Url", kakaoUrl);
		mav.addObject("naver_Url", naverAuthUrl);

		return mav;
	}

	/* 카카오 로그인 성공시 */
	@RequestMapping(value = "/kakaologin.me", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public ModelAndView kakaoLogin(@RequestParam("code") String code, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception {

		ModelAndView mav = new ModelAndView();
		System.out.println("카카오 로그인 성공 진입.");
		// 결과값을 node에 담아줌
		JsonNode node = KakaoController.getAccessToken(code);
		// accessToken에 사용자의 로그인한 모든 정보가 들어있다
		JsonNode accessToken = node.get("access_token");
		// 사용자의 정보
		JsonNode userInfo = KakaoController.getKaKaoUserInfo(accessToken);
		// DB에 맞게 받을 정보이름 수정
		String email = null;

		// 유저정보 카카오에서 가져오기
		JsonNode properties = userInfo.path("properties");
		JsonNode kakao_account = userInfo.path("kakao_account");
		email = kakao_account.path("email").asText();

		System.out.println("카카오에서 불러온 email 정보 : " + email);

		// DB에서 Email 불러와서 등록된 이메일인지 확인
		int check;
		char cValue;
		try {
			check = service.checkMember(email, response); // 등록된 이메일인지 확인
			if (check == 0) {
				LoginVO dbvo = new LoginVO();
				dbvo.setEmail(email);
				dbvo.setPassword("카카오");

				dbvo.setEmail_state("Y");

				int res = service.insertMember(dbvo); // 등록되지 않은 회원이면 DB에 저장
				if (res != 0) {
					LoginVO dbvo3 = new LoginVO();
					dbvo3 = service.getDetail(email);
					session.setAttribute("email", dbvo3.getEmail()); // 세션 생성

					session.setAttribute("userDetail", dbvo3);

				} else {
					System.out.println("등록실패");
					mav.setViewName("main");
					return mav;
//					return "redirect:main.tz";
				}
			} else {
				System.out.println("등록된 회원입니다");
				LoginVO dbvo2 = new LoginVO();
				dbvo2 = service.getDetail(email); // 이미 등록된 이메일이면 DB에서 정보 가져오기
				session.setAttribute("email", dbvo2.getEmail()); // 세션 생성

				session.setAttribute("userDetail", dbvo2);

			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		mav.setViewName("main");
		return mav;
//		return "redirect:main.tz";
	}

	// 네이버 로그인 성공시 callback호출 메소드
	@RequestMapping(value = "/callback.me", method = { RequestMethod.GET, RequestMethod.POST })
	public String callback(Model model, @RequestParam String code, @RequestParam String state, HttpSession session)
			throws IOException, ParseException {

		System.out.println("여기는 callback");

		OAuth2AccessToken oauthToken;

		oauthToken = naverLoginBO.getAccessToken(session, code, state);

		// 1. 로그인 사용자 정보를 읽어온다.
		apiResult = naverLoginBO.getUserProfile(oauthToken); // String형식의 json데이터
		/**
		 * apiResult json 구조 {"resultcode":"00", "message":"success",
		 * "response":{"id":"33666449","nickname":"shinn****","age":"20-29","gender":"M","email":"sh@naver.com","name":"\uc2e0\ubc94\ud638"}}
		 **/

		// 2. String형식인 apiResult를 json형태로 바꿈
		JSONParser parser = new JSONParser();
		Object obj = parser.parse(apiResult);
		JSONObject jsonObj = (JSONObject) obj;

		// 3. 데이터 파싱
		// Top레벨 단계 _response 파싱
		JSONObject response_obj = (JSONObject) jsonObj.get("response");

		// response의 nickname값 파싱
		String email = (String) response_obj.get("email");
		System.out.println(email);

		// 4.파싱 닉네임 세션으로 저장
		session.setAttribute("email", email); // 세션 생성
		model.addAttribute("result", apiResult);
		
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		Object principal = auth.getPrincipal();

//		String email = "";
		if (principal != null) {
			email = auth.getName();
		}

		return "main";
	}

}
