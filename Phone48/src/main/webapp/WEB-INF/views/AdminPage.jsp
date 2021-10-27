<<<<<<< HEAD
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript">
	function deleteAction() {
	var id = $(this).siblings("input[name=id]").val();
	$.ajax({
		url : "deleteMember.do",
		data : "id="+id,
		type:"post",
		dataType:"json",
		success:function(r){
			//결과값을 받는 부분	
			var str = "";
			for(i=0;i<r.length;i++){
				str += "<div class='item'>"
				str += "<input type='text' name='id' value='"+r[i].id+"' placeholder='아이디'>"
				str += "<input type='text' name='name' value='"+r[i].name+"' placeholder='이름'>" 
				str += "<input type='text' name='nickname' value='"+r[i].nickname+"' placeholder='닉네임'>" 
				str += "<input type='text' name='email' value='"+r[i].email+"' placeholder='이메일'>" 
				str += "<input type='number' name='tell' value='"+r[i].tell+"' placeholder='전화번호'>" 
				str += "<input type='text' name='grade' value='"+r[i].grade+"' placeholder='등급'>"
				str += "<input type='text' name='point' value='"+r[i].point+"' placeholder='포인트'>" 
				str += "<button class='btn_memberDelete'>삭제</button>"
				str += "</div>"
			}
			//추가된 새 엘리먼트들이 이벤트 처리 부분 추가
			$(".btnDelete").click(deleteAction);
			$(".dialog").slideDown(500,function(){
				$(this).html("회원등록이 정상적으로 수행되었습니다.");
			
				setTimeout(() => {
					$(".dialog").slideUp(500);
				}, 3000);
			});
		}
	});
}
	$(function() {
		$(".search").click(function() {
			var d = $("form").serialize();
			$.ajax({
				url : "search.do",
				data : d,
				type:"get",
				dataType:"json",
				success:function(r){
					console.log(r);
					var tag = "";
					var arr = r.result;
					
					for(i=0;i<arr.length;i++){
						tag += "<tr>";
						tag += "<td>"+arr[i].id+"</td>";
						tag += "<td>"+arr[i].name+"</td>";
						tag += "<td>"+arr[i].nickname+"</td>";
						tag += "<td>"+arr[i].email+"</td>";
						tag += "<td>"+arr[i].tell+"</td>";
						tag += "<td>"+arr[i].grade+"</td>";
						tag += "<td>"+arr[i].point+"</td>";
						tag += "<td><button class='btn_memberDelete'삭제</button></td>";
						tag += "</tr>";
					}
					$(".result").html(tag);
				}
				
			});
		});
		
	$(".btn_memberDelete").click(deleteAction);
	});
</script>
<style>
* {
	margin: 0;
	padding: 0;
}

