package service;

import java.util.HashMap;

import dto.MemberDTO;

public interface MypageService {
	// 회원 정보 수정
	int updateMemberNick(MemberDTO dto); 
	int updateMemberPw(MemberDTO dto);
	int deleteMember(String member_id);
	
	// 회원 최근 전적
	HashMap<String, Object> getMemberLatestResult(String member_id);
}
