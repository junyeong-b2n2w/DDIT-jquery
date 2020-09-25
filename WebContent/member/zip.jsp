<%@page import="kr.or.ddit.member.vo.ZipVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 	 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
		 
    
    
    
    <table class="table">
    	<tr><td>우편번호</td><td>주소</td><td>번지</td></tr>
    <%
    	List<ZipVO> list = (List<ZipVO>)request.getAttribute("listvalue");
    
    	for(int i=0; i < list.size() ; i++){
    		ZipVO vo = list.get(i);
    		String bunji = vo.getBunji() == null 
			    				? ""
			    				:vo.getBunji();
			    		
    		
    	%>
    		<tr class="ziptr"><td><%=vo.getZipcode()%></td><td><%=vo.getSido() +" " + vo.getGugun() +" " + vo.getDong() %></td><td><%=bunji %></td></tr>	
    	<%
    	}
    
    %>
    
    </table>