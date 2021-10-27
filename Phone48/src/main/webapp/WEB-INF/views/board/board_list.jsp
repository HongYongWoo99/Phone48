<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 리스트</title>
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
            height: 1000px;
        }
        .search_bar{
            display: inline-block;
            background-color: #C4C4C4;
            width: 1240px;
            height: 130px;
            margin-top: 20px;
            margin-left: 95px;
            text-align: center;
        }
        .sbar{
            width: 650px;
            height: 70px;
            margin-top: 25px;
            border-radius: 50px;
        }
        #srh{
            position: relative;
            right: 70px;
            top: 20px;
            border: 1px solid black;
            border-radius: 30px;
            width: 50px;
            height: 50px;
        }
        .side_tag{
            width: 330px;
            height: 700px;
            border: 1px solid black;
            margin-left: 95px;
        }
        #tag_search{
            margin-top: 10px;
            margin-left: 10px;
            margin-bottom: 10px;
            background-color: #C4C4C4;
            width: 310px;
            height: 40px;
            font-size: 18px;
        }
        .brand{
            width: 310px;
            height: 70px;
            border-top: 1px solid black;
            margin-left: 10px;
        }
        .brand p{
            margin-top: 5px;
        }
        form{
            display: flex;
            flex-direction: row;
            flex-wrap:wrap;
        }
        #tag_brand p{
            margin-right: 30px;
            margin-top: 10px;
        }
        .agency{
            width: 310px;
            height: 110px;
            border-top: 1px solid black;
            margin-left: 10px;
        }
        .agency p{
            margin-top: 5px;
        }
        #tag_agency p{
            margin-right: 50px;
            margin-top: 10px;
        }
        .classification{
            width: 310px;
            height: 140px;
            border-top: 1px solid black;
            margin-left: 10px;
        }
        .classification p{
            margin-top: 5px;
        }
        #tag_classification p{
            margin-right: 50px;
            margin-top: 10px;
        }
        .pro_status{
            width: 310px;
            height: 170px;
            border-top: 1px solid black;
            margin-left: 10px;
        }
        .pro_status p{
            margin-top: 5px;
        }
        #tag_pro_status p{
            margin-top: 5px;
            margin-right: 20px;
            margin-top: 10px;
        }
        .price{
            width: 310px;
            height: 135px;
            border-top: 1px solid black;
            margin-left: 10px;
        }
        .price p{
            margin-top: 5px;
        }
        #tag_price p{
            margin-top: 5px;
            margin-right: 20px;
            margin-top: 10px;
        }
        .main_board{
            width: 900px;
            height: 670px;
			
            position: relative;
            left: 440px;
            bottom: 700px;
            text-align: center;
        }
        table{
            margin-top: 10px;
            border-collapse: collapse;
            margin-bottom: 50px;
        }
        thead{
            font-size: 25px;
            font-weight: bold;
        }
        th{
            margin-top: 90px;
            font-size: 25px;
        }
        td{
            font-size: 25px;
            border-bottom: 1px solid black;
            margin-bottom: 50px;
        }
		.move{
			text-align : right;
			border : none;
		}
		.move a{
			background-color: #00C2FF;
			border: 1px solid #00C2FF;
			text-decoration: none;
			color: #FFFFFF;
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
        <div class="search_bar">
            <input type="text" name="sbar" class="sbar"><input type="image" src="" alt="" id="srh">
        </div>
        <div class="side_tag">
            <button type="submit" id="tag_search">조건검색</button>
            <div class="brand">
                <form action="option_check.do" name="brand" id="tag_brand">
                	<p>브랜드</p>
                    <p><input type="radio" name="chk_info_brand" value="0">삼성</p>
                    <p><input type="radio" name="chk_info_brand" value="1">애플</p>
                    <p><input type="radio" name="chk_info_brand" value="2">LG</p>
                    <p><input type="radio" name="chk_info_brand" value="3">기타</p>
                </form>
            </div>
            <div class="agency">
                <form action="option_check.do" name="agency" id="tag_agency">
                	<p>통신사</p>
                    <p><input type="radio" name="chk_info_agency" value="4">SKT</p>
                    <p><input type="radio" name="chk_info_agency" value="5">KT</p>
                    <p><input type="radio" name="chk_info_agency" value="6">LG U +</p>
                    <p><input type="radio" name="chk_info_agency" value="7">자급제</p>
                    <p><input type="radio" name="chk_info_agency" value="8">WIFI,미지원</p>
                </form>
            </div>
            <div class="classification">
                <form action="option_check.do" name="classification" id="tag_classification">
                	<p>제품분류</p>
                    <p><input type="radio" name="chk_info_classification" value="9">5G</p>
                    <p><input type="radio" name="chk_info_classification" value="10">4G</p>
                    <p><input type="radio" name="chk_info_classification" value="11">3G</p>
                    <p><input type="radio" name="chk_info_classification" value="12">2G</p>
                    <p><input type="radio" name="chk_info_classification" value="13">애플OS</p>
                    <p><input type="radio" name="chk_info_classification" value="14">안드로이드</p>
                </form>
            </div>
            <div class="pro_status">
                <form action="option_check.do" name="pro_status" id="tag_pro_status">
                	<p>제품상태</p>
                    <p><input type="radio" name="chk_info_pro_status" value="15">신품(미사용)</p>
                    <p><input type="radio" name="chk_info_pro_status" value="16">상태(상)</p>
                    <p><input type="radio" name="chk_info_pro_status" value="17">상태(중)</p>
                    <p><input type="radio" name="chk_info_pro_status" value="18">상태(하)</p>
                    <p><input type="radio" name="chk_info_pro_status" value="19">확정기변</p>
                    <p><input type="radio" name="chk_info_pro_status" value="20">유심기변</p>
                    <p><input type="radio" name="chk_info_pro_status" value="21">요금할인</p>
                    <p><input type="radio" name="chk_info_pro_status" value="22">보증기간이내</p>
                    <p><input type="radio" name="chk_info_pro_status" value="23">풀박스</p>
                    <p><input type="radio" name="chk_info_pro_status" value="24">일부누락</p>
                    <p><input type="radio" name="chk_info_pro_status" value="25">단품</p>
                </form>
            </div>
            <div class="price">
                <form action="option_check.do" name="price" id="tag_price">
                	<p>가격</p>
                    <p><input type="radio" name="chk_info_price" value="26">0~10만원</p>
                    <p><input type="radio" name="chk_info_price" value="27">10~20만원</p>
                    <p><input type="radio" name="chk_info_price" value="28">20~30만원</p>
                    <p><input type="radio" name="chk_info_price" value="29">30~50만원</p>
                    <p><input type="radio" name="chk_info_price" value="30">50~80만원</p>
                    <p><input type="radio" name="chk_info_price" value="31">80만원 이상</p>
                </form>
            </div>
        </div>
		<table class="main_board">
                    <tr>
                        <th>글번호</th>
                        <th>ID</th>
                        <th>닉네임</th>
                        <th>제목</th>
                        <th>가격</th>
                        <th>찜보기</th>
                    </tr>
        <c:forEach var="board" items="${requestScope.list }">
                    <tr>
                        <td><a href="boardView.do?bno=${board.bno }">${board.bno }</td>
                        <td><a href="boardView.do?bno=${board.bno }">${board.id }</td>
                        <td><a href="boardView.do?bno=${board.bno }">${board.nickname }</td>
                        <td><a href="boardView.do?bno=${board.bno }">${board.title }</td>
                        <td><a href="boardView.do?bno=${board.bno }">${board.price }원</td>
                        <td><a href="boardView.do?bno=${board.bno }">${board.pick }</td>
                    </tr>
		</c:forEach>
		<tr>
		<td colspan="7">
			<c:if test="${requestScope.pagging.priviousPageGroup }">
				<a href="boardList.do?pageNo=${requestScope.pagging.startPageOfPageGroup-1 }"><<</a>			
			</c:if>			
			<c:forEach var="i" begin="${requestScope.pagging.startPageOfPageGroup}" end="${requestScope.pagging.endPageOfPageGroup}">
				<c:choose>
					<c:when test="${i == requestScope.pagging.currentPageNo }">
						${i }
					</c:when>
					<c:otherwise>
						<a href="boardList.do?pageNo=${i} ">${i }</a>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			<c:if test="${requestScope.pagging.nextPageGroup }">
				<a href="boardList.do?pageNo=${requestScope.pagging.endPageOfPageGroup+1 }">>></a>			
			</c:if>			
		</td>
		</tr>
		<tr>
		<td colspan="7" class="move">
			<a href="boardWriteView.do">글쓰기</a>
		</td>
		</tr>
		</table>
		
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