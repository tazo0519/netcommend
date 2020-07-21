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
	    $(this).val( $(this).val().replace(/[^0-9]/gi,"") );
	});


