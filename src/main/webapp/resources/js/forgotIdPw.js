/* csrf 토큰 받아와서 ajax통신이 가능하게 함 (스프링 시큐리티 사용시 필요.) */
var token = $("meta[name='_csrf']").attr("content");
var header = $("meta[name='_csrf_header']").attr("content");
$(function() {
	$(document).ajaxSend(function(e, xhr, options) {
		xhr.setRequestHeader(header, token);
	});
});

/* Email / Password Tap */
$(document).ready(function() {

	$('ul.tabs li').click(function() {
		var tab_id = $(this).attr('data-tab');

		$('ul.tabs li').removeClass('current');
		$('.tab-content').removeClass('current');

		$(this).addClass('current');
		$("#" + tab_id).addClass('current');
	})

});

$(document).on("keyup", "input:text[numberOnly]", function() {
	$(this).val($(this).val().replace(/[^0-9]/gi, ""));
});



/* Email 찾기 */
function findEmail() {

	$.ajax({
		url : '/netflix/findEmail.do',
		type : "POST",
		contentType : 'application/x-www-form-urlencoded; charset=utf-8',
		dataType : "json",
		data : {
			name : $("#name").val(),
			phone : $("#phone").val()
		},
		
		
		success : function(retVal){
			
			var email = retVal.dbemail;
			
			if(email != null){
				alert('회원님의 email은 ' + email + '입니다.');
			} else{
				alert('일치하는 email이 없습니다.');
			}
		},
		error : function(request, status, error) {
			console.log(error);
			alert("ajax통신 실패!!!");
			alert("code:" + request.status + "\n" + "message:"
					+ request.responseText + "\n" + "error:" + error);
			
		}
	});
}

/* Email Password 찾기 시 엔터 키 */
function enterkey1() {
	if (window.event.keyCode == 13) {

		// 엔터키가 눌렸을 때 실행할 내용
		findEmail();
	}
}