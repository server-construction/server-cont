<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="css/profile_css.css">
<script src="https://kit.fontawesome.com/7914cb2195.js" crossorigin="anonymous"></script>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap" rel="stylesheet">
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	
  <div class="wrapper">
      <div class="img-area">
        <div class="inner-area">
          <!-- �̹����� ���ų� ���� -->
        </div>
      </div>
      <div class="icon arrow"><i class="fas fa-arrow-left"></i></div>
      <div class="icon dots"><i class="fas fa-ellipsis-v"></i></div>
      <div class="name">
      		<%
      			String nick_getData = (String) session.getAttribute("NICK");
      			out.println(nick_getData + "��");
      		%>
      </div>
      <div class="about">������ �ڱ�Ұ�(�����)</div>
      <!-- <div class="social-icons">
        <a href="#" class="fb"><i class="fab fa-facebook-f"></i></a>
        <a href="#" class="twitter"><i class="fab fa-twitter"></i></a>
        <a href="#" class="insta"><i class="fab fa-instagram"></i></a>
        <a href="#" class="yt"><i class="fab fa-youtube"></i></a>
      </div> -->
      <div class="buttons">
        <button onclick="location.href='#'">���� �� ��</button>
        <button onclick="location.href='#'">������ "�̸���õ�޽��ϴ�."</button>
      </div>
        <!-- like, comment, share Ŭ���� : ���� ���� -->
        <!-- <div class="social-share">
          <div class="row">
            <i class="far fa-heart"></i>
            <i class="icon-2 fas fa-heart"></i>
            <span>20.4k</span>
          </div>
          <div class="row">
            <i class="far fa-comment"></i>
            <i class="icon-2 fas fa-comment"></i>
            <span>14.3k</span>
          </div>
          <div class="row">
            <i class="fas fa-share"></i>
            <span>12.8k</span>
          </div> 
        </div>-->
  </div>
	
</body>
</html>