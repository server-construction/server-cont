<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">

    
    <script type="text/javascript" src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
    <script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
    <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
    <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />

    <link rel="stylesheet" href="css/reset.css" >
    <link rel="stylesheet" href="css/style.css" >
</head>
<body>

    <div id="wrap">
        <div id="header">
                <div class="container">
                    <div class="top">
                        <div class="logo">
                          <a href="#"><span class="fa fas fa-bars" aria-hidden="true"></span></a> 
                        </div>
                        <div class="title">
                           <h1><a href="#" class="underline-none">������ ������!</a></h1> 
                        </div>
                        <div class="logoin-signup">
                            <ul>
                                <li><a href="#">LOG IN</a></li> 
                                <li><a href="#">SIGNUP</a></li>
                            </ul>
                        </div> 
                    </div>                   
                </div>
        </div>

         <div id="contents">
                <div class="container sub_list">
                    <div class="row">
                   
                    <div class="col-12">
                       <div class="table-head">
                         <div>
                            <span><i class="fa fa-file-text-o" aria-hidden="true"></i></span>
                            <h2>��ü �� ����</h2>
                            <div class="table-sub-n">n���� ��</div>
                         </div>
                         <div>
                            <button>�� �ۼ�</button>
                         </div>
                       </div>
                       <div class="table-div">
                            <table>
                                <thead>
                                    <tr>
                                        <th></th>
                                        <th>����</th>
                                        <th>�ۼ���</th>
                                        <th>�ۼ���</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>@@ ģ�� �Խ���</td>
                                        <td>�� ������ ���ϴ�. �������� ���ϴ�.</td>
                                        <td>�ۼ��ڰ� ���ϴ�.</td>
                                        <td>�ۼ����� ���ϴ�.</td>
                                    </tr>
                                    <tr>
                                        <td>@@ ģ�� �Խ���</td>
                                        <td>�� ������ ���ϴ�. �������� ���ϴ�.</td>
                                        <td>�ۼ��ڰ� ���ϴ�.</td>
                                        <td>�ۼ����� ���ϴ�.</td>
                                    </tr>
                                    <tr>
                                        <td>@@ ģ�� �Խ���</td>
                                        <td>�� ������ ���ϴ�. �������� ���ϴ�.�� ������ ���ϴ�. �������� ���ϴ�.�� ������ ���ϴ�. �������� ���ϴ�.�� ������ ���ϴ�. �������� ���ϴ�.</td>
                                        <td>�ۼ��ڰ� ���ϴ�.</td>
                                        <td>�ۼ����� ���ϴ�.</td>
                                    </tr>
                                    <tr>
                                        <td>@@ ģ�� �Խ���</td>
                                        <td>�� ������ ���ϴ�. �������� ���ϴ�.</td>
                                        <td>�ۼ��ڰ� ���ϴ�.</td>
                                        <td>�ۼ����� ���ϴ�.</td>
                                    </tr>                                                                                                            
                                </tbody>
                            </table>
                       </div>
                    </div>
                </div>
         </div>

         <div id="footer">
             <div class="container">
                    
               <div class="row">                   
                    <div class="col-12">
                        <div class="pagination">
                            <!-- <a href="#">&laquo;</a>
                            <a href="#">&lt;</a> -->
                            <a href="#" class="active">1</a>
                            <a href="#">2</a>
                            <a href="#">3</a>
                            <a href="#">4</a>
                            <a href="#">5</a>
                            <a href="#">&gt;</a>
                            <a href="#">&raquo;</a>
                        </div>  

                         <div class="search">
                            <form method="post" action="/">
                                <!-- <button class="btn mr15">�۱Ⱓ</button> -->
                                <input type="text" name="daterange" class="btn mr15" id="daterange"/>

                                <!-- <button class="btn mr15">�˻� ����</button> -->
                                <select class="btn mr15">
                                    <option>��ü</option>
                                    <option>����</option>
                                    <option>�ۼ���</option>
                                </select>
                              
                                <input type="search"  name="keyword" id="keyword" placeholder="�˻� ������ ��� ���ϴ�.">
                                <button type="submit" class="btn search-btn"> <i class="fa fa-search"></i>�˻�</button>
                               
                            </form>
                         </div>
                    </div>
                </div>             
             </div>
         </div>
    </div>
    </div>
    


<script>
$(function() {
  $('input[name="daterange"]').daterangepicker({
    opens: 'left',
     locale: {
        direction: 'ltr', 
        format: 'YYYY/MM/DD',
        separator: ' - ',
        applyLabel: '����',
        cancelLabel: '���',
        weekLabel: 'W',
        customRangeLabel: '����� ����',
        daysOfWeek: ['��', '��', 'ȭ', '��', '��', '��','��'],
        monthNames: ['1��', '2��', '3��', '4��', '5��', '6��', '7��', '8��', '9��', '10��', '11��', '12��'],
        firstDay: moment.localeData().firstDayOfWeek()            
    }
  }, function(start, end, label) {
    console.log("A new date selection was made: " + start.format('YYYY-MM-DD') + ' to ' + end.format('YYYY-MM-DD'));
    $('#keyword').val("D");
  });
});
</script>  
</body>
</html>