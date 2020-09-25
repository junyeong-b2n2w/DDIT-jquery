//password 정규식 체크 - 영 소문자,ㅡ 대문자, 특수문자 숫자가 반드시 하나씩 입력
$('#pwd1').on('keyup', function(){
	passval = $(this).val().trim();
	
	regpasswd = /^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[$%#@!^*_-~]).{4,10}/ ;
	
	if(!(regpasswd.test(passval))){
		regfail(this , "올바른 형식이 아닙니다.");
	}else{
		regpass(this);
	}
	
});
//pass2 일치하는지 비교
$('#pwd2').on('keyup', function(){
	pass1val= $('#pwd1').val().trim();
	pass2val = $(this).val().trim();
	
	if(pass1val==pass2val){
		regpass(this);
		
	}else{
		regfail(this , "비밀번호가 일치하지 않습니다.");
	}
	
});

//전화번호 비교 3 - 4 - 4
$('#phone').on('keyup', function(){
	phoneval = $(this).val().trim();
	
	regphone = /^01[0]{1}-[0-9]{4}-[0-9]{4}$/ ;
	
	if(!(regphone.test(phoneval))){
		regfail(this , "올바른 형식이 아닙니다.");
	}else{
		regpass(this);
	}
	
});

//생년월일

// 이메일 체크




//id 정규식 체크 정규식.test(Value)
$('#id').on('keyup',function() {
			idval = $('#id').val().trim();

			regid = /^[a-z][a-zA-Z0-9]{3,11}$/;

			if (!(regid.test(idval))) {
				//메세지 출력
				$(this).parents('.form-group').find('.msg')
						.html("올바른 형식이 아닙니다").css('color', 'red');
				return false;
			} else {
				$(this).parents('.form-group').find('.msg').html("");
			}
		});
//이름 정규식 체크
$('#name').on('keyup', function() {
	nameval = $(this).val().trim();
	regname = /^[가-힣]{2,5}$/;
	if (!(regname.test(nameval))) {
		regfail(this , "올바른 형식이 아닙니다.");

	} else {
		regpass(this);
	}
});
//이메일 정규식 체크
$('#email').on('keyup', function() {
	emailval = $(this).val().trim();
	regemail = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/;

	if (!(regemail.test(emailval))) {
		regfail(this , "올바른 형식이 아닙니다.");

	} else {
		regpass(this);
	}
});

//이메일 정규식 체크
$('#birth').on('change', function() {
	birval = new Date($(this).val().trim());
	today = new Date();
	
	if ( parseInt(today.getFullYear()) - parseInt(birval.getFullYear()) + 1 < 10) {
		regfail(this , "10살이상 가입 가능합니다.");

	} else {
		regpass(this);
	}
});

//정규화 통과 함수
function regpass(target) {

	sp = $(target).parents('.form-group').find('.sp');
	sp.empty();
	$('<img>', {
		'src' : '/jqpro/images/check.png',
		'width' : '30px'
	}).appendTo(sp);

	$(target).parents('.form-group').find('.msg').html("");
}
//정규식 실패 함수
function regfail(target, text) {
	sp = $(target).parents('.form-group').find('.sp');
	sp.empty();
	$(target).parents('.form-group').find('.msg').html(text).css(
			'color', 'red');
	return false;
}


