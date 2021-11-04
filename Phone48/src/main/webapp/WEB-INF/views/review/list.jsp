<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html> 
<html>
<head>
    <meta charset='utf-8'>
    <meta http-equiv='X-UA-Compatible' content='IE=edge'>
    <title>리뷰 게시판 페이지</title>
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
   .table-striped {
   	   width : 1000px;
       text-align: center;
       border: 1px solid #dddddd;
   }
   .txt_container{
       padding-top: 50px;
       font-size: 20px;
   }
   .txt_container th {
       background-color: #eeeeee; 
       text-align: center;
   }
   .table-striped-tbody {
   		border: 1px solid black;
   }
   .grade_container{
        margin: 0 auto;
        padding-top: 100px;
        padding-bottom: 200px;       
   }
   h2 {
      text-align: center;
      font-size: 35px;
   }
   .grade-table{
   	   padding-left: 280px;
       padding-top: 50px;
   }
   .grade-table td{
       padding-left: 50px;
       font-size: 20px;
   }
   .txt_score{
  	   padding-left: 330px;
       padding-top : 50px;
   }
   .txt_score p{
       padding-left: 50px;
       font-size: 20px;
   }
   .btn {
        font-size: 20px;
        text-align : right;
		border : none;
		
   }
   .btn a{
   		background-color: #00C2FF;
		border: 1px solid #00C2FF;
		text-decoration: none; 
		color: #FFFFFF;
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
	<c:if test="${sessionScope.client == null }">
		<script>
			alert("로그인 후 이용하세요");
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
    
    <div class="grade_container">
        <h2>등급표</h2>
        <table class="grade-table">
            <tr>
                <td>Dog</td>
                <td>Person</td>
                <td>Queen</td>
                <td>King</td>
            </tr>
            <tr>
                <td>0~10</td>
                <td>10~20</td>
                <td>20~30</td>
                <td>30~</td>
            </tr>
        </table>
        <div class="txt_score"> 
            <p>현재  ${client.id } 님의 리뷰 점수 : ${totalPoint} </p>
        </div>
        <div class="txt_container">
                <table class="table-striped" >
                    <thead>
                        <tr>
                            <th >글번호</th>
                            <th >ID</th>
                            <th >닉네임</th>
                            <th >제목</th>
                            <th >글내용</th>
                            <th >점수</th>
                        </tr>
                    </thead>
                    <tbody class="table-striped-tbody">
                    <c:forEach var="board" items="${requestScope.list}">
                        <tr >
                            <td>${board.rno }</td>
							<td>${board.id }</td>
							<td>${board.nickname }</td>
							<td>${board.title}</td>
							<td><a href="reviewView.do?rno=${board.rno }">${board.review_content }</a></td>
							<td>${board.review_point}</td>
                        </tr>
                    </c:forEach>
                    </tbody>
                    <tr>
			 			<td colspan="7">
							<c:if test="${requestScope.pagging.priviousPageGroup }">
								<a href="reviewList.do?pageNo=${requestScope.pagging.startPageOfPageGroup-1 }"><<</a>			
							</c:if>			
							<c:forEach var="i" begin="${requestScope.pagging.startPageOfPageGroup}" end="${requestScope.pagging.endPageOfPageGroup}">
								<c:choose>
									<c:when test="${i == requestScope.pagging.currentPageNo }">
										${i }
									</c:when>
									<c:otherwise>
										<a href="reviewList.do?pageNo=${i} ">${i }</a>
									</c:otherwise>
								</c:choose>
							</c:forEach>
							<c:if test="${requestScope.pagging.nextPageGroup }">
								<a href="reviewList.do?pageNo=${requestScope.pagging.endPageOfPageGroup+1 }">>></a>			
							</c:if>			
						</td>
					</tr>
					<tr>
					<td colspan="7" class="btn" >
						<a href="reviewWriteView.do">글쓰기</a>
					</td>
					</tr>
                </table>
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