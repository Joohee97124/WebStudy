<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// Redirect12.jsp 로부터 get 방식으로 넘겨받은 데이터 수신
	String num1 = request.getParameter("num1");
	String num2 = request.getParameter("num2");
	String op = request.getParameter("op");
	String str = request.getParameter("str");
	
	if(op.equals("1"))
		op = "+";
	else if(op.equals("2"))
		op = "-";
	else if(op.equals("3"))
		op = "*";
	else if(op.equals("4"))
		op = "/";
	
	String resultStr = String.format("%s %s %s = %s", num1, op, num2, str);
		
			
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SampleTest.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css"> 

</head>
<body>

<div>
	<h1>데이터 송수신 실습 12</h1>
	<hr>
</div>

<div>
	<h2>최종 수신 페이지 (Receive11.jsp)</h2>
	<h3>연산결과 : <%=resultStr %></h3>
</div>


</body>
</html>