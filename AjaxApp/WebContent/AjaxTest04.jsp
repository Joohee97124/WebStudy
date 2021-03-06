<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>AjaxTest03.jsp</title>
<link rel="stylesheet" href="<%=cp %>/css/main.css">
<style type="text/css">
	#result
	{
		display: inline-block;
		width: 250px;
		color: #F33;
	}
</style>

<script type="text/javascript" src="<%=cp %>/js/ajax.js"></script>
<script type="text/javascript">

	function check()
	{
		
		// 전통적인 방식, 데이터 받아서 내가 직접 이동하여 server쪽에 확인해보고 와서 다시 페이지 로드
		// 사용자한테는 잠시 대기하도록 하고 나는 이 자리에 있고 꼬맹이(XMLHttpRequest)한테 확인해보도록 시킴
		
		// 데이터 수집
		var id = document.getElementById("id").value;
		
		// URL 준비
		var url = "test03.do?id=" + id;
		
		// XMLHttpRequest 객체 생성
		ajax = createAjax();
		
		// 환경 설정(『open("페이지요청방식", "URL", 동기/비동기)』)
		ajax.open("GET", url, true);
		
		ajax.onreadystatechange = function()
		{
			if (ajax.readyState==4)
			{
				if (ajax.status==200)
					
				{
					// 업무 처리
					//-- 외부로 추출
					callBack();
				}
			}
		}
		
		ajax.send("");
		
	}
	
	// 외부로 추출된 업무 처리 코드 
	//-- 아이디 중복 검사의 결과를 통보받아 사용자에게 메시지 출력
	//   →  span → id:result
	function callBack()
	{
		var data = ajax.responseText;	// Test03OK.jsp 의 result 가 여기에 담김
		
		data = parseInt(data);
		
		if (data==0)
			document.getElementById("result").innerText = "사용 가능한 아이디입니다.";
		else
			document.getElementById("result").innerText = "이미 사용중인 아이디입니다.";
		
	}
	
	function search()
	{
		// 데이터 수집 
		var addr = document.getElementById("iddr").value;
		
		// URL 준비
		var url = "test04.do?addr=" + addr;
		
		// XMLHttpRequest 객체 생성
		ajax = createAjax();
		
		// 환경 설정
		ajax.open("GET", url, true);
		
		ajax.onreadystatechange = function()
		{
			if (ajax.readyState == 4 && ajax.status == 200)
				callBack2();		// 업무 처리 (외부로 추출)
		}
		
		ajax.send("");
	}
	
	// 우편번호 검색 결과를 통보받아 사용자에게 안내해 줄 수 있도록 처리
	function callBack2()
	{
		// XML 문서 전체 참조 객체. (흔히 XML 문서 객체라고 한다.)
		var doc = ajax.responseXML;
		
		// XML 문서의 최상위 엘리먼트
		// -- 현재 우리는 『<list>』 엘리먼트
		var root = doc.documentElement;
		// XML 파일의 내용은 root Element로 전체가 감싸져 있어야한다. → well-formed xml (규칙을 잘 지켜 만든 xml) 
		// XML 에서 documentElement 라는 것은 root Element 를 가져오는 기능
		
		// 루트 엘리먼트를 활용하여 모든 『<item>』 엘리먼트들 반환받기
		var itemList = root.getElementsByTagName("item");
		
		// select box 초기화
		document.getElementById("addrResult").innerHTML = "";
		
		// 검색 결과 확인
		if(itemList.length==0)
		{
			document.getElementById("addrResult").innerHTML
				= "<option>주소를 검색하세요</option>";
		}
		else
		{
			document.getElementById("addrResult").innerHTML
				= "<option value='0'>주소를 선택하세요</option>";
		}
		
		// 검색 결과가 존재할 경우 반복문을 돌며 각 데이터 가져오기
		for (var i=0; i<itemList.length; i++)
		{
			var zipcode = itemList[i].getElementsByTagName("zipcode")[0];
			var address = itemList[i].getElementsByTagName("address")[0];
			
			// ※ 태그가 가지는 텍스트는 태그의 첫 번째 자식이고
			//    텍스트 노드의 값은 nodeValue 로 가져온다.
			
			var zipcodeText = zipcode.firstChild.nodeValue;
			var addressText = address.firstChild.nodeValue;
			
			// select box 에 아이템 추가
			// <option value = '06252/서울특별시...'>[06252] 서울특별시 강남구 강남 ...</option>
			document.getElementById("addrResult").innerHTML
				+= "<option value='" + zipcodeText + "/" + addressText  
				+ "'>[" + zipcodeText + "] " + addressText + "</option>";
		}
		
	}
	
</script>

</head>
<body>

<div>
	<h1>회원가입</h1>
	<p>- AjaxTest03.jsp</p>
	<p>- ajax.js</p>
	<p>- main.css</p>
	<p>- Test03.java</p>		<!-- test03.do -->
	<p>- Test03OK.jsp</p>
	<p>- web.xml</p>
	<!-- 자료구조 활용 → superman, batman, admin -->
	<hr>
</div>

<table class="table">
	<tr>
		<th>아이디</th>
		<td>
			<input type="text" id="id" class="control" />
			<input type="button" value="중복검사" class="control" onclick="check()"/>
			<span id="result"></span>
		</td>
	</tr>
	
	<tr>
		<th>이름</th>
		<td><input type="text" id="name" class="control" /></td>
	</tr>
	
	<tr>
		<th>주소</th>
		<td>
			<input type="text" id="iddr" class="control" />
			<input type="button" value="검색하기" class="control" onclick="search()"/>
			<br>
			<select id="addrResult" class="control">
				<option>주소를 입력하세요</option>
			</select>
		</td>
	</tr>
	
	<tr>
		<th>주소 검색 결과</th>
		<td>
			<input type="text" id="addr1" class="control" readonly="readonly" 
			style="width=:200 px;"/>
			<br>
			<input type="text" id="addr2" class="control"  readonly="readonly" 
			style="width=:200 px;"/>
			<br>
			<input type="text" id="addr3" class="control" readonly="readonly" 
			placeholder="상세주소를 입력하세요." style="width=:200 px;"/>
		</td>
	</tr>
	
	<tr>
		<th>전화</th>
		<td>
			<input type="text" id="tel" class="control" />
		</td>
	</tr>
	
	
</table>

</body>
</html>