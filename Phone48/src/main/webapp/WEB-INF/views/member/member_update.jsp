<<<<<<< HEAD
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보 수정</title>
<style>
    /*헤더부분*/
    *{
        margin: 0;
            padding: 0;
        }
        body{
            width: 1440px;
            height: 1622px;
            margin: 0 auto;
        }
        header{
            display: flex;
            flex-direction: row;
            background-color: #20DBB9;
        }
        h1{
            color: #ffffff;
            margin-left: 80px;
            margin-right: 100px;
            font-size: 40px;
        }
        .h_tag{
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
        section{
            background-color: #DCF1ED;
        }
        article{
            display: flex;
            flex-direction: column;
        }
        .title{
            font-size: 40px;
            text-align: center;
            margin-bottom: 150px;
        }

        .profile_img{
            margin-left: 300px;
            margin-right: 50px;
            border: 1px solid black;
            width: 150px;
            height: 150px;
            border-radius: 80px;
            float: left;
        }
        .profile p{
            font-size: 36px;
            margin-top: 30px;
            margin-bottom: 20px;
        }
        .fileload{
            margin-bottom: 50px;
        }
        article p{
            font-size: 32px;
            height: 60px;
            margin-bottom: 20px;
        }
        input{
            width: 350px;
            height: 60px;
            border-radius: 10px;
        }
        .pass{
            margin-left: 340px;
        }
        .passcheck{
            margin-left: 264px;
        }
        .name{
            margin-left: 400px;
        }
        .nickname{
            margin-left: 370px;
        }
        .email{
            margin-left: 370px;
        }
        .tel{
            margin-left: 340px;
        }
        .address{
            margin-left: 400px;
        }
        .detail{
            margin-left: 475px;
        }
        .btn{
            width: 550px;
            height: 70px;
            margin-left: 475px;
            background-color: #00C2FF;
            margin-top: 50px;
            margin-bottom: 50px;
            color: white;
            font-size: 36px;
        }
        select{
            width: 150px;
            height: 60px;
            font-size: 24px;
        }
        button{
            width: 190px;
            height: 60px;
            margin-left: 30px;
            background-color: black;
            color: white;
            font-size: 24px;
        }
        p input{
            font-size: 18px;
        }
        /*푸터부분*/
        footer{
            background-color: #FFFFC9;
            
        }
        .footer_tag{
            text-align: center;
        }
        .footer_tag a{
            margin-left: 50px;
            margin-right: 60px;
            text-decoration: none;
            color: black;
            font-size: 24px;
        }
        .footer_info{
            display: flex;
            flex-direction: row;
            font-size: 24px;
        }
        .footer_write{
            display: flex;
            flex-direction: column;
            margin-right: 50px;
            
        }
        .footer_tel{
            display: flex;
            flex-direction: column;
            margin-right: 50px;
        }
        .footer_tel .com_tel{
            font-size: 36px;
        }
        .footer_service{
            display: flex;
            flex-direction: row;
            margin-top: 50px;
        }
    </style>
</head>
<body>
	<header>
            <h1>Phone 48</h1>
            <a href="#" class="h_tag">게시글</a>
            <a href="#" class="h_tag">리뷰</a>
            <a href="#" class="h_tag">마이페이지</a>
            <a href="#" class="h_tag">고객센터</a>
            <a href="#" class="h_tag">로그아웃</a>
    </header>
    <section>
        <p class="title">회원정보 및 비밀번호 변경</p>
        <article>
        <c:if test="${sessionScope.client == null }">
        	<c:redirect url="/"/>
        </c:if>
        <form action="memberUpdate.do">
        	<input type="text" name="id" value="${sessionScope.client.id }" readonly>
            <p class="pass">비밀번호  <input type="password" name="pass" placeholder="6~20자의 영문/숫자/특수문자"></p>
            <p class="passcheck">비밀번호 확인  <input type="password" name="passcheck" placeholder="비밀번호 한번 더 입력"></p>
            <p class="name">이름  <input type="text" name="name" placeholder="이름을 입력해주세요"></p>
            <p class="nickname">닉네임  <input type="text" name="nickname" placeholder="별칭을 입력해주세요"><button type="submit" name="">중복확인</button></p>
            <p class="email">이메일  <input type="email" name="email" placeholder="이메일">@
            <select name="mail" id="mail">
                <option>naver</option>
                <option>gmail</option>
                <option>daum</option>
                <option>직접입력</option>
            </select><button type="submit">이메일 중복확인</button></p>
            <p class="tel">전화번호  
            <select name="tel" id="tel">
                <option>010</option>
                <option>011</option>
                <option>018</option>
                <option>직접입력</option>
            </select>
            <input type="text" name="tel_num" placeholder="- 제외하고 입력해주세요"></p>
            <p class="address">주소 <input type="text" name="place"><button type="submit">주소검색</button></p>
            <input type="text" name="address" class="detail" placeholder="상세주소를 입력해주세요">
            <button type="button" name="btn" class="btn">회원정보 변경</button>
        </form>
        </article>
    </section>
    <footer>
        <div class="footer_tag">
                <a href="#" class="f_tag">이용약관</a>
                <a href="#" class="f_tag">개인정보취급방침</a>
                <a href="#" class="f_tag">버그 및 건의</a>
                <a href="#" class="f_tag">안전거래 가이드</a>
                <a href="#" class="f_tag">안전거래 등록</a>
        </div>
        <div class = "footer_info">

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
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보 수정</title>
<style>
    /*헤더부분*/
    *{
        margin: 0;
            padding: 0;
        }
        body{
            width: 1440px;
            height: 1622px;
            margin: 0 auto;
        }
        header{
            display: flex;
            flex-direction: row;
            background-color: #20DBB9;
        }
        h1{
            color: #ffffff;
            margin-left: 80px;
            margin-right: 100px;
            font-size: 40px;
        }
        .h_tag{
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
        section{
            background-color: #DCF1ED;
        }
        article{
            display: flex;
            flex-direction: column;
        }
        .title{
            font-size: 40px;
            text-align: center;
            margin-bottom: 150px;
        }

        .profile_img{
            margin-left: 300px;
            margin-right: 50px;
            border: 1px solid black;
            width: 150px;
            height: 150px;
            border-radius: 80px;
            float: left;
        }
        .profile p{
            font-size: 36px;
            margin-top: 30px;
            margin-bottom: 20px;
        }
        .fileload{
            margin-bottom: 50px;
        }
        article p{
            font-size: 32px;
            height: 60px;
            margin-bottom: 20px;
        }
        input{
            width: 350px;
            height: 60px;
            border-radius: 10px;
        }
        .pass{
            margin-left: 340px;
        }
        .passcheck{
            margin-left: 264px;
        }
        .name{
            margin-left: 400px;
        }
        .nickname{
            margin-left: 370px;
        }
        .email{
            margin-left: 370px;
        }
        .tel{
            margin-left: 340px;
        }
        .address{
            margin-left: 400px;
        }
        .detail{
            margin-left: 475px;
        }
        .btn{
            width: 550px;
            height: 70px;
            margin-left: 475px;
            background-color: #00C2FF;
            margin-top: 50px;
            margin-bottom: 50px;
            color: white;
            font-size: 36px;
        }
        select{
            width: 150px;
            height: 60px;
            font-size: 24px;
        }
        button{
            width: 190px;
            height: 60px;
            margin-left: 30px;
            background-color: black;
            color: white;
            font-size: 24px;
        }
        p input{
            font-size: 18px;
        }
        /*푸터부분*/
        footer{
            background-color: #FFFFC9;
            
        }
        .footer_tag{
            text-align: center;
        }
        .footer_tag a{
            margin-left: 50px;
            margin-right: 60px;
            text-decoration: none;
            color: black;
            font-size: 24px;
        }
        .footer_info{
            display: flex;
            flex-direction: row;
            font-size: 24px;
        }
        .footer_write{
            display: flex;
            flex-direction: column;
            margin-right: 50px;
            
        }
        .footer_tel{
            display: flex;
            flex-direction: column;
            margin-right: 50px;
        }
        .footer_tel .com_tel{
            font-size: 36px;
        }
        .footer_service{
            display: flex;
            flex-direction: row;
            margin-top: 50px;
        }
    </style>
</head>
<body>
	<header>
            <h1>Phone 48</h1>
            <a href="#" class="h_tag">게시글</a>
            <a href="#" class="h_tag">리뷰</a>
            <a href="#" class="h_tag">마이페이지</a>
            <a href="#" class="h_tag">고객센터</a>
            <a href="#" class="h_tag">로그아웃</a>
    </header>
    <section>
        <p class="title">회원정보 및 비밀번호 변경</p>
        <article>
        <c:if test="${sessionScope.client == null }">
        	<c:redirect url="/"/>
        </c:if>
        <form action="memberUpdate.do">
        	<input type="text" name="id" value="${sessionScope.client.id }" readonly>
            <p class="pass">비밀번호  <input type="password" name="pass" placeholder="6~20자의 영문/숫자/특수문자"></p>
            <p class="passcheck">비밀번호 확인  <input type="password" name="passcheck" placeholder="비밀번호 한번 더 입력"></p>
            <p class="name">이름  <input type="text" name="name" placeholder="이름을 입력해주세요"></p>
            <p class="nickname">닉네임  <input type="text" name="nickname" placeholder="별칭을 입력해주세요"><button type="submit" name="">중복확인</button></p>
            <p class="email">이메일  <input type="email" name="email" placeholder="이메일">@
            <select name="mail" id="mail">
                <option>naver</option>
                <option>gmail</option>
                <option>daum</option>
                <option>직접입력</option>
            </select><button type="submit">이메일 중복확인</button></p>
            <p class="tel">전화번호  
            <select name="tel" id="tel">
                <option>010</option>
                <option>011</option>
                <option>018</option>
                <option>직접입력</option>
            </select>
            <input type="text" name="tel_num" placeholder="- 제외하고 입력해주세요"></p>
            <p class="address">주소 <input type="text" name="place"><button type="submit">주소검색</button></p>
            <input type="text" name="address" class="detail" placeholder="상세주소를 입력해주세요">
            <button type="button" name="btn" class="btn">회원정보 변경</button>
        </form>
        </article>
    </section>
    <footer>
        <div class="footer_tag">
                <a href="#" class="f_tag">이용약관</a>
                <a href="#" class="f_tag">개인정보취급방침</a>
                <a href="#" class="f_tag">버그 및 건의</a>
                <a href="#" class="f_tag">안전거래 가이드</a>
                <a href="#" class="f_tag">안전거래 등록</a>
        </div>
        <div class = "footer_info">

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