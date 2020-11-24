/* csrf 토큰 받아와서 ajax통신이 가능하게 함 (스프링 시큐리티 사용시 필요.) */
var token = $("meta[name='_csrf']").attr("content");
var header = $("meta[name='_csrf_header']").attr("content");
$(function() {
	$(document).ajaxSend(function(e, xhr, options) {
		xhr.setRequestHeader(header, token);
	});
});

/* 이메일 사용가능 여부 */
$("#email-alert-true").hide();
$("#email-alert-false").hide();

/* 이메일 중복 체크 */
function emChk() {

	var email = $("#email").val();
	var exptext = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;

	if (!exptext.test(email)) { // 이메일 형식이 올바르지않을때
		alert("이메일 형식이 올바르지 않습니다");
		$("#email").focus();
		return false;
	} else { // 이메일 형식이 올바르면 중복 체크

		var _str1 = $("#email").val();

		$.ajax({
			url : '/netflix/emailCheck.do',
			type : "post",
			dataType : "json",
			data : {
				email : $("#email").val()
			},
			contentType : 'application/x-www-form-urlencoded; charset=utf-8',

			success : function(retVal) {
				if (retVal.res == "OK") {
					$(".emailcheck-btn").attr("value", "Y");
					$("#email-alert-true").show();
					$("#email-alert-false").hide();
				} else { // 실패했다면
					$("#email-alert-true").hide();
					$("#email-alert-false").show();
				}
			},
			error : function(request, status, error) {
				alert("ajax통신 실패!!!");
				alert("code:" + request.status + "\n" + "message:"
						+ request.responseText + "\n" + "error:" + error);
			}
		}); // ajax
	} // else
}

/* 비밀번호 체크 */
$(function() {
	$("#pw-alert-true").hide();
	$("#pw-alert-false").hide();
	$("#pw-alert-check").hide();
	/* 8자리 여부 */
	$("#password").keyup(function() {
		var pwd1 = $("#password").val();

		if (pwd1.length < 8) {
			$("#pw-alert-check").show();
			$("#submit").attr("disabled", "disabled");
		} else {
			$("#pw-alert-check").hide();
			$("#submit").removeAttr("disabled");
		}
	});
	/* 비밀번호 일치 여부 */
	$(".pw").keyup(function() {
		var pwd1 = $("#password").val();
		var pwd2 = $("#pwcheck").val();
		if (pwd1 == "" || pwd2 == "") {
			return false;
		} else if (pwd1 != "" && pwd2 != "") {
			if (pwd1 == pwd2) {
				$("#pw-alert-true").show();
				$("#pw-alert-false").hide();
				$("#submit").removeAttr("disabled");
			} else if (pwd1 != pwd2) {
				$("#pw-alert-true").hide();
				$("#pw-alert-false").show();
				$("#submit").attr("disabled", "disabled");
			}
		}
	});

});

/* 빈칸체크 */
function inputChk() {
	var signupForm = document.signupForm;

	var email = signupForm.email.value;
	var emailcheckBtn = $(".emailcheck-btn").val();
	var name = signupForm.name.value;
	var password = signupForm.password.value;
	var pwcheck = signupForm.pwcheck.value;
	var phone = signupForm.phone.value;
	var age = signupForm.age.value;
	var sex = signupForm.sex.value;

	if (!email) {
		alert("이메일을 입력해주세요");
		$("#email").focus();
		return false;
	} else if (emailcheckBtn == "N") {
		alert("이메일 중복확인 버튼을 눌러주세요.");
		$("#email").focus();
		return false;
	} else if (!name) {
		alert("이름을 입력해주세요");
		$("#name").focus();
		return false;
	} else if (!password || !pwcheck) {
		alert("비밀번호를 입력해주세요");
		$("#password").focus();
		return false;
	} else if (password.length < 8 || pwcheck.length < 8) {
		alert("비밀번호를 8자리 이상 입력해주세요");
		$("#password").focus();
		return false;
	} else if (password != pwcheck) {
		alert("비밀번호가 일치하지 않습니다");
		$("#password").focus();
		return false;
	} else if (!phone) {
		alert("핸드폰번호를 입력해주세요");
		$("#phone").focus();
		return false;
	} else if (!age) {
		alert("나이를 입력해주세요");
		$("#age").focus();
		return false;
	} else if (!sex) {
		alert("성별을 입력해주세요");
		$("#sex").focus();
		return false;
	} else if ($("input:checkbox[id='category']").is(":checked") == false) {
		alert("카테고리를 선택해주세요");
		$("#category").focus();
		return false;
	} else {
		signupForm.submit();
	}
}
