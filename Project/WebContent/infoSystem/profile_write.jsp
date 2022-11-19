<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="../css/profileview_css.css">
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap" rel="stylesheet">
</head>
      <script>

		$(document).on('click', ".click-btn", function(e) {
			if(e.target.id === 'btn-1') {
				//String sql="select * from traffic where nickname = '" + nick + "'";
				console.log("1��");
			} else if(e.target.id === 'btn-2') {
				console.log("2��");
				
			} else if(e.target.id === 'btn-3') {
				console.log("3��");
				
			}
		}); 
</script>
<body>
<header class="header">
    <a href="MainPage.jsp"><img class ="logoimg"src="../image/logo_mod.png"></a>
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
<%
	String nick = (String) session.getAttribute("NICK");
%>
    <div class="wrapper center">      
      <div class="name"><%=nick %></div>
      <div class="buttons"><button onclick="location.href='profile_part.jsp'">������ ��</button></div>
      <hr>
      <div class="click_btns">
		<button class="click-btn" id="btn-1" onClick="">�غ�ģ��</button>
		<button class="click-btn" id="btn-2">�ȳ�ģ��</button>
		<button class="click-btn" id="btn-3">����ģ��</button></div>
      <!-- ���̺� ���� -->
      <table id="table_align">
          <thead>
          <tr>
              <th>Category</th>
              <th>Title</th>
              <th>Time</th>
              <th>�ٷΰ���</th>
          </tr>
          </thead>
          <tbody>
          
                	  	<%
	request.setCharacterEncoding("UTF-8");
	try {
	
	Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null;

	
	Class.forName("com.mysql.cj.jdbc.Driver"); 
	conn = DriverManager.getConnection("jdbc:mysql://localhost/friend?serverTimezone=UTC", "friends", "2022server");
	String sql="select * from meal where nickname = '" + nick + "'";
	stmt = conn.createStatement();
	rs = stmt.executeQuery(sql);

	while(rs.next()) {

		%>

          <tr>
              <td><%=rs.getString("category") %></td>
              <td><%=rs.getString("title") %></td>
              <td><%=rs.getString("promisetime") %></td>
              <td><a href="../BB/Traffic_writePost.jsp?number=">�ٷΰ���</a></td> <!-- ��ũ �߰��ؾ� �� -->
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
 
          </tbody>
      </table>
      
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