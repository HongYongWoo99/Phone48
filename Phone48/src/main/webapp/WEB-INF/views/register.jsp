<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<style>
/*헤더부분*/
* {
	margin: 0;
	padding: 0;
}

body {
	width: 1440px;
	height: 1622px;
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
	background-color: #DCF1ED;
	height: 1400px;
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

/*************************************/
.register_container {
	margin: 0 auto;
	width: 1000px;
}

.register_h {
	color: #000000;
	font-weight: bold;
	line-height: 104px;
	text-align: center;
}

td {
	padding: 15px;
}

table {
	width: 100%;
}

.register_txt {
	width: 130px;
	font-weight: 500;
	font-size: 32px;
	line-height: 46px;
	align-items: center;
	text-align: center;
	color: #000000;
}

#id, #pass, #pass_check, #name, #nickname, #tel, #address,
	#address_detail {
	width: 100%;
	height: 60px;
	left: 467px;
	top: 251px;
	background: #FFFFFF;
	border: 1px solid #000000;
	box-sizing: border-box;
	border-radius: 10px;
	padding: 10px;
	font-size: 18px;
}

#id_double_check_btn, #nickname_double_check_btn, #address_search {
	width: 100%;
	height: 60px;
	background: rgba(15, 15, 15, 0.64);
	border: 1px solid #000000;
	box-sizing: border-box;
	font-weight: 500;
	font-size: 24px;
	line-height: 35px;
	align-items: center;
	text-align: center;
	color: #FFFFFF;
}

.email, .dash {
	font-weight: bold;
	font-size: 50px;
	align-items: center;
	text-align: center;
	color: #000000;
	padding: 0;
}

#email_sel {
	width: 100%;
	height: 60px;
	background: #FFFFFF;
	border: 1px solid #000000;
	box-sizing: border-box;
	border-radius: 10px;
	font-weight: 300;
	font-size: 24px;
	align-items: center;
	color: black;
}

#tel_sel {
	width: 100%;
	height: 60px;
	left: 467px;
	top: 736px;
	background: #FFFFFF;
	border: 1px solid #000000;
	box-sizing: border-box;
	border-radius: 10px;
	font-weight: 300;
	font-size: 24px;
	line-height: 35px;
	display: flex;
	align-items: center;
	color: #828181;
}

#btn_register {
	width: 550px;
	height: 70px;
	margin-left: 220px;
	background: #00C2FF;
	align-items: center;
	font-weight: bold;
	font-size: 36px;
	line-height: 52px;
	text-align: center;
	border: none;
	color: #FFFFFF;
}
</style>
</head>
<body>
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
        <div class="register_container">
            <h1 class="register_h">회원가입</h1>
            <table class="register_table">
                <tr>
                    <td colspan="2" class="register_txt">아이디</td>
                    <td colspan="6"><input type="text" id="id"
						placeholder="6자 이상(영문자/숫자)"></td>
                    <td colspan="2"><button
							id="id_double_check_btn">중복확인</button></td>
                </tr>
                <tr>
                    <td colspan="2" class="register_txt">비밀번호</td>
                    <td colspan="6"><input type="password"
						id="pass" placeholder="6~20자의 영문/숫자/특수문자"></td>
                    <td colspan="2"></td>
                </tr>
                <tr>
                    <td colspan="2" class="register_txt">비밀번호 확인</td>
                    <td colspan="6"><input type="password"
						id="pass_check" placeholder="비밀번호 한번 더 입력"></td>
                    <td colspan="2"></td>
                </tr>
                <tr>
                    <td colspan="2" class="register_txt">이름</td>
                    <td colspan="6"><input type="text" id="name"
						placeholder="이름을 입력해주세요"></td>
                    <td colspan="2"></td>
                </tr>
                <tr>
                    <td colspan="2" class="register_txt">닉네임</td>
                    <td colspan="6"><input type="text"
						id="nickname" placeholder="별칭을 입력해주세요"></td>
                    <td colspan="2"><button
							id="nickname_double_check_btn">중복확인</button></td>
                </tr>
                <tr>
                    <td colspan="2" class="register_txt">이메일</td>
                    <td colspan="3"><input type="text"
						id="nickname" placeholder="이메일"></td>
                    <td colspan="1" class="email">@</td>
                    <td colspan="4"><select name="email_sel"
						id="email_sel">
                            <option value="gmail.com">gmail.com</option>
                            <option value="naver.com">naver.com</option>
                            <option value="daum.com">daum.net</option>
                            <option value="nate.com">nate.com</option>
                            <option value="kakao.com">kakao.com</option>
                        </select></td>
                </tr>
                <tr>
                    <td colspan="2" class="register_txt">전화번호</td>
                    <td colspan="1"><select name="tel_sel"
						id="tel_sel">
                            <option value="010">010</option>
                            <option value="011">011</option>
                            <option value="019">019</option>
                            <option value="02">02</option>
                            <option value="031">031</option>
                            <option value="032">032</option>
                        </select></td>
                    <td colspan="1" class="dash">-</td>
                    <td colspan="5"><input type="text" id="tel"
						placeholder="- 제외하고 입력해주세요"></td>
                    <td colspan="2"></td>
                </tr>
                <tr>
                    <td colspan="2" rowspan="2" class="register_txt">주소</td>
                    <td colspan="5"><input type="text" id="address"
						placeholder=""></td>
                    <td colspan="1"><button id="address_search">주소 검색</button></td>
                </tr>
                <tr>
                    <td colspan="6"><input type="text"
						id="address_detail" placeholder="상세 주소를 입력해주세요"></td>
                </tr>
                <tr>
                    <td colspan="10">
                        <button id="btn_register">회원가입</button>
                    </td>
                </tr>
            </table>
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
</body>

</html>