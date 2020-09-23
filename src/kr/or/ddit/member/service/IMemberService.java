package kr.or.ddit.member.service;

import java.util.List;

import kr.or.ddit.member.vo.MemberVO;
import kr.or.ddit.member.vo.ZipVO;

public interface IMemberService {
	
	//아이디 중복검사
	// SELECT mem_id FROM member WHERE mem_id = #mem_id#
	// <select id=""	parameterClass="" resultClass="">
	public String checkById(String id);
	
	//우편번호 찾기
	// SELECT * FROM ziptb WHERE dong LIKE '%#dong#%'
	
	public List<ZipVO> selectByDong(String dong);
	
	
	//가입하기
	// <insert id="" parameterClass="">
	public String insertMember(MemberVO vo);
	
}
