package service;

import java.util.List;
import java.util.Map;

import dto.MemberDTO;

public interface MypageService {
	// 회원 정보 수정
	int updateMemberNick(MemberDTO dto); 
	int updateMemberPw(MemberDTO dto);
	int deleteMember(String member_id);
	
	// 회원 최근 전적
	List<Map<String, Object>> getMemberLatestResult(String member_id);
}
