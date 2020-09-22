<%@page import="kr.or.ddit.prod.vo.ProdVO"%>
<%@page import="java.util.List"%>
<%@page import="kr.or.ddit.ibatis.config.BuildSqlMapClient"%>
<%@page import="com.ibatis.sqlmap.client.SqlMapClient"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	
String id = request.getParameter("id");
ProdVO vo = null;
if(id.equals("0")){
%>	
	{"result" : "데이터 없음"}
<%	
}else{

SqlMapClient smc = BuildSqlMapClient.getSqlMapClient();
vo = (ProdVO)smc.queryForObject("prod.prodDetail",id);

}
%>
{
	"result" : "ok",
	"id" : "<%=vo.getProd_id() %>",
	"name" : "<%=vo.getProd_name() %>",
	"lgu" : "<%=vo.getProd_lgu() %>",
	"buyer" : "<%=vo.getProd_buyer() %>",
	"outline" : "<%=vo.getProd_ouline() %>",
	"price" : "<%=vo.getProd_price() %>",
	"cost" : "<%=vo.getProd_cost() %>",
	"color" : "<%=vo.getProd_color() %>",
	"sale" : "<%=vo.getProd_sale() %>",
	"size" : "<%=vo.getProd_size() %>"
}











