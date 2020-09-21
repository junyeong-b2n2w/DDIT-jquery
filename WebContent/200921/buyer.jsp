<%@page import="kr.or.ddit.buyer.vo.BuyerVO"%>
<%@page import="kr.or.ddit.ibatis.config.BuildSqlMapClient"%>
<%@page import="java.util.List"%>
<%@page import="com.ibatis.sqlmap.client.SqlMapClient"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
[    
<%
	// 클라이언트 요청시에 전송되는 데이터를 받는다
	
	//db처리를 한다 - sqlMapClient객체를 얻어와야한다.
	SqlMapClient smc = BuildSqlMapClient.getSqlMapClient();
	
	List<BuyerVO> list = smc.queryForList("buyer.selectAllBuyer");
	
	for(int i=0; i<list.size(); i++){
		BuyerVO vo = list.get(i);
		if( i > 0 ) out.print(",");
%>
{
	"id" : "<%=vo.getBuyer_id() %>",
	"name" : " <%= vo.getBuyer_name() %>"
}
<%
	}
	
%>
]