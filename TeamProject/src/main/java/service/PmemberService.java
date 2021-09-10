package service;

import java.util.List;

import criTest.SearchCriteria;
import vo.PmemberVO;

public interface PmemberService {

	
	int passCheck(PmemberVO vo);
	
	
	
	// ID 중복확인
	// public String idCheck(String id);
	
	// ** ID 찾기
	PmemberVO pFindId(PmemberVO vo);
	// ** Password 찾기
	PmemberVO pFindPw(PmemberVO vo);
	
	// **SearchPageList
	public int searchRowsCount(SearchCriteria cri);
	public List<PmemberVO> searchList(SearchCriteria cri);
		
		
	List<PmemberVO> selectList(); 
	PmemberVO selectOne(PmemberVO vo);
	int insert(PmemberVO vo);
	int update(PmemberVO vo);
	int delete(PmemberVO vo);
	

	
	

} //PmemberService