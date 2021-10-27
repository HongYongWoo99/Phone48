<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<<<<<<< HEAD
=======
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
>>>>>>> b3aff71c807aef5a6dc1b734ab084082381061a7
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
.login_container {
	margin: 0 auto;
	display: flex;
	width: 400px;
}
.login_h {
	color: #000000;
	width: 200px;
	font-weight: bold;
	line-height: 104px;
	text-align: center;
}
#id {
	width: 100%;
	background: #FFFFFF;
	border: 1px solid #000000;
	box-sizing: border-box;
	border-radius: 10px;
	padding: 20px;
	font-size: 20px;
	margin-bottom: 20px;
}
#pass {
	width: 100%;
	background: #FFFFFF;
	border: 1px solid #000000;
	box-sizing: border-box;
	border-radius: 10px;
	padding: 20px;
	font-size: 20px;
	margin-bottom: 20px;
}
#btn_login {
	width: 100%;
	height: 80px;
	left: 524px;
	top: 480px;
	background: #C4C4C4;
	border: 1px solid #000000;
	box-sizing: border-box;
	border-radius: 15px;
	font-style: normal;
	font-weight: bold;
	font-size: 36px;
	align-items: center;
	text-align: center;
	color: #000000;
}
.easy_login {
	margin-top: 20px;
	font-weight: bold;
	font-size: 24px;
	text-align: center;
	color: #000000;
	margin-bottom: 10px;
	text-decoration: none;
}
.register_bar {
	width: 400px;
	height: 57px;
	left: 525px;
	top: 682px;
	background: #C4C4C4;
	border: 1px solid #000000;
	box-sizing: border-box;
	text-align: center;
}
.register_bar a, .register_bar a:link, .register_bar a:visited {
	color: #000000;
	text-decoration: none;
}
td {
	border: none;
}
</style>
<script type="text/javascript">
</script>
</head>
<body>
<<<<<<< HEAD
=======
	<c:if test="${sessionScope.client != null }">
		<c:redirect url="boardList.do"/>
	</c:if>
>>>>>>> b3aff71c807aef5a6dc1b734ab084082381061a7
	<header>
		<h1>Phone 48인덱스</h1>
		<a href="#" class="h_tag">게시글</a> <a href="#" class="h_tag">리뷰</a> <a
			href="#" class="h_tag">마이페이지</a> <a href="#" class="h_tag">고객센터</a> <a
			href="#" class="h_tag">로그아웃</a>
	</header>
	<section>
		<div class="login_container">
		<form action="login.do">
			<table>
				<tr>
					<td colspan="3">
						<h1 class="login_h">Phone 48</h1>
					</td>
				</tr>
				<tr>
					<td colspan="3"><input type="text" id="id" name="id"
						placeholder="아이디를 입력하세요"></td>
				</tr>
				<tr>
					<td colspan="3"><input type="password" id="pass" name="pass"
						placeholder="비밀번호를 입력하세요"></td>
				</tr>
				<tr>
					<td colspan="3">
						<button id="btn_login">로그인</button>
					</td>
				</tr>
				<tr>
					<td colspan="3">
						<p class="easy_login">간편로그인</p>
					</td>
				</tr>
				<tr>
					<td><a href="#"><img src="" alt="네이버로그인"></a></td>
					<td><a href="#"><img src="" alt="카카오로그인"></a></td>
					<td><a href="#"><img src="" alt="구글로그인"></a></td>
				</tr>
				<tr class="register_bar">
					<td><a href="#">아이디 찾기</a></td>
					<td><a href="#">비빌번호 재설정</a></td>
					<td><a href="#">회원가입</a></td>
				</tr>
			</table>
		</form>
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
	<!-- fasdfasdffsdfsdf -->
</body>
</html>