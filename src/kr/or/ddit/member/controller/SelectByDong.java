package kr.or.ddit.member.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.member.service.IMemberService;
import kr.or.ddit.member.service.MemberServiceImpl;
import kr.or.ddit.member.vo.ZipVO;

/**
 * Servlet implementation class SelectByDong
 */
@WebServlet("/zip.do")
public class SelectByDong extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//post인경우 인코딩먼저 설정해준다.
		request.setCharacterEncoding("utf-8");
		
		
		//1. 클라이언트 요청 시 전송되는 값을 받는다.
		String dongvalue = request.getParameter("dong");
		
		//2. 서비스 객체를 얻는다
		IMemberService servie = MemberServiceImpl.getInstance();
		
		//3. 결과값을 서비스객체 메소드를 통해서 받아온다
		List<ZipVO> list = servie.selectByDong(dongvalue);		
		
		
		//4. 결과값을 request scope 에 저장한다.
		
		request.setAttribute("listvalue", list);
		
		//5. jsp로 forward 시킨다
		RequestDispatcher disp = request.getRequestDispatcher("member/zip.jsp");
		
		disp.forward(request, response);
		
		
	}

}
