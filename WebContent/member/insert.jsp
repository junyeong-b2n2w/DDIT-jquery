<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = (String)request.getAttribute("idvalue");

	if(id!= null){ %>
		{"sw" : "<%=id%>님 환영합니다."}
	<%}else{%>
		{"sw" : "가입 실패"}
	<%}
%>