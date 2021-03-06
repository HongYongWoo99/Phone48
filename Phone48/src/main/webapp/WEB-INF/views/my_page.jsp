<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset='utf-8'>
    <meta http-equiv='X-UA-Compatible' content='IE=edge'>
    <title>나의 구매내역</title>
    <meta name='viewport' content='width=device-width, initial-scale=1'>
    <style>
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
   section{
       display: flex;
       flex-direction: column;
       background-color: #DCF1ED;
       
   }
   
   .txt_container{
       font-size: 20px;
   }
   
   .txt_container th {
       background-color: #eeeeee; 
       text-align: center;
   }
   h2{
       font-size: 30px;
   }
   h3{
       margin-bottom: 30px;
   }
   .container{
        margin: 0 auto;
        width: 1000px;
        padding-top: 100px;
        padding-bottom: 200px;
        text-align: center;       
   }
   .sell_list{
        width: 200px;
        border: 1px solid black;
        display: inline-block;    
        padding: 10px; 
        margin-top: 20px;   
   }
   .buy_list{
        width: 200px;
        border: 1px solid black;
        display: inline-block;
        margin-left: 100px;
        margin-bottom: 50px;
        padding: 10px;
   }
   
   .member{
       border: 1px solid black;
       margin: 0 auto;
        padding: 30px 20px;
        width: 650px;
        text-align: left;
   }
   .table-striped{
       margin-top: 50px;
       padding-left: 20px;
       
   }
   .table-striped td{
       width: 500px;
       border-bottom: 1px solid black;
       padding: 20px 10px;
       
   }
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
		<a href="boardList.do" class="h_tag">게시글</a> <a href="reviewList.do" class="h_tag">리뷰</a> <a
			href="myPage.do" class="h_tag">마이페이지</a> <a href="customerCenter.do" class="h_tag">고객센터</a> <a
			href="logout.do" class="h_tag">로그아웃</a>
    </header>
    <section>
    <div class="container">
        <h2>마이페이지</h2>
    <br>
        <h3>${client.id }님 환영합니다</h3>
    
      <div class="txt_container">
          <p>나의 거래내역</p>
          <div class="sell_list">
              5회 <br>
              나의 판매 내역
            </div>
            <div class="buy_list">
                5회 <br>
                나의 구매 내역
            </div>
            <div class="member">
                <p>회원정보</p>
                <table class="table-striped" >
                    <tbody>
                        <tr>
                            <td><a href="#" >나의 판매 내역확인</a></td>
                        </tr>
                        <tr>
                            <td><a href="buyList.do">나의 구매 내역확인</a></td>
                        </tr>
                        <tr>
                            <td><a href="memberUpdateView.do">회원정보 변경</a></td>
                        </tr>
                        <tr>
                            <td><a href="#">회원탈퇴</a></td>
                        </tr>
                    </tbody>
                </table>
            </div>
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
</html>
