<!-- 
	작성자: 전우진
	열공친구 글모음 + 참여자 페이지
 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" import="java.sql.*"%>

<!DOCTYPE html>
<html>
<head>
 <script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.js"></script>
 <script src="../script/header.js" type="text/javascript"></script>
 <meta charset="UTF-8">
 <meta name="viewport" content="width=device-width, initial-scale=1.0">
 <meta http-equiv="X-UA-Compatible" content="IE=edge">
 <link rel="stylesheet" type="text/css" media="screen" href="../css/writePostStyle.css">
 <link rel="preconnect" href="https://fonts.googleapis.com">
 <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
 <link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap" rel="stylesheet">
 <title>글모음 홈페이지</title>
</head>
<body>
<%
	String number = request.getParameter("number"); // 게시판에서 글번호 받아오기
	
	if(number == null) {
		number = (String) session.getAttribute("NUM");
	}
	session.setAttribute("NUM", number);						// 글 수정을 위해 글 번호 세션에 넘기기
	String nick = (String) session.getAttribute("NICK");		// 게시판에서 NICK, ID 받아오기
	String id = (String) session.getAttribute("ID");		
	String res = (String) request.getParameter("res");
	if (res == null) res = "";
	
	if (res.equals("failed")){
		out.println("<div class=background><div id=popup>"+ "이미 참여했습니다." 
			+ "<button id=closeBtn type=button>확인</button>" +"</div></div>");
	} 
%>

 <script>
	//가상으로 삽입한 팝업창을 닫는 function	
	$(document).on("click", "#closeBtn", function(e) {
		let val = $('#popup').text();
		$('.background').remove();
	});

	// 작성자와 현재 웹을 사용하는 사용자의 nickname이 동일한지 검사한 뒤, 수정하기 위한 데이터를 전송하는 function
	$(document).on("click", "#btn", function(){
		let nickval = $('#_nickName').val();

		let checkMsg;
		let checkState = true;
		
		if (nickval != "<%=nick%>") {
			checkMsg = "수정할 권한이 없습니다.";
			checkState = false;
			
			$('body').append("<div class=background><div id=popup>"+ checkMsg 
					+ "<button id=closeBtn type=button>확인</button>" +"</div></div>");
	}
		if (checkState == true) {
			$("#form_data").attr("action", "Study_writingChangeFrame.jsp");
			$("#form_data").submit();
		}
	});

