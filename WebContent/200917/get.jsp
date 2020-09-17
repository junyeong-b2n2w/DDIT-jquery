<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
span{
	font-size : 1.5em;
	color:red;
}
</style>

</head>
<body>
<%
	String name = request.getParameter("name");
	String id = request.getParameter("id");

%>

<%=name %><span>님 환영합니다. </span><br>
<%=id %><span>님 즐거운시간되세요</span> <br>
</body>
</html>