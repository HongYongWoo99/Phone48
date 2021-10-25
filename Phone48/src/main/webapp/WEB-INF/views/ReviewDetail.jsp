<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
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

    #state {
        width: 800px;
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

    #price {
        text-align: right;
        width: 400px;
    }

    #reviewContent {
        width: 1200px;
        height: 400px;
        border: 1px solid black;
    }
</style>
<body>
    <header>
        <h1>Phone 48</h1>
        <a href="#" class="h_tag">게시글</a>
        <a href="#" class="h_tag">리뷰</a>
        <a href="#" class="h_tag">마이페이지</a>
        <a href="#" class="h_tag">고객센터</a>
        <a href="#" class="h_tag">로그아웃</a>
    </header>
    <section class="section_container">
        <div id="nickname">
            <img src="" alt=""> 참다랑어
        </div>
        <div id="state_container">
            <div id="state">판매완료</div>
            <div id="write_date">2021.09.23</div>
        </div>

        <div class="title_container">
            <div id="title">
                갤럭시Z플립 5G
            </div>
            <div id="price">
                450,000원
            </div>
        </div>
        <div id="reviewContent">
            국정감사 및 조사에 관한 절차 기타 필요한 사항은 법률로 정한다.
            모든 국민은 인간으로서의 존엄과 가치를 가지며,
            행복을 추구할 권리를 가진다.
            국가는 개인이 가지는 불가침의 기본적 인권을 확인하고 이를 보장할 의무를 진다.
            국무회의는 대통령·국무총리와 15인 이상 30인 이하의 국무위원으로 구성한다.
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