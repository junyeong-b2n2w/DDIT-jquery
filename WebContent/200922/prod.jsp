<%@page import="kr.or.ddit.prod.vo.ProdVO"%>
<%@page import="java.util.List"%>
<%@page import="kr.or.ddit.ibatis.config.BuildSqlMapClient"%>
<%@page import="com.ibatis.sqlmap.client.SqlMapClient"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	
String lgu = request.getParameter("gu");

SqlMapClient smc = BuildSqlMapClient.getSqlMapClient();

List<ProdVO> list = smc.queryForList("prod.selectIdName", lgu);

if(list == null || list.size() < 1){
%>
	{
		"sw" : "no"
	}
	
<% }else{  %>
	{
		"sw" : "ok",
		"datas" : [
	<%
	for(int i = 0; i<list.size();i++){
		ProdVO vo = list.get(i);
		if(i>0) out.print(",");
	%>	
		{
			"id":"<%=vo.getProd_id() %>",
			"name":"<%=vo.getProd_name() %>"
		}	
		
	<% 		
	}
	%>		
		]
	}	
<%	
}
%>




