<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.js"></script>
    <link rel="stylesheet" type="text/css" href="css/mainPageStyle.css">
    <script src="script/header.js" type="text/javascript"></script>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    
    <link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap" rel="stylesheet">
	
    <title>Welcome!</title>
</head>
<body>
    <header class="header">
        <a href="MainPage.jsp"><img class ="logoimg"src="image/logo_mod.png"></a>
		<!-- 로그인 했을 때 -->
        <% 
        String id = (String) session.getAttribute("ID");		
    	session.setAttribute("ID", id);
        String nick_getData = (String) session.getAttribute("NICK");
        session.setAttribute("NICK", nick_getData);	
        if(session.getAttribute("ID") != null) { %>
 	        <div class="btnright">
 	        	<%=nick_getData%>님 환영합니다.
<!--  	            <button id="mypageBtn" class="custom-btn btn-3" onclick="location.href='infoSystem/profile.jsp'"><span>Mypage</span></button> -->
 	            <button id="logoutBtn" class="custom-btn btn-3" onclick="location.href='infoSystem/logout.jsp'"><span>LogOut</span></button>
 	        </div>
		<!-- 로그인 안 했을 때 -->
        <% } else { %>
 	        <div class="btnright">
 	        	
 	            <button id="loginBtn" class="custom-btn btn-3" onclick="location.href='infoSystem/loginFrame.jsp'"><span>Log In</span></button>
 	            <button id="sognUpBtn" class="custom-btn btn-3" onclick="location.href='infoSystem/signUp.jsp'"><span>Sign Up</span></button>
 	        </div>
       	<% } %>
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
                    <li><a href="BB/BB_friend.jsp?_index=1"><img src="image/car.png">  붕붕친구</a></li>
                    <li><a href="NN/NN_friend.jsp?_index=1"><img src="image/eat.png">  냠냠친구</a></li>
                    <li><a href="YG/YG_friend.jsp?_index=1"><img src="image/studying.png">  열공친구</a></li>                        
                </ul>
            </div>
            <label for="menuicon" class="background"></label>
        </div>
    </div>
    </header>
    
    
    

    <div id="content">
        <div class="container">
            <div class="row">
                <div class="photo-slider">
                    <img src="image/main_1.png" alt="" class="photo-slider-img NOW">
                    <img id="BB" src="image/BB_slide.png" id="bb" alt="" class="photo-slider-img">
                    <img id="NN" src="image/NN_slide.png" id="nn" alt="" class="photo-slider-img">
                    <img id="YG" src="image/YG_slide.png" id="yg" alt="" class="photo-slider-img">
                </div>
                <div class="photo-controls">
                    <div class="photo-pagination">
                        <div class="photo-page active"><span></span></div>
                        <div class="photo-page"><span></span></div>
                        <div class="photo-page"><span></span></div>
                        <div class="photo-page"><span></span></div>
                    </div>
                </div>
            </div>
        </div>
        <!-- 게시글 보기 -->
        <hr>
        <div id="wrap">
            <div class="simple-view">
                <a class="astyle" href="BB/BB_friend.jsp?_index=1"><p><img src="image/car.png"> 붕붕 친구 게시판</p></a>
                <hr class="hrstyle">
                <%
	                try {
	    				Connection conn = null;
	    				Statement stmt = null;
	    				ResultSet rs = null;
	    				String sql;
	    				
	   					Class.forName("com.mysql.cj.jdbc.Driver");
	   					String url = "jdbc:mysql://localhost:3306/friend";
	   					conn  = DriverManager.getConnection(url, "friends", "2022server");
	   					
	   					sql = "select category, title, number from traffic order by number desc limit 10";
	   					stmt = conn.createStatement();
	   					rs = stmt.executeQuery(sql);
	   					
	   					out.println("<table border=0>");
	   					while(rs.next()){
	   		               	String category = rs.getString(1);
	   		               	String title = rs.getString(2);
	   		               	String number = rs.getString(3);
	   		               	out.println("<tr onClick=location.href='BB/Traffic_writePost.jsp?number="+number+"'><td>[ " + category + " ]</td><td>" + title + "</td></tr>");	
	   		            }
	   					out.println("</table>");
	    				
	   					rs.close();
        				stmt.close();
        				conn.close();
	    			} catch (Exception e) {
	    				e.printStackTrace();
	    			}
                %>
            </div>
            <div class="simple-view">
                <a class="astyle" href="NN/NN_friend.jsp?_index=1"><p><img src="image/eat.png"> 냠냠 친구 게시판</p></a>
                <hr class="hrstyle">
                <%
	                try {
	    				Connection conn = null;
	    				Statement stmt = null;
	    				ResultSet rs = null;
	    				String sql;
	    				
	   					Class.forName("com.mysql.cj.jdbc.Driver");
	   					String url = "jdbc:mysql://localhost:3306/friend";
	   					conn  = DriverManager.getConnection(url, "friends", "2022server");
	   					
	   					sql = "select category, title, number from meal order by number desc limit 10";
	   					stmt = conn.createStatement();
	   					rs = stmt.executeQuery(sql);
	   					
	   					out.println("<table border=0>");
	   					while(rs.next()){
	   		               	String category = rs.getString(1);
	   		               	String title = rs.getString(2);
	   		               	String number = rs.getString(3);
	   		               	out.println("<tr onClick=location.href='NN/Meal_writePost.jsp?number="+number+"'><td>[ " + category + " ]</td><td>" + title + "</td></tr>");	
	   		            }
	   					out.println("</table>");
	    				
	   					rs.close();
        				stmt.close();
        				conn.close();
	    			} catch (Exception e) {
	    				e.printStackTrace();
	    			}
                %>
            </div>
            <div class="simple-view">
                <a class="astyle" href="YG/YG_friend.jsp?_index=1"><p><img src="image/studying.png"> 열공 친구 게시판</p></a>
                <hr class="hrstyle">
                <%
                try {
    				Connection conn = null;
    				Statement stmt = null;
    				ResultSet rs = null;
    				String sql;
    				
   					Class.forName("com.mysql.cj.jdbc.Driver");
   					String url = "jdbc:mysql://localhost:3306/friend";
   					conn  = DriverManager.getConnection(url, "friends", "2022server");
   					
   					sql = "select category, title, number from study order by number desc limit 10";
   					stmt = conn.createStatement();
   					rs = stmt.executeQuery(sql);
   					
   					out.println("<table border=0>");
   					while(rs.next()){
   		               	String category = rs.getString(1);
   		               	String title = rs.getString(2);
   		               	String number = rs.getString(3);
   		               	out.println("<tr onClick=location.href='YG/Study_writePost.jsp?number="+number+"'><td>[ " + category + " ]</td><td>" + title + "</td></tr>");	
   		            }
   					out.println("</table>");
    				
   					rs.close();
    				stmt.close();
    				conn.close();
    			} catch (Exception e) {
    				e.printStackTrace();
    			}
                %>
            </div>
        </div>
        </div>
        
    
    <footer>
        <nav id="bottom_menu">
            <ul>
                <li>구해줘! 프렌즈</li>
                <li>개인정보처리방침</li>
                <li>저작권 정보</li>
                <li>이용 안내</li>
            </ul>
        </nav>
        <div class="items">
            <h2 class="items_name">문의전화</h2>
            <ul>
                <li class="phone">123-1234</li>
                <li>10:00 - 18:00(Lunch 12:00 - 13:00)</li>
            </ul>
        </div>
        <div class="items">
            <h2 class="items_name">구해줘! 프렌즈</h2>
            <ul>
                <li>주소 : 인천광역시 남구 인하로 100</li>
                <li>전화 : 031-123-1234</li>
                <li>팩스 : 031-123-1234</li>
                <li>이메일 : 123-12-12345</li>
            </ul>
        </div>
        <div class="items">
            <h2 class="items_name">입금 정보</h2>
            <ul>
                <li>농협 123-123-123456</li>
                <li>구해줘! 프렌즈</li>
            </ul>
        </div>
     </footer>
</body>
</html>