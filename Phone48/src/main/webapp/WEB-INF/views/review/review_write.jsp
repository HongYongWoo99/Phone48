<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html> 
<html>
<head>
    <meta charset='utf-8'>
    <meta http-equiv='X-UA-Compatible' content='IE=edge'>
    <title>리뷰 글쓰기 페이지</title>
    <meta name='viewport' content='width=device-width, initial-scale=1'>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.22/css/jquery.dataTables.css">
<script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.22/js/jquery.dataTables.js"></script>
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

   .container{
        width: 1000px;
        margin: 0 auto;
        padding-top: 100px;
        padding-bottom: 200px;       
   }
  
   .board{
        width: 1000px;
        text-align: center; 
        border: 1px solid #dddddd;
        
   }
   .board th{
        height: 50px;
        background-color: #eeeeee; 
        text-align: center;
   }
   .form-control-1{
       width: 850px;
       height: 20px;
   }
   .form-control{
       width: 1000px;
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
   button{
   		width : 100px;
   		margin-left: 900px;
   		margin-top : 10px;
   		background-color: #00C2FF;
		border: 1px solid #00C2FF;
		text-decoration: none; 
		color: #FFFFFF;
		font-size: 20px;
   }
</style>
</head>
<body>
		<c:if test="${sessionScope.client == null }">
    		<script type="text/javascript">
    			alert("로그인 후 작성하실 수 있습니다.");
    			location.href="/";
    		</script>
    	</c:if> 
    <header>
        <h1>Phone 48</h1>
        <a href="#" class="h_tag">게시글</a>
        <a href="#" class="h_tag">리뷰</a>
        <a href="#" class="h_tag">마이페이지</a>
        <a href="#" class="h_tag">고객센터</a>
        <a href="#" class="h_tag">로그아웃</a>
    </header>
    <section>
        <div class="container">
            <form action="reviewWrite.do" method="post" enctype="multipart/form-data">
                <table class="board" >
                    <thead>
                        <tr >
                            <th >게시판 글쓰기 양식</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td> 리뷰 점수 : 
                            	 <select id="review_point" name="review_point">
                            		<option value="1">1점</option> 
                            		<option value="2">2점</option> 
                            		<option value="3">3점</option> 
                            		<option value="4">4점</option> 
                            		<option value="5">5점</option> 
                            	 </select> 
                            	 <input type="text" id="title" name="title" placeholder="제목을 입력하세요" class="form-control-1">
                            </td>
                        </tr>
                        <tr>
                            <td> <textarea class="form-control" placeholder="글 내용" id="review_content"name="review_content" maxlength="2000" style="height:350px;" ></textarea> </td>
                        </tr>
                    </tbody>
                </table>
                <button type="submit" >글쓰기</button>
            </form>
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