<%@page import="kr.or.ddit.ibatis.config.BuildSqlMapClient"%>
<%@page import="kr.or.ddit.lprod.vo.LprodVO"%>
<%@page import="java.util.List"%>
<%@page import="com.ibatis.sqlmap.client.SqlMapClient"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
[    
<%
	// 클라이언트 요청시에 전송되는 데이터를 받는다
	
	//db처리를 한다 - sqlMapClient객체를 얻어와야한다.
	SqlMapClient smc = BuildSqlMapClient.getSqlMapClient();
	
	List<LprodVO> list = smc.queryForList("lprod.selectAllLprod");
	
	for(int i=0; i<list.size(); i++){
		LprodVO vo = list.get(i);
		if( i > 0 ) out.print(",");
%>
{
	"id" : " <%= vo.getLprod_id() %>",
	"gu" : "<%= vo.getLprod_gu() %>",
	"nm" : "<%= vo.getLprod_nm() %>"
}
<%
	}
	
%>
]