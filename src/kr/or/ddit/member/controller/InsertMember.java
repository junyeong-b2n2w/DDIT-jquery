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
import kr.or.ddit.member.vo.MemberVO;
import kr.or.ddit.member.vo.ZipVO;

/**
 * Servlet implementation class InsertMember
 */
@WebServlet("/insert.do")
public class InsertMember extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
				//post인경우 인코딩먼저 설정해준다.
				request.setCharacterEncoding("utf-8");
				
				
				//1. 클라이언트 요청 시 전송되는 값을 받는다.
				String id = request.getParameter("mem_id");
				String name = request.getParameter("mem_name");
				String pass = request.getParameter("mem_pass");
				String bir = request.getParameter("mem_bir");
				String mail = request.getParameter("mem_mail");
				String hp = request.getParameter("mem_hp");
				String zip = request.getParameter("mem_zip");
				String add1 = request.getParameter("mem_add1");
				String add2 = request.getParameter("mem_add2");
				
				
				MemberVO vo = new MemberVO();
				      
				vo.setMem_id(id);
				vo.setMem_name(name);
				vo.setMem_pass(pass);
				vo.setMem_bir(bir);
				vo.setMem_mail(mail);
				vo.setMem_hp(hp);
				vo.setMem_zip(zip);
				vo.setMem_add1(add1);
				vo.setMem_add2(add2);
				
				
				
				//2. 서비스 객체를 얻는다
				IMemberService servie = MemberServiceImpl.getInstance();
				
				//3. 결과값을 서비스객체 메소드를 통해서 받아온다
				String inidvalue = servie.insertMember(vo);
				
				
				//4. 결과값을 request scope 에 저장한다.
				
				request.setAttribute("idvalue", inidvalue);
				
				//5. jsp로 forward 시킨다
				RequestDispatcher disp = request.getRequestDispatcher("member/insert.jsp");
				
				disp.forward(request, response);
				
	
	}

}
