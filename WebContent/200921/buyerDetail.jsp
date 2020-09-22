<%@page import="kr.or.ddit.buyer.vo.BuyerVO"%>
<%@page import="kr.or.ddit.ibatis.config.BuildSqlMapClient"%>
<%@page import="java.util.List"%>
<%@page import="com.ibatis.sqlmap.client.SqlMapClient"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	// 클라이언트 요청시에 전송되는 데이터를 받는다
	String buyer_id = request.getParameter("id");
	//db처리를 한다 - sqlMapClient객체를 얻어와야한다.
	SqlMapClient smc = BuildSqlMapClient.getSqlMapClient();

	  
	


	BuyerVO vo = (BuyerVO)smc.queryForObject("buyer.selectOneBuyer",buyer_id);
	
%>

{
	"id" : "<%=vo.getBuyer_id() %>",
	"name" : "<%= vo.getBuyer_name() %>",
	"lgu" : "<%= vo.getBuyer_lgu() %>",
	"bank" : "<%= vo.getBuyer_bank() %>",
	"bankno" : "<%= vo.getBuyer_bankno() %>",
	"bankname" : "<%= vo.getBuyer_bankname() %>",
	"zip" : "<%= vo.getBuyer_zip() %>",
	"addr" : "<%= vo.getBuyer_add1() %>",
	"comtel" : "<%= vo.getBuyer_comtel() %>",
	"fax" : "<%= vo.getBuyer_fax() %>"
}
<%
	
	
%>
