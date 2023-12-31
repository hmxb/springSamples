<%@page import="ssg.com.a.dto.MemberDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>hello.jsp</title>
<script src="./jquery.min.js"></script>
</head>
<body>
<%
	List<MemberDto> list = (List<MemberDto>)request.getAttribute("list");
%>

<h2>Hello</h2>
<table border="1">
<tr>
	<th>번호</th><th>아이디</th><th>패스워드</th><th>이름</th><th>이메일</th>
</tr>
<%
if(list != null && list.size() > 0){
	for(int i = 0;i < list.size(); i++){
		MemberDto dto = list.get(i);
		%>
		<tr>
			<th><%=i+1 %></th>
			<td><%=dto.getId() %></td>
			<td><%=dto.getPwd() %></td>
			<td><%=dto.getName() %></td>
			<td><%=dto.getEmail() %></td>
		</tr>
		<%
	}
}
%>
</table>
<br>
<hr>
<br>

<form action="find.do">
id:<input type="text" name="id" size="20">
<input type="submit" value="회원정보찾기">
</form>

<%
	MemberDto mem = (MemberDto)request.getAttribute("mem");
	if(mem != null){
		%>
			회원정보:<input type="text" value="<%=mem.getName() %>">
		<%
	}
%>

<br>
<hr>
<br>

<!-- id 확인 -->
id:<input type="text" id="idcheck"><br><br>
<button type="button" onclick="idfunc()">아이디첵크</button>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script type="text/javascript">
function idfunc() {
	
	$.ajax({
		url:"idcheck.do",
		type:"get",
		data:{ "id":$("#idcheck").val() },
		success:function(msg){
			alert('success');
			alert(msg);
		},
		error:function(){
			alert('error');
		}
	})	
}
</script>

<br>
<hr>
<br>

id:<input type="text" id="id"><br>
pw:<input type="text" id="pwd"><br>
name:<input type="text" id="name"><br>
email:<input type="text" id="email"><br><br>
<button type="button" id="account">회원가입</button>

<script type="text/javascript">
$("#account").click(function(){
	let member = {
		"id":$("#id").val(),
		"pwd":$("#pwd").val(),
		"name":$("#name").val(),
		"email":$("#email").val()
	};
	
	$.ajax({
		url:"account.do",
		type:"post",			
		data:member,
		async:true,
		success:function( msg ){
		//	alert('success');
			alert(msg);
		},
		error:function(){
			alert('error');
		}		
	})	
});
</script>


<br>
<hr>
<br>

<button type="button" id="listBtn">list 가져오기</button>

<script type="text/javascript">
$("#listBtn").click(function(){
	
	$.ajax({
		url:"getlist.do",
		type:"get",
		success:function(list){
			// alert('success');
			alert(JSON.stringify(list));
			// alert(list[1].id); // abc <- 홍길동 id
		},
		error:function(){
			alert('error');
		}
	});	
});
</script>

<br>
<hr>
<br>

<button type="button" id="mapbtn">맵가져오기</button>

<script type="text/javascript">
$("#mapbtn").click(function(){
	
	$.ajax({
		url:"getmap.do",
		type:"get",
		success:function(map){
			// alert('success');
		//	alert(JSON.stringify(map));
			
			let list = map.list; 
			alert(JSON.stringify(list));
		},
		error:function(){
			alert('error');
		}
	})
	
})
</script>


</body>
</html>








