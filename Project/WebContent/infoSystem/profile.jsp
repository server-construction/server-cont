<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="../css/profileview_css.css">
<script src="https://kit.fontawesome.com/7914cb2195.js" crossorigin="anonymous"></script>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap" rel="stylesheet">
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
 <header class="header">
    <a href="../MainPage.jsp"><img class ="logoimg"src="../image/logo_mod.png"></a>
    <div class="btnright">
    <button id="mypageBtn" class="custom-btn btn-3" onclick="location.href='profile.jsp'"><span>Mypage</span></button>
    <button id="logoutBtn" class="custom-btn btn-3" onclick="location.href='logout.jsp'"><span>LogOut</span></button>
    </div>
    <div id="boardside">
        <input type="checkbox" id="menuicon">
        <label for="menuicon">
            <span></span>
            <span></span>
            <span></span>
        </label>
        <div class="sidebar">
            <div class="cont">
                <ul>
                    <li><a href="BB/BB_friend.jsp"><img src="../image/car.png">  �غ�ģ��</a></li>
                    <li><a href="NN/NN_friend.jsp"><img src="../image/eat.png">  �ȳ�ģ��</a></li>
                    <li><a href="YG/YG_friend.jsp"><img src="../image/studying.png">  ����ģ��</a></li>                        
                </ul>
            </div>
            <label for="menuicon" class="background"></label>
        </div>
    </div>
</header>

  <div class="wrapper small">
      <div class="img-area">
        <div class="inner-area">
          <!-- �̹����� ���ų� ���� -->
        </div>
      </div>
      <div class="name">�г���(���̵�)�� ��</div>
      <div class="about">������ �ڱ�Ұ�(�����)</div>
      
      <div class="buttons">
        <button onclick="location.href='#'">���� �� ��</button>
        <button onclick="location.href='#'">������ ��</button>
      </div>
  </div>

  <footer>

    <nav id="bottom_menu">
        <ul>
            <li>������! ������</li>
            <li>��������ó����ħ</li>
            <li>���۱� ����</li>
            <li>�̿� �ȳ�</li>
        </ul>
    </nav>
    <div class="items">
        <h2 class="items_name">������ȭ</h2>
        <ul>
            <li class="phone">123-1234</li>
            <li>10:00 - 18:00(Lunch 12:00 - 13:00)</li>
        </ul>
    </div>
    <div class="items">
        <h2 class="items_name">������! ������</h2>
        <ul>
            <li>�ּ� : ��õ������ ���� ���Ϸ� 100</li>
            <li>��ȭ : 031-123-1234</li>
            <li>�ѽ� : 031-123-1234</li>
            <li>�̸��� : 123-12-12345</li>
        </ul>
    </div>
    <div class="items">
        <h2 class="items_name">�Ա� ����</h2>
        <ul>
            <li>���� 123-123-123456</li>
            <li>������! ������</li>
        </ul>
    </div>
 </footer>
</body>
</html>