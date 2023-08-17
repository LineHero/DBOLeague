package service;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import dao.MypageDAO;
import dto.ExpDTO;
import dto.InningsDTO;
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
	public Map<String, Object> getLatestRecords(String member_id) {
		// 회원의 최근 5게임 single_id, exp_date를 exp 테이블에서 가져옴
		List<ExpDTO> expDtos = dao.selectLatestExps(member_id);
		
		// 가져온 결과를 각각 single_ids, exp_dates 리스트에 저장
		List<Integer> single_ids = new ArrayList<>();
		List<Timestamp> exp_dates = new ArrayList<>();
		for (ExpDTO dto : expDtos) {
			single_ids.add(dto.getSingle_id());
			exp_dates.add(dto.getExp_date());
		}
		
		// 회원의 최근 5게임 single_all, single_result를 single 테이블에서 가져옴
		HashMap<String, Object> map = new HashMap<>();
		map.put("single_ids", single_ids);
		map.put("member_id", member_id);
		List<SingleDTO> singleDtos = dao.selectLatestSingleRecords(map);
		
		// 회원의 최근 5게임 innings_count, innings_strike, innings_ball 가져옴
		List<ArrayList<InningsDTO>> inningsDtos = new ArrayList<>();
		for (Integer single_id : single_ids) {
			ArrayList<InningsDTO> temp = dao.selectLatestInnings(single_id);
			inningsDtos.add(temp);
		}
		
		// 
		Map<String, Object> serviceResult = new HashMap<>();
		List<List<String>> singleRecords = new ArrayList<>();
		for (int i = 0; i < singleDtos.size(); i++) {
			List<String> temp = new ArrayList<>();
			// exp_date는 날짜만 보여줄 거면 여기에서 자르면 됨
			temp.add(String.valueOf(singleDtos.get(i).isSingle_result()));
			temp.add(String.valueOf(singleDtos.get(i).getSingle_all()));
			temp.add(String.valueOf(exp_dates.get(i)));
			singleRecords.add(temp);
		}
		serviceResult.put("singleRecords", singleRecords);
		serviceResult.put("singleDetails", inningsDtos);
		
		return serviceResult;
	}
	
	
}
