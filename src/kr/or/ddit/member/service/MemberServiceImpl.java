package kr.or.ddit.member.service;

import java.util.List;

import kr.or.ddit.member.dao.IMemberDao;
import kr.or.ddit.member.dao.MemberDaoImpl;
import kr.or.ddit.member.vo.MemberVO;
import kr.or.ddit.member.vo.ZipVO;

/*
 * dao 메소드를 호출하기 위해서 dao객체를 얻어온다.
 * Controller에서 사용할 수  있도록 자신의 객체를 생성하고 리턴한다.
 */

public class MemberServiceImpl implements IMemberService{

	private IMemberDao dao;
	private static IMemberService service;
	
	private MemberServiceImpl() {
		dao = MemberDaoImpl.getInstance();
	}
	
	public static IMemberService getInstance(){
		if(service == null)	service = new MemberServiceImpl(); 
		
		return service;
		
	}
	
	
	@Override
	public String checkById(String id) {
		
		return dao.checkById(id);
	}

	@Override
	public List<ZipVO> selectByDong(String dong) {
		
		return dao.selectByDong(dong);
	}

	@Override
	public String insertMember(MemberVO vo) {
		
		return dao.insertMember(vo);
	}
 
}