body {
	width: 1440px;
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

.section_container {
	width: 1200px;
	margin: 42px auto;
}

.member_list {
	border: 1px solid black;
	width: 1200px;
	border-collapse: collapse;
}

.member_list td {
	text-align: center;
}

.member_list tr {
	height: 30px;
}

.member_list th {
	border-bottom: 1px solid black;
}

.page {
	text-align: center;
}

.form_container {
	text-align: center;
	margin: 20 auto;
}
</style>
</head>
<body>
	<header>
		<h1>Phone 48</h1>
		<a href="#" class="h_tag">게시글</a> <a href="#" class="h_tag">리뷰</a> <a
			href="#" class="h_tag">마이페이지</a> <a href="#" class="h_tag">고객센터</a> <a
			href="#" class="h_tag">로그아웃</a>
	</header>
	<section class="section_container">

		<div>
			<H2>관리자</H2>
			<div class="form_container">
				<form>
					<select name="kind">
						<option value="ID">아이디</option>
						<option value="NICKNAME">닉네임</option>
						<option value="GRADE">등급</option>
					</select> <input type="text" name="search">
					<button type="button" class="search">검색</button>
					<button type="button" class="reset">리셋</button>
				</form>
			</div>
		</div>
		<div>
			<table class="member_list">
				<tr>
					<th>ID</th>
					<th>이름</th>
					<th>닉네임</th>
					<th>이메일</th>
					<th>전화번호</th>
					<th>등급</th>
					<th>포인트</th>
					<th></th>
				</tr>
				<c:forEach var="s" items="${requestScope.list }">
					<tr>
						<td>${s.id}</td>
						<td>${s.name}</td>
						<td>${s.nickname }</td>
						<td>${s.email }</td>
						<td>${s.tell }</td>
						<td>${s.grade }</td>
						<td>${s.point }</td>
						<td><button class="btn_memberDelete">삭제</button></td>
					</tr>
				</c:forEach>
			</table>
		</div>
		<div class="page">1 2 3 4 5</div>

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
=======
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript">
	function deleteAction() {
	var id = $(this).siblings("input[name=id]").val();
	$.ajax({
		url : "deleteMember.do",
		data : "id="+id,
		type:"post",
		dataType:"json",
		success:function(r){
			//결과값을 받는 부분	
			var str = "";
			for(i=0;i<r.length;i++){
				str += "<div class='item'>"
				str += "<input type='text' name='id' value='"+r[i].id+"' placeholder='아이디'>"
				str += "<input type='text' name='name' value='"+r[i].name+"' placeholder='이름'>" 
				str += "<input type='text' name='nickname' value='"+r[i].nickname+"' placeholder='닉네임'>" 
				str += "<input type='text' name='email' value='"+r[i].email+"' placeholder='이메일'>" 
				str += "<input type='number' name='tell' value='"+r[i].tell+"' placeholder='전화번호'>" 
				str += "<input type='text' name='grade' value='"+r[i].grade+"' placeholder='등급'>"
				str += "<input type='text' name='point' value='"+r[i].point+"' placeholder='포인트'>" 
				str += "<button class='btn_memberDelete'>삭제</button>"
				str += "</div>"
			}
			//추가된 새 엘리먼트들이 이벤트 처리 부분 추가
			$(".btnDelete").click(deleteAction);
			$(".dialog").slideDown(500,function(){
				$(this).html("회원등록이 정상적으로 수행되었습니다.");
			
				setTimeout(() => {
					$(".dialog").slideUp(500);
				}, 3000);
			});
		}
	});
}
	$(function() {
		$(".search").click(function() {
			var d = $("form").serialize();
			$.ajax({
				url : "search.do",
				data : d,
				type:"get",
				dataType:"json",
				success:function(r){
					console.log(r);
					var tag = "";
					var arr = r.result;
					
					for(i=0;i<arr.length;i++){
						tag += "<tr>";
						tag += "<td>"+arr[i].id+"</td>";
						tag += "<td>"+arr[i].name+"</td>";
						tag += "<td>"+arr[i].nickname+"</td>";
						tag += "<td>"+arr[i].email+"</td>";
						tag += "<td>"+arr[i].tell+"</td>";
						tag += "<td>"+arr[i].grade+"</td>";
						tag += "<td>"+arr[i].point+"</td>";
						tag += "<td><button class='btn_memberDelete'삭제</button></td>";
						tag += "</tr>";
					}
					$(".result").html(tag);
				}
				
			});
		});
		
	$(".btn_memberDelete").click(deleteAction);
	});
</script>
<style>
* {
	margin: 0;
	padding: 0;
}

body {
	width: 1440px;
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

.section_container {
	width: 1200px;
	margin: 42px auto;
}

.member_list {
	border: 1px solid black;
	width: 1200px;
	border-collapse: collapse;
}

.member_list td {
	text-align: center;
}

.member_list tr {
	height: 30px;
}

.member_list th {
	border-bottom: 1px solid black;
}

.page {
	text-align: center;
}

.form_container {
	text-align: center;
	margin: 20 auto;
}
</style>
</head>
<body>
	<header>
		<h1>Phone 48</h1>
		<a href="#" class="h_tag">게시글</a> <a href="#" class="h_tag">리뷰</a> <a
			href="#" class="h_tag">마이페이지</a> <a href="#" class="h_tag">고객센터</a> <a
			href="#" class="h_tag">로그아웃</a>
	</header>
	<section class="section_container">

		<div>
			<H2>관리자</H2>
			<div class="form_container">
				<form>
					<select name="kind">
						<option value="ID">아이디</option>
						<option value="NICKNAME">닉네임</option>
						<option value="GRADE">등급</option>
					</select> <input type="text" name="search">
					<button type="button" class="search">검색</button>
					<button type="button" class="reset">리셋</button>
				</form>
			</div>
		</div>
		<div>
			<table class="member_list">
				<tr>
					<th>ID</th>
					<th>이름</th>
					<th>닉네임</th>
					<th>이메일</th>
					<th>전화번호</th>
					<th>등급</th>
					<th>포인트</th>
					<th></th>
				</tr>
				<c:forEach var="s" items="${requestScope.list }">
					<tr>
						<td>${s.id}</td>
						<td>${s.name}</td>
						<td>${s.nickname }</td>
						<td>${s.email }</td>
						<td>${s.tell }</td>
						<td>${s.grade }</td>
						<td>${s.point }</td>
						<td><button class="btn_memberDelete">삭제</button></td>
					</tr>
				</c:forEach>
			</table>
		</div>
		<div class="page">1 2 3 4 5</div>

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
>>>>>>> b3aff71c807aef5a6dc1b734ab084082381061a7
</html>