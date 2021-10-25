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
        <a href="#" class="h_tag">�Խñ�</a>
        <a href="#" class="h_tag">����</a>
        <a href="#" class="h_tag">����������</a>
        <a href="#" class="h_tag">������</a>
        <a href="#" class="h_tag">�α׾ƿ�</a>
    </header>
    <section class="section_container">
        <div id="nickname">
            <img src="" alt=""> ���ٶ���
        </div>
        <div id="state_container">
            <div id="state">�ǸſϷ�</div>
            <div id="write_date">2021.09.23</div>
        </div>

        <div class="title_container">
            <div id="title">
                ������Z�ø� 5G
            </div>
            <div id="price">
                450,000��
            </div>
        </div>
        <div id="reviewContent">
            �������� �� ���翡 ���� ���� ��Ÿ �ʿ��� ������ ������ ���Ѵ�.
            ��� ������ �ΰ����μ��� ������ ��ġ�� ������,
            �ູ�� �߱��� �Ǹ��� ������.
            ������ ������ ������ �Ұ�ħ�� �⺻�� �α��� Ȯ���ϰ� �̸� ������ �ǹ��� ����.
            ����ȸ�Ǵ� ����ɡ������Ѹ��� 15�� �̻� 30�� ������ ������������ �����Ѵ�.
        </div>
    </section>
    <footer>
        <div class="footer_tag">
            <a href="#" class="f_tag">�̿���</a>
            <a href="#" class="f_tag">����������޹�ħ</a>
            <a href="#" class="f_tag">���� �� ����</a>
            <a href="#" class="f_tag">�����ŷ� ���̵�</a>
            <a href="#" class="f_tag">�����ŷ� ���</a>
        </div>
        <div class="footer_info">

            <div class="footer_write">
                <p>(��)Phone 48</p>
                <p>��ǥ : �ְ�����ȫ, ����ڵ�Ϲ�ȣ: 111-12-12345</p>
                <p>������ : ����� ������ ������ 136</p>
                <p>������ : 2021.10.11~</p>
            </div>
            <div class="footer_tel">
                <p>������</p>
                <p class="com_tel">1111-1234</p>
                <p>�����ð� : 09:00~12:00/13:00~18:00</p>
            </div>
            <div class="footer_service">
                <p>FAQ</p>
                <p>1:1���</p>
            </div>
        </div>

    </footer>
</body>
</html>