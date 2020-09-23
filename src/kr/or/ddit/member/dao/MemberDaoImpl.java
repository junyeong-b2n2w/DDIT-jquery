package kr.or.ddit.member.dao;

import java.sql.SQLException;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.ibatis.config.BuildSqlMapClient;
import kr.or.ddit.member.vo.MemberVO;
import kr.or.ddit.member.vo.ZipVO;

/*
 * Mapper의 sql문을 실행하기 위해서 SqlMapClient 객체를 얻어온다.
 * dao객체를 service에서 사용할 수 있도록 자신의 객체를 생성 하고 리턴한다. 
 * 
 */


public class MemberDaoImpl implements IMemberDao{

	private SqlMapClient client;
	private static IMemberDao dao;// MemberDaoImpl형으로 선언해도 되지만 IMemberDao 형으로 만드는 이유는 표준화를 위해서이다. 
	
	private MemberDaoImpl() {
		client = BuildSqlMapClient.getSqlMapClient();
		
	}
	//싱글톤을위한 생성자 만들기
	public static IMemberDao getInstance(){
		if(dao == null)	dao = new MemberDaoImpl(); 
		
		return dao;
		
	}
	
	@Override
	public String checkById(String id) {
		String chkId = null;
		
		try {
			chkId = (String) client.queryForObject("join.checkById",id);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return chkId;
	}

	@Override
	public List<ZipVO> selectByDong(String dong) {
		List<ZipVO> list = null;
		
		try {
			list = client.queryForList("join.selectByDong", dong);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public String insertMember(MemberVO vo) {
		String resId = null;
		
		try {
			resId = (String) client.insert("join.insertMember" , vo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return resId;
	}

}
