<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
/*헤더부분*/
* {
	margin: 0;
	padding: 0;
}

body {
	width: 1440px;
	height: 1622px;
	margin: 0 auto;
}

header {
	display: flex;
	flex-direction: row;
	background-color: #20DBB9;
}

h1 {
	color: #ffffff;
	margin-left: 80px;
	margin-right: 100px;
	font-size: 40px;
}

.h_tag {
	font-size: 25px;
	background-color: #17A8AA;
	color: #ffffff;
	margin-left: 70px;
	margin-top: 10px;
	margin-bottom: 10px;
	border-radius: 15px;
	text-decoration: none;
}

/*바디부분*/
section {
	background-color: #DCF1ED;
	height: 1400px;
}

/*푸터부분*/
footer {
	background-color: #FFFFC9;
}

.footer_tag {
	text-align: center;
}

.footer_tag a {
	margin-left: 50px;
	margin-right: 60px;
	text-decoration: none;
	color: black;
	font-size: 24px;
}

.footer_info {
	display: flex;
	flex-direction: row;
	font-size: 24px;
}

.footer_write {
	display: flex;
	flex-direction: column;
	margin-right: 50px;
}

.footer_tel {
	display: flex;
	flex-direction: column;
	margin-right: 50px;
}

.footer_tel .com_tel {
	font-size: 36px;
}

.footer_service {
	display: flex;
	flex-direction: row;
	margin-top: 50px;
}

/**/
.terms_container {
	margin: 0 auto;
	width: 920px;
}

.login_h {
	color: #000000;
	font-weight: bold;
	line-height: 104px;
	text-align: center;
}

.terms_txt {
	font-weight: bold;
	font-size: 36px;
	line-height: 52px;
	align-items: center;
	color: #000000;
}

.terms_box {
	display: flex;
	width: 920px;
	height: 200px;
	background: rgba(196, 196, 196, 0.3);
	border: 1px solid #000000;
	box-sizing: border-box;
}

.terms_box>p {
	padding: 10px;
}

.terms_agreement {
	display: flex;
}

#terms_chk {
	width: 40px;
	height: 40px;
	margin-top: 10px;
	background: #FFFFFF;
	border: 1px solid #000000;
	box-sizing: border-box;
}

.terms_p {
	font-weight: bold;
	margin-left: 20px;
	margin-top: 15px;
	font-size: 24px;
	line-height: 138%;
	align-items: center;
}

.terms_p>span {
	color: blue;
}

/**/
.privacy_txt {
	margin-top: 30px;
	font-weight: bold;
	font-size: 36px;
	line-height: 52px;
	align-items: center;
	color: #000000;
}

.privacy_box {
	display: flex;
	width: 920px;
	height: 200px;
	background: rgba(196, 196, 196, 0.3);
	border: 1px solid #000000;
	box-sizing: border-box;
}

.privacy_box>p {
	padding: 10px;
}

.privacy_agreement {
	display: flex;
}

#privacy_chk {
	width: 40px;
	height: 40px;
	margin-top: 10px;
	background: #FFFFFF;
	border: 1px solid #000000;
	box-sizing: border-box;
}

.privacy_p {
	font-weight: bold;
	margin-left: 20px;
	margin-top: 15px;
	font-size: 24px;
	line-height: 138%;
	align-items: center;
}

.privacy_p>span {
	color: blue;
}

#btn_agreement_next {
	margin-top: 20px;
	margin-left: 200px;
	width: 550px;
	height: 70px;
	background: #00C2FF;
	font-weight: bold;
	font-size: 36px;
	line-height: 52px;
	align-items: center;
	text-align: center;
	color: #FFFFFF;
	border: none;
}
</style>
<script type="text/javascript">
	
</script>
</head>
<body>
	<header>
		<h1>Phone 48</h1>
		<a href="#" class="h_tag">게시글</a> <a href="#" class="h_tag">리뷰</a> <a
			href="#" class="h_tag">마이페이지</a> <a href="#" class="h_tag">고객센터</a> <a
			href="#" class="h_tag">로그아웃</a>
	</header>
	<section>
		<div class="terms_container">
			<h1 class="login_h">Phone 48</h1>
			<p class="terms_txt">이용약관</p>
			<div class="terms_box">
				<p>
					제 1 조 | 목적<br> 이 약관은 ㈜Phone48 ("회사" 또는 "Phone48")가 제공하는 세티즌 및
					세티즌 관련 제반 서비스의 이용과 관련하여 회사와 회원과의 권리, 의무 및 책임사항, 기타 필요한 사항을 규정함을
					목적으로 합니다.<br> <br> 제 2 조 | 용어의 정의<br> [1] 이 약관에서
					사용하는 용어의 정의는 다음과 같습니다.<br> ① "서비스"라 함은 구현되는 단말기(PC, TV, 휴대형단말기
					등의 각종 유무선 장치를 포함)와 상관없이 "회원"이 이용할 수 있는 세티즌 및 세티즌 관련 제반 서비스를 의미합니다.
				</p>
			</div>

			<div class="terms_agreement">
				<input type="checkbox" id="terms_chk">
				<p class="terms_p">
					<span>[필수]</span> 이용약관에 동의합니다.
				</p>
			</div>
			<p class="privacy_txt">개인정보 수집 이용 동의</p>
			<div class="privacy_box">
				<p>
					1. 개인정보의 수집 항목<br> 원활한 서비스 이용과 고객과의 소통을 위해 수집합니다.<br> •
					필수항목: 아이디, 비밀번호, 이메일, 닉네임<br> • 자동수집항목: IP 주소, 접속 기록, 쿠키 등<br>
					<br> 2. 개인정보 보유 및 이용기간<br> - 가입 회원정보는 탈퇴할 시 3년간 보관 후
					파기됩니다.<br>
				</p>
			</div>
			<div class="privacy_agreement">
				<input type="checkbox" id="privacy_chk">
				<p class="privacy_p">
					<span>[필수]</span> 개인정보처리방침에 동의합니다.
				</p>
			</div>
			<button id="btn_agreement_next">다음</button>
		</div>
	</section>
	<footer>
		<div class="footer_tag">
			<a href="#" class="f_tag">이용약관</a> <a href="#" class="f_tag">개인정보취급방침</a>
			<a href="#" class="f_tag">버그 및 건의</a> <a href="#" class="f_tag">안전거래
				가이드</a> <a href="#" class="f_tag">안전거래 등록</a>
		</div>
		<div class="footer_info">
			<div class="footer_write">
				<p>(주)Phone 48</p>
				<p>대표 : 최강류이홍, 사업자등록번호: 111-12-12345</p>
				<p>소재지 : 서울시 마포구 서강로 136</p>
				<p>개설일 : 2021.10.11~</p>
			</div>
			<div class="footer_tel">
				<p>고객센터</p>
				<p class="com_tel">1111-1234</p>
				<p>영업시간 : 09:00~12:00/13:00~18:00</p>
			</div>
			<div class="footer_service">
				<p>FAQ</p>
				<p>1:1상담</p>
			</div>
		</div>
	</footer>
</body>
</html>