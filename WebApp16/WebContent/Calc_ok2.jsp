<%@page import="com.test.Calc"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	/* 
	String strSu1 = request.getParameter("su1");
	int su1 = Integer.parseInt(strSu1); 
	*/
%>


<%
	/* 	
// Calc.jsp 페이지로부터 데이터 수신
	String strSu1 = request.getParameter("su1");
	String strSu2 = request.getParameter("su2");
	String op = request.getParameter("op");
	
	int su1, su2 = 0;
	String str = "";
	
	if(strSu1 == null || strSu2 == null)
	{
		response.sendRedirect("Calc.jsp");
	}
	else
	{
		su1 = Integer.parseInt(strSu1);
		su2 = Integer.parseInt(strSu2);
		
		// 자바에서 우리가 설계한 클래스를 사용하기 위해... 객체 생성~!!!
		Calc ob = new Calc();
		//-- 이클립스 자동완성 기능을 사용하여 구문을 작성할 경우
		//  『<%@page import="com.test.Calc"%』 이 구문도 함께 처리됨
		// 혹은, 자동완성 기능을 사용하지 않을 경우도
		// 『<%@page import="com.test.Calc"%』 이와 같이 구문을 직접 
		// 작성해서 해당 클래스를 사용할 수 있도록 처리 해주어야 함
		
		ob.setSu1(su1);
		ob.setSu2(su2);
		ob.setOp(op);
		
		str = ob.result();
		
	}
*/
%> 


<!-- Calc 클래스의 객체를 현재 페이지에서 사용할 수 있도록 지정 -->
<jsp:useBean id="ob" class="com.test.Calc" scope="page"></jsp:useBean>
<!-- 
	이 구문은 스크립 릿 영역에서
	『com.test.Cal ob = new com.test.Calc();』
	을 작성하여 import 구문을 자동으로 처리한 것과
	마찬가지의 효과를 적용하게 된다 = 인스턴스 생성한 것 과 같음 
	서블릿컨테이너가 ! (나=서블릿, 직장=서컨) -->
 
 
<!-- Line 5 ~ 6 에서와 같이 『request.getParameter()』 메소드를 통해
	넘겨받은 (전달받은) 데이터를
	『Calc』 객체 ob에 넘겨주기 위한 속성 지정 -->
<%-- <jsp:setProperty property="su1" name="ob" value="<%=su1 %>" /> --%>
<!-- 이 구문은 Cacl_ok1.jsp 의 『ob.setSu1(su1);』 과 같은 구문 -->
<!-- name (id) -> su1 -> value  -->


<!-- check~!!! -->
<!-- 속성 이름과 동일한 파라미터명인 경우
	 getParameter() 메소드 없이 바로 받을 수 있다 
	 => 알아서 이름 짝지어서 set해준다 (서블릿컨테이너가) : set메소드호출
	 name == 프로퍼티 변수명 
	 => 알아서 형변환도 해준다,,,헉스,,-->
<jsp:setProperty property="su1" name="ob" />
<!-- ① request.gotParameter() 처리
	 ② ob.su1 → ob.setSu1() 처리
	 ③ 매개변수를 전달하기 위한 타입(형) 변환 처리
	 ==> 서블릿 컨테이너가 해준다,,  
	 => 최종적으로 ob → Calc 객체의 us1 속성에
	 이전 페이지로부터 넘겨받은 데이터를
	 적절한 타입(형) 으로 전달-->

<jsp:setProperty property="su2" name="ob" />
<jsp:setProperty property="op" name="ob" />
  

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cal_ok2.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css"> 

</head>
<body>

<div>
	<h1>두 번째 방법 처리 결과</h1>
	<hr>
</div>

<div>
	<%-- <h2><%=str %></h2> --%>
	<h2><%=ob.result() %></h2> 
	<!-- 메소드 호출 -->
</div>


</body>
</html>