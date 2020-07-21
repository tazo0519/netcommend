/* 로그인 시 빈공간 체크 */
function login() {
	var email = $('#loginId').val();
	var password = $('#loginPw').val();
	if (email == "") {
		alert("아이디(E-MAIL)을 입력해주세요.");
		$('#loginId').focus();
		return false;
	}
	if (password == "") {
		alert("비밀번호를 입력해주세요.");
		$('#loginPw').focus();
		return false;
	}
	$('#loginForm').submit();
}

/* 로그인 시 엔터 키 */
function enterkey() {
	if (window.event.keyCode == 13) {

		// 엔터키가 눌렸을 때 실행할 내용
		login();
	}
}