<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글 보기</title>
<style>
/*헤더부분*/
* {
	margin: 0;
	padding: 0;
}

body {
	width: 1440px;
	height: 1250px;
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
	height: 1220px;
	background-color: #DCF1ED;
}

article {
	display: flex;
	flex-direction: column;
}

.title_tag {
	width: 1240px;
	margin-left: 100px;
	margin-top: 10px;
	background-color: white;
	display: flex;
	flex-direction: row;
}

.title_name {
	margin-left: 10px;
	font-size: 28px;
}

.name_tag {
	visibility: hidden;
}

hr {
	width: 1240px;
	margin-top: 10px;
	margin-left: 100px;
}

.picture {
	width: 720px;
	height: 610px;
	margin-left: 100px;
	margin-top: 20px;
}

.pmain {
	width: 550px;
	height: 610px;
	border: 1px solid black;
}

.psub1 {
	width: 150px;
	height: 166px;
	border: 1px solid black;
	position: absolute;
}

.psub2 {
	width: 150px;
	height: 166px;
	border: 1px solid black;
	position: absolute;
	top: 350px;
}

.psub3 {
	width: 150px;
	height: 166px;
	border: 1px solid black;
}

.product {
	width: 500px;
	height: 610px;
	position: relative;
	bottom: 610px;
	left: 830px;
	border-top: 1px solid black;
}

.pro_board {
	margin-top: 10px;
	border-collapse: collapse;
}

.product th {
	color: #7C6B6B;
	font-size: 20px;
	padding-bottom: 25px;
}

.product td {
	padding-bottom: 25px;
	font-size: 17px;
}

.total {
	border-top: 1px solid black;
}

.text_write {
	width: 1240px;
	height: 300px;
	border: 1px solid black;
	position: relative;
	bottom: 600px;
	left: 100px;
}

textarea {
	width: 1240px;
	height: 300px;
	resize: none;
	background-color: #DCF1ED;
	font-size: 18px;
	display: inline;
}

label {
	display: inline-block;
	color: white;
	background-color: #00C2FF;
	width: 160px;
	height: 50px;
	font-size: 30px;
	cursor: pointer;
	border: 1px solid #00C2FF;
	position: relative;
	left: 25px;
	bottom: 80px;
	text-align: center;
}

#file_upload {
	width: 1px;
	height: 1px;
	overflow: hidden;
}

.board_reload {
	width: 160px;
	height: 50px;
	margin-left: 730px;
	background-color: #00C2FF;
	color: white;
	border: 1px solid #00C2FF;
	font-size: 30px;
	position: relative;
	left: 150px;
	bottom: 75px;
}

.cancel {
	width: 160px;
	height: 50px;
	margin-left: 20px;
	background-color: #00C2FF;
	color: white;
	border: 1px solid #00C2FF;
	font-size: 30px;
	position: relative;
	bottom: 75px;
	left: 150px;
}

.member_info {
	border: 1px solid black;
	width: 850px;
	height: 170px;
	position: relative;
	left: 100px;
	bottom: 590px;
}

.smember_info {
	font-weight: bold;
	margin-left: 70px;
	margin-top: 10px;
	font-size: 18px;
}

.minfo {
	border-collapse: collapse;
}

.memberinfo tr, th, td {
	font-size: 18px;
	padding-top: 15px;
	padding-left: 15px;
}

.sidebtn {
	width: 380px;
	height: 170px;
	border: 1px solid black;
	position: relative;
	left: 960px;
	bottom: 762px;
}

.kakao_btn {
	width: 360px;
	height: 120px;
	background-color: #DCF1ED;
	margin-left: 10px;
	margin-top: 10px;
}

.more_product {
	width: 360px;
	height: 30px;
	background-color: #DCF1ED;
	margin-top: 5px;
	margin-left: 10px;
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
</style>
</head>
<body>
	<header>
		<h1>Phone 48</h1>
		<a href="boardList.do" class="h_tag">게시글</a> <a href="reviewList.do"
			class="h_tag">리뷰</a> <a href="myPage.do" class="h_tag">마이페이지</a> <a
			href="customerCenter.do" class="h_tag">고객센터</a> <a href="logout.do"
			class="h_tag">로그아웃</a>
	</header>
	<section>
		<article>
			<div class="title_tag">
				<p>${bdetail.title }</p>
			</div>
			<hr>
			<div class="picture">
				<img src="image/iphone_1.jpg" alt="" name="product_main"
					class="pmain"> <img src="image/iphone_2.jpg" alt=""
					name="product_sub1" class="psub1"> <img
					src="image/iphone_3.jpg" alt="" name="product_sub2" class="psub2">
				<img src="image/iphone_4.jpg" alt="" name="product_sub3"
					class="psub3">
			</div>
			<div class="product">
				<table class="pro_board">
					<tr>
						<th>브랜드</th>
						<td>${bdetail.btag }</td>
					</tr>
					<tr>
						<th>모델명</th>
						<td>${bdetail.model }</td>
					</tr>
					<tr>
						<th>통신사</th>
						<td>${bdetail.atag }</td>
					</tr>
					<tr>
						<th>제품분류</th>
						<td>${bdetail.ctag }</td>
					</tr>
					<tr>
						<th>제품상태</th>
						<td>${bdetail.ptag }</td>
					</tr>
					<tr class="total">
						<th>판매금액</th>
						<td>${bdetail.price }</td>
					</tr>
				</table>
			</div>

			<div class="text_write">
				${bdetail.content }
				<c:if test="${requestScope.board.id == sessionScope.client.id }">
					<button type="button" class="btnUpdate">수정</button>
					<button type="submit" class="btnDelete">삭제</button>
					<script type="text/javascript">
						var btnDelete = document.querySelector(".btnDelete");
						btnDelete.onclick = function() {
							location.href = "boardDelete.do?bno=${requestScope.board.bno}";
						}
						var btnUpdate = document.querySelector(".btnUpdate");
						btnUpdate.onclick = function() {
							location.href = "boardUpdateView.do?bno=${requestScope.board.bno}";
						}
					</script>
				</c:if>
			</div>
			<div class="member_info">
				<p class="smember_info">판매자정보</p>
				<table class="minfo">
					<tr>
						<th>아이디</th>
						<td>${client.id }</td>
						<th>등급</th>
						<td>${client.grade }</td>
						<th>거래수</th>
						<td>${requestScope.buy_list.id + requestScope.sell_list.id }</td>
					</tr>
				</table>
			</div>

			<div class="sidebtn">
				<script type="text/javascript">
					var result = confirm("구매하시겠어요?");

					if (result) {
						document.write("<h1> ${requestScope.board.tell} </h1>")
					} else {
						location.href = "boardView.do"
					}
				</script>
				<button type="button" class="kakao_btn">카카오로 연락하기</button>
				<button type="button" class="more_product">판매자 다른제품 보기</button>
			</div>
		</article>
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