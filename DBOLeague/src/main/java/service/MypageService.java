package service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import dto.InningsDTO;
import dto.MemberDTO;

public interface MypageService {
	// 회원 정보 수정
	int updateMemberNick(MemberDTO dto); 
	int updateMemberPw(MemberDTO dto);
	String selectMemberCurPw(MemberDTO dto);
	int deleteMember(String member_id);
	
	// 회원 최근 전적
	Map<String, Object> getLatestRecords(String member_id, int detailIdx);
	
}
