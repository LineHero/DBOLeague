package dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import dto.ExpDTO;
import dto.MemberDTO;
import dto.SingleDTO;

@Repository
@Mapper
public interface MypageDAO {
	// 회원 정보 수정
	int updateMemberNick(MemberDTO dto); // 닉네임 변경
	int updateMemberPw(MemberDTO dto); // 비밀번호 변경
	int deleteMember(String member_id); // 회원탈퇴
	
	// 회원 최근 전적
	List<ExpDTO> selectMemberLatestExp(String member_id); // 회원의 최근 게임 플레이 날짜, 게임 id
	List<SingleDTO> selectMemberLatestSingleResult(HashMap<String, Object> map); // 회원의 최근 싱글 게임 결과, 도전 횟수
	
	// 
}
