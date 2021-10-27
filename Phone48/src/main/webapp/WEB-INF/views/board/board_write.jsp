<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글쓰기</title>
<style>
    /*헤더부분*/
    *{
        margin: 0;
        padding: 0;
    }
    body{
        width: 1440px;
        height: 1250px;
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
        height: 1220px;
        background-color: #DCF1ED;
    }
    article{
        display: flex;
        flex-direction: column;
    }
    .title_tag{
        width: 1240px;
        margin-left: 100px;
        margin-top: 10px;
        background-color: white;
        display: flex;
        flex-direction: row;
    }
    .title_name{
        margin-left: 10px;
        font-size: 28px;
    }
    .name_tag{
        visibility:hidden;
    }
    hr{
        width: 1240px;
        margin-top: 10px;
        margin-left: 100px;
    }
    .picture{
        width: 720px;
        height: 610px;
        margin-left: 100px;
        margin-top: 20px;
    }
    .pmain{
        width: 550px;
        height: 610px;
        border: 1px solid black;
    }
    .psub1{
        width: 150px;
        height: 166px;
        border: 1px solid black;
        position: absolute;

    }
    .psub2{
        width: 150px;
        height: 166px;
        border: 1px solid black;
        position: absolute;
        top:350px;
    }
    .psub3{
        width: 150px;
        height: 166px;
        border: 1px solid black;
    }
    .product{
        width: 500px;
        height: 610px;
        position: relative;
        bottom: 610px;
        left: 830px;
        border-top: 1px solid black;
    }
    .pro_board{
        margin-top: 10px;
        border-collapse: collapse;
    }
    .product th{
        color: #7C6B6B;
        font-size: 20px;
        padding-bottom: 25px;
    }
    .product td{
        padding-bottom: 25px;
        font-size: 17px;
    }
    .total{
        border-top: 1px solid black;
    }
    .text_write{
        width: 1240px;
        height: 300px;
        border: 1px solid black;
        position: relative;
        bottom: 600px;
        left: 100px;
    }
    textarea{
        width: 1240px;
        height: 300px;
        resize: none;
        background-color: #DCF1ED;
        font-size: 18px;
        display: inline;
    }
    label{
        display: inline-block;
        color: white;
        background-color:#00C2FF ;
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
    #file_upload{
        width: 1px;
        height: 1px;
        overflow: hidden;
    }
    .board_upload{
        width: 160px;
        height: 50px;
        margin-left: 710px;
        background-color: #00C2FF;
        color: white;
        border: 1px solid #00C2FF;
        font-size: 30px;
        position: relative;
        right: 30px;
        bottom: 75px;
        
    }
    .cancel{
        width: 160px;
        height: 50px;
        margin-left: 10px;
        background-color: #00C2FF;
        color: white;
        border: 1px solid #00C2FF;
        font-size: 30px;
        position: relative;
        bottom: 75px;
        right: 20px;
    }
    .member_info{
        border: 1px solid black;
        width: 850px;
        height: 170px;
        position: relative;
        left: 100px;
        bottom: 590px;
    }
    .smember_info{
        font-weight: bold;
        margin-left: 70px;
        margin-top: 10px;
        font-size: 18px;
    }
    .minfo{
        border-collapse: collapse;
    }
    .memberinfo tr,th,td{
        font-size: 18px;
        padding-top: 15px;
        padding-left: 15px;
    }
    .sidebtn{
        width: 380px;
        height: 170px;
        border: 1px solid black;
        position: relative;
        left: 960px;
        bottom: 762px;
    }
    .kakao_btn{
        width: 360px;
        height: 120px;
        background-color: #DCF1ED;
        margin-left: 10px;
        margin-top: 10px;
    }
    .more_product{
        width: 360px;
        height: 30px;
        background-color: #DCF1ED;
        margin-top: 5px;
        margin-left: 10px;

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
    <article>
    	<c:if test="${sessionScope.client == null }">
    		<script type="text/javascript">
    			alert("로그인 후 작성하실 수 있습니다.");
    			location.href="/";
    		</script>
    	</c:if>
        <form action="boardWrite.do" method="post" enctype="multipart/form-data">
        <div class="title_tag">
            <input type="text" name="title" placeholder="제목을 입력하세요" class="title_name">
        </div>
        <hr>
        <div class="picture">
            <img src="" alt="" name="product_main" class="pmain">
            <img src="" alt="" name="product_sub1" class="psub1">
            <img src="" alt="" name="product_sub2" class="psub2">
            <img src="" alt="" name="product_sub3" class="psub3">
        </div>
        <div class="product">
            <table class="pro_board">
                    <tr>
                        <th>브랜드</th>
                        <td>
                        	<select name="chk_info" id="target">
								<option value="0">삼성</option>
								<option value="1">애플</option>
								<option value="2">LG</option>
								<option value="3">기타</option>
							</select>
                        </td>
                    </tr>
                    <tr>
                        <th>모델명</th>
                        <td><input type="text" name="product"></td>
                    </tr>
                    <tr>
                        <th>통신사</th>
                        <td>
                        	<select name="chk_info" id="target">
								<option value="4">SKT</option>
								<option value="5">KT</option>
								<option value="6">LG U+</option>
								<option value="7">자급제</option>
								<option value="8">WIFI,미지원</option>
							</select>
                        </td>
                    </tr>
                    <tr>
                        <th>제품분류</th>
                        <td>
                        	<select name="chk_info" id="target">
								<option value="9">5G</option>
								<option value="10">4G</option>
								<option value="11">3G</option>
								<option value="12">2G</option>
								<option value="13">애플OS</option>
								<option value="14">안드로이드</option>
							</select>
						</td>
                    </tr>
                    <tr>
                        <th>제품상태</th>
                        <td>
                        	<select name="chk_info" id="target">
								<option value="15">신품(미사용)</option>
								<option value="16">상태(상)</option>
								<option value="17">상태(중)</option>
								<option value="18">상태(하)</option>
								<option value="19">확정기변</option>
								<option value="20">유심기변</option>
								<option value="21">요금할인</option>
								<option value="22">보증기간이내</option>
								<option value="23">풀박스</option>
								<option value="24">일부 누락</option>
								<option value="25">단품</option>
							</select>
                        </td>
                    </tr>
                    <tr class="total">
                        <th>판매금액</th>
                        <td><input type="number" name="total">원</td>
                    </tr>
            </table>
        </div>
        <div class="text_write">
            <textarea name="content" id="write" placeholder="내용을 입력하세요."></textarea>
            <label for="file_upload">파일업로드</label>
            <input type="file" name="file_upload" id="file_upload">
            <button class="board_upload">글작성</button>
            <button type="button" onclick="history.back();" class="cancel">취소</button>
        </div>
        </form>
        <div class="member_info">
            <p class="smember_info">판매자정보</p>
            <table class="minfo">
                <tr>
                    <th>아이디</th>
                    <td><input type="hidden" name="id" >아이디히든</td>
                    <th>전체거래</th>
                    <td><input type="hidden" name="alldeal" >전체거래히든</td>
                    <th>판매취소</th>
                    <td><input type="hidden" name="scancel" >판매취소히든</td>
                </tr>
                <tr>
                    <th>가입일자</th>
                    <td><input type="hidden" name="date">가입일자히든</td>
                    <th>거래완료</th>
                    <td><input type="hidden" name="dealsuccess">거래완료히든</td>
                    <th>구매취소</th>
                    <td><input type="hidden" name="bcancel">구매취소히든</td>
                </tr>
                <tr>
                    <th>회원등급</th>
                    <td><input type="hidden" name="grade" >회원등급히든</td>
                    <th></th>
                    <td><input type="hidden"></td>
                    <th>반품</th>
                    <td><input type="hidden" name="return" >반품</td>
                </tr>

            </table>
        </div>
        <div class="sidebtn">
            <button type="button" class="kakao_btn">카카오로 연락하기</button>
            <button type="button" class="more_product">판매자 다른제품 보기</button>
        </div>
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
</html>