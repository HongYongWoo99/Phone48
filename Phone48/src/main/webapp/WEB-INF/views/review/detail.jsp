<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html> 
<html>
<head>
<meta charset="UTF-8">
<title>상세 리뷰페이지</title>
</head>
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
	section{
       display: flex;
       flex-direction: column;
       background-color: #DCF1ED;
       font-size: 20px;
       font-weight: bold;
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
        margin: 40px auto;
    }

    #nickname {
        width: 1200px;
        font-size: 20px;
        border: 1px solid black;
    }

    #state_container {
        display: flex;
        flex-direction: row;
        width: 1200px;
        border: 1px solid black;
    }

    #write_date {
        width: 398px;
        text-align: right;
    }

    .title_container {
        display: flex;
        flex-direction: row;
        width: 1200px;
        border: 1px solid black;
    }

    #title {
        width: 800px;
    }

    #review_point {
        text-align: right;
        width: 400px;
    }

    #reviewContent {
        width: 1200px;
        height: 400px;
        border: 1px solid black;
    }
    .btn {
        font-size: 20px;
        text-align : right;
		border : none;
		padding-top: 5px;
   }
   .btn a{
   		background-color: #00C2FF;
		border: 1px solid #00C2FF;
		text-decoration: none; 
		color: #FFFFFF;
   }
</style>
<body>
    <header>
        <h1>Phone 48</h1>
		<a href="boardList.do" class="h_tag">게시글</a> <a href="reviewList.do" class="h_tag">리뷰</a> <a
			href="myPage.do" class="h_tag">마이페이지</a> <a href="customerCenter.do" class="h_tag">고객센터</a> <a
			href="logout.do" class="h_tag">로그아웃</a>
    </header>
    <section >
    <div class="section_container">
        <div id="nickname">
            <img src="" alt=""> 닉네임 : ${client.nickname}
        </div>
        <div id="state_container">
            <div id="title">제목 : ${detail.title}</div>
            <div id="write_date">작성일 : 2021.09.23</div>
        </div>

        <div class="title_container">
            <div id="title">
              아이디 : ${client.id}
            </div>
            <div id="review_point">
                평점 : ${detail.review_point}
            </div>
        </div>
        <div id="reviewContent">
			${detail.review_content}
        </div>
        <div class="btn"> <a href="reviewUpdateView.do?rno=${requestScope.detail.rno}">수정</a>
       		 <a href="reviewDelete.do?rno=${requestScope.detail.rno}">삭제</a>
       	 </div>
    </div>     
    </section>
    <footer>
        <div class="footer_tag">
            <a href="#" class="f_tag">이용약관</a>
            <a href="#" class="f_tag">개인정보취급방침</a>
            <a href="#" class="f_tag">버그 및 건의</a>
            <a href="#" class="f_tag">안전거래 가이드</a>
            <a href="#" class="f_tag">안전거래 등록</a>
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