</script>
    <header class="header">
        <a href="../MainPage.jsp"><img class ="logoimg"src="../image/logo_mod.png"></a>
		<!-- 로그인 했을 때 -->
        <% 
        String nick_getData = (String) session.getAttribute("NICK");
        session.setAttribute("NICK", nick_getData);	
        if(session.getAttribute("ID") != null) { %>
 	        <div class="btnright">
 	        	<%=nick_getData%>님 환영합니다.
 	            <button id="logoutBtn" class="custom-btn btn-3" onclick="location.href='../infoSystem/logout.jsp'"><span>LogOut</span></button>
 	        </div>
		<!-- 로그인 안 했을 때 -->
        <% } else { %>
 	        <div class="btnright">
 	        	
 	            <button id="loginBtn" class="custom-btn btn-3" onclick="location.href='../infoSystem/loginFrame.jsp'"><span>Log In</span></button>
 	            <button id="sognUpBtn" class="custom-btn btn-3" onclick="location.href='../infoSystem/signUp.jsp'"><span>Sign Up</span></button>
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
                    <li><a href="../BB/BB_friend.jsp?_index=1"><img src="../image/car.png">  붕붕친구</a></li>
                    <li><a href="NN_friend.jsp?_index=1"><img src="../image/eat.png">  냠냠친구</a></li>
                    <li><a href="../YG/YG_friend.jsp?_index=1"><img src="../image/studying.png">  열공친구</a></li>                        
                </ul>
            </div>
            <label for="menuicon" class="background"></label>
        </div>
    </div>
    </header>
         
<div id="main_footer">
 <main>
     <div class="main">
	     <form id="form_data" action="Study_writePost.jsp" method="get" >
        	 <table id="_table_writerPage">
        
	<%
	try {
	    Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		
		if(number == null) number = "";
		if(nick == null) nick = "";
		
		Class.forName("com.mysql.cj.jdbc.Driver"); 
		conn = DriverManager.getConnection("jdbc:mysql://localhost/friend?serverTimezone=UTC", "friends", "2022server");
		stmt = conn.createStatement();

		// 게시판에서 글 보기로 넘어올 때 넘버 값 사용
		if(!number.equals("")) {
			rs = stmt.executeQuery("select nickname, title, category, promisetime, sex, count, dest, main, writetime from study where number = '" + number + "'");
		} 
		// 글 작성 후 바로 글 보기로 넘어갈 때 넘버 값을 모르기 때문에 사용자의 NICK을 사용
		else {
			rs = stmt.executeQuery("select nickname, title, category, promisetime, sex, count, dest, main, writetime from study where nickname = '" + nick + "'order by number desc limit 1");
		}
		
		while(rs.next()) {
			%>
             <tr>
                <th class="name" id="table_top"><h2>제목</h2></th>
                 <td id="table_top"><input type="hidden" name="_title" value="<%=rs.getString("title") %>"/><%=rs.getString("title") %></td>
                 <td id="date">작성일자</td>
                 <td id="date_hidden"><input type="hidden" name="_date" value="<%=rs.getString("writetime") %>"/><%=rs.getString("writetime") %></td>
             </tr>
             <tr>
                 <th>작성자</th>
                 <td id="hidden" colspan="2"><input id="_nickName" type="hidden" name="_nickName" value="<%=rs.getString("nickname") %>"/><%=rs.getString("nickname") %></td> <!-- 여기에는 작성자 이름을 받아올 예정 -->        
                 <td id="btn_writePost1"><input id="btn" type="button" value="수정하기"></td>
             </tr>
      		 <tr>
                 <th>종류</th>
                 <td id="hidden" colspan="3"><input type="hidden" name="_type" value="<%=rs.getString("category") %>" /><%=rs.getString("category") %></td>        
             </tr>
             <tr>
                 <th>시간</th>
                 <td id="hidden" colspan="3"><input type="hidden" name="_time" value="<%=rs.getString("promisetime") %>" /><%=rs.getString("promisetime") %></td>        
             </tr>
             <tr>
                 <th>성별</th>
                 <td id="hidden" colspan="3"><input type="hidden" name="_gender" value="<%=rs.getString("sex") %>"/><%=rs.getString("sex") %></td>        
             </tr>
             <tr>
                 <th>인원</th>
                 <td id="hidden" colspan="3"><input type="hidden" name="_person" value="<%=rs.getString("count") %>"/><%=rs.getString("count") %></td>        
             </tr>
             <tr>
                 <th>도착지</th>
                 <td id="hidden" colspan="3"><input type="hidden" name="_arrival" value="<%=rs.getString("dest") %>"/><%=rs.getString("dest") %></td>        
             </tr>
             <tr>
                 <th>기타 내용</th>
                 <td id="context" colspan="3"><input type="hidden" name="_context" value="<%=rs.getString("main") %>"/><%=rs.getString("main") %></td>        
             </tr>
         </table>    
         <input id="btnPost" type="button" value="목록" onclick="location.href='YG_friend.jsp?_index=1'">
         </form>
             	<%		 	}

		rs.close();
		stmt.close();
		conn.close();

	} catch(Exception e) {
		e.printStackTrace();
	}

   %>
     
    <div class="table2">
         <form>
             <table id="_talbe_participants">
     		
             <tr><td class="name" id="border" colspan=2><h2>참여자</h2></td>
              <%
              if(id != null) { %>
             	<td id="border"><input id="btn_check" type="button" value="참여하기" onclick="location.href='Study_participateUser.jsp'"/></td>
             <% } %>
             </tr>
                 <tr>
                     <th class="border_th" id="table_border">이름</th>
                     <th class="border_th" id="table_border">성별</th>
                     <th class="border_th" id="table_border">전화번호</th>
                 </tr>
     <%
        try {
        	Connection conn = null;
      		Statement stmt = null;
      		ResultSet rs = null;
	   		if(number == null) number = "";
	    	if(nick == null) nick = "";
	    	
	        Class.forName("com.mysql.cj.jdbc.Driver"); 
	        conn = DriverManager.getConnection("jdbc:mysql://localhost/friend?serverTimezone=UTC", "friends", "2022server");
	        stmt = conn.createStatement();
	        
			if(!number.equals("")) {
				rs = stmt.executeQuery("select * from studyParticipate where number = '" + number + "'");
			} 
			
			else if(!nick.equals("")) {
				rs = stmt.executeQuery("select * from studyParticipate where name = '" + nick + "'order by number desc limit 1");
			}
			
			while(rs.next()) {
      %> 	
                 <tr>
                     <td id="table_border"><input type="hidden" name="_name" value=""/><%=rs.getString("name") %></td>
                     <td id="table_border"><input type="hidden" name="_sex" value=""/><%=rs.getString("sex") %></td>
                     <td id="table_border"><input type="hidden" name="_phone" value=""/><%=rs.getString("phone") %></td>
                 </tr>
     <%		 	
		}
		rs.close();
		stmt.close();
		conn.close();
	} catch(Exception e) {
		e.printStackTrace();
	}
   %>
             </table>
         </form>
         </div> 
     </div>
 </main>

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
</div>
</body>
</html>