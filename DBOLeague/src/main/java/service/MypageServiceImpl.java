package service;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import dao.MypageDAO;
import dto.ExpDTO;
import dto.MemberDTO;
import dto.SingleDTO;

@Service	
public class MypageServiceImpl implements MypageService{
	
	@Autowired
	@Qualifier("mypageDAO")
	MypageDAO dao;
	
	// 닉네임 변경
	@Override
	public int updateMemberNick(MemberDTO dto) {
		return dao.updateMemberNick(dto);
	}

	// 비밀번호 변경
	@Override
	public int updateMemberPw(MemberDTO dto) {
		return dao.updateMemberPw(dto);
	}
	
	// 회원탈퇴
	@Override
	public int deleteMember(String member_id) {
		return dao.deleteMember(member_id);
	}
	
	// 회원 최근 전적(싱글 게임)
	@Override
	public HashMap<String, Object> getMemberLatestResult(String member_id) {
		HashMap<String, Object> map = new HashMap<>();
		List<ExpDTO> expDtos = dao.selectMemberLatestExp(member_id);
		ArrayList<String> single_ids = new ArrayList<>();
		ArrayList<Timestamp> exp_dates = new ArrayList<>();
		for (ExpDTO dto : expDtos) {
			single_ids.add(dto.getSingle_id());
			exp_dates.add(dto.getExp_date());
			
		}
		map.put("single_ids", single_ids);
		List<SingleDTO> singleDtos = dao.selectMemberLatestSingleResult(map);
		HashMap<String, Object> result = new HashMap<>();
		result.put("exp_dates", exp_dates);
		result.put("singleDtos", singleDtos);
		return result;
	}
	
	
}
