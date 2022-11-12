<!-- 
	작성자: 전우진
	열공친구 글수정 페이지
 -->
 <%@ page language="java" contentType="text/html; charset=UTF-8"
 pageEncoding="UTF-8" import="java.sql.*" %>
 <%@ page import="java.util.Date" %>
 <%@ page import="java.text.SimpleDateFormat" %>
<!DOCTYPE html>
<html>
<head>
 <script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.js"></script>
 <script src="script/header.js" type="text/javascript"></script>
 <meta charset="UTF-8">
     <meta name="viewport" content="width=device-width, initial-scale=1.0">
 <meta http-equiv="X-UA-Compatible" content="IE=edge">
 <link rel="stylesheet" type="text/css" media="screen" href="css/writerStyle.css">
 <title>냠냠친구 글 수정</title>
</head>
<body>

<script>

	// input에 데이터를 입력했는지 검사 후 submit 하여 데이터 전송
	$(document).on("click", "#btn", function(){
		let titleval = $('#_title').val();
		let typeval = $('#_type').val();
		let genval = $('#_gender').val();
		let perval = $('#_person').val();
		let arrval = $('#_arrival').val();
		let conval = $('#_context').val();
		let timeval = $('#_time').val();
		
		let checkMsg;
		let checkState = true;
		
		if (titleval == "" || typeval == "" || genval == "" || perval == ""
			|| arrval == "" || conval == "" || timeval == ""){
			checkMsg = "모든 입력값을 입력해주세요.";
			checkState = false;
			$('body').append("<div class=background><div id=popup>"+ checkMsg 
					+ "<button id=closeBtn type=button>확인</button>" +"</div></div>");
		} 
		
		if(checkState == true)
			$("#form_1").submit();
		}
	);

</script>
<%
 
	String type = request.getParameter("_type");
	String gender = request.getParameter("_gender");
    String person = request.getParameter("_person");
    String alcohol = request.getParameter("_alcohol");

    // writePost로 부터 작성자 받아오기
 	String num = (String) session.getAttribute("NUM");
 	session.setAttribute("NUM", num);
 	
   %>
   
    <header class="header">
        <a href="#"><img class ="logoimg"src="image/logo_mod.png"></a>
        <div class="btnright">
            <button class="custom-btn btn-3"><span>Log In</span></button>
            <button class="custom-btn btn-3"><span>Sign Up</span></button>
        </div>
    </header>
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
                    <li><a href="#">전체 글 보기</a></li>
                    <li><a href="#">붕붕</a></li>
                    <li><a href="#">게시판 이름</a></li>
                    <li><a href="#">게시판 이름</a></li>                        
                    <li><a href="#">게시판 이름</a></li>
                </ul>
            </div>
            <label for="menuicon" class="background"></label>
        </div>
    </div>
         
<div id="main_footer">
 <main>
     <div class="main">
         <div class="main_name">
             <h1>게시글</h1>
         </div>
         
     
     <form id="form_1" action="Study_updateCheck.jsp" method="post" >
         <table>
             <tr>
                 <th>제목</th>
                 <td><input id="text" type="text" name="_title" size="120" maxlength="100" value="<%=request.getParameter("_title") %>"/></td>
             </tr>
             <tr>
                 <th>작성자</th>
                 <td><%=request.getParameter("_nickName") %></td>       
             </tr>
      		 <tr>
                  <th>종류</th>
                  <td>
                      <input id="_type" type="radio" name="_type" value="한식" <% if("한식".equals(type)){%>checked<%}%>/>한식
                      <input id="_type" type="radio" name="_type" value="양식" <% if("양식".equals(type)){%>checked<%}%>/>양식 
                      <input id="_type" type="radio" name="_type" value="일식" <% if("일식".equals(type)){%>checked<%}%>/>일식 
                      <input id="_type" type="radio" name="_type" value="중식" <% if("중식".equals(type)){%>checked<%}%>/>중식
                  </td>        
             </tr>
             <tr>
                 <th>시간</th>
                 <td><input id="text" type="text" name="_time" size="50" maxlength="100" value="<%=request.getParameter("_time") %>" /></td>        
             </tr>
             <tr>
                 <th>성별</th>
                 <td><input id="_gender" type="radio" name="_gender" value="여자" <% if("여자".equals(gender)){%>checked<%}%>/>여자 
                        <input id="_gender" type="radio" name="_gender" value="남자" <% if("남자".equals(gender)){%>checked<%}%>/>남자
                        <input id="_gender" type="radio" name="_gender" value="상관없음" <% if("상관없음".equals(gender)){%>checked<%}%>/>상관없음
                 </td>        
             </tr>
             <tr>
                 <th>인원</th>
                 <td><input id="_person" type="radio" name="_person" value="2명" <% if("2명".equals(person)){%>checked<%}%>/>2명 
                     <input id="_person" type="radio" name="_person" value="3명" <% if("3명".equals(person)){%>checked<%}%>/>3명
                     <input id="_person" type="radio" name="_person" value="4명" <% if("4명".equals(person)){%>checked<%}%>/>4명
                     <input id="_person" type="radio" name="_person" value="5명 이상" <% if("5명 이상".equals(person)){%>checked<%}%>/>5명 이상
                     <input id="_person" type="radio" name="_person" value="상관없음" <% if("상관없음".equals(person)){%>checked<%}%>/>상관없음
                 </td>        
             </tr>
             <tr>
                   <th>도착지</th>
                   <td><input id="text" type="text" name="_arrival" size="50" maxlength="100" value="<%=request.getParameter("_arrival") %>"/></td>        
             </tr>
             <tr>
                 <th>기타 내용</th>
                 <td><textarea id="context" name="_context" cols="122" rows="10" value=""><%=request.getParameter("_context") %></textarea></td>        
             </tr>
             <tr>
                 <td colspan="2"><input id="btn" type="button" value="수정하기"></td>
             </tr>
         </table>    
         </form>
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