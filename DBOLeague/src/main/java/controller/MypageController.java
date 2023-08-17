package controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import dto.InningsDTO;
import dto.MemberDTO;
import jakarta.servlet.http.HttpSession;
import service.MypageService;

@Controller
public class MypageController {
	
	@Autowired
	@Qualifier("mypageServiceImpl")
	MypageService service;
	
	@RequestMapping("/updateNick")
	@ResponseBody
	public void updateNick(String member_nick) {
		
	}
	
	@RequestMapping("/updatePw")
	@ResponseBody
	public void updatePw(String member_nick) {
		
	}
	
	@RequestMapping("/deleteMember")
	@ResponseBody
	public void deleteMember(String member_nick) {
		
	}
	
	@RequestMapping("/mypage")
	public ModelAndView mypage(HttpSession session) {
		ModelAndView mv = new ModelAndView();
		// 만약 로그인한 회원이 아닌 경우 메인으로 redirect
//		if (session.getAttribute("memberDto") == null) {
//			mv.setViewName("redirect:/maintest");
//			return mv;
//		}
		//MemberDTO dto = (MemberDTO) session.getAttribute("memberDto");
		//List<HashMap<String, Object>> recordList = service.getMemberLatestResults(dto.getMember_id());
		
		// 테스트용 회원 더미 데이터
		MemberDTO dummyDto = new MemberDTO();
		dummyDto.setMember_id("aaa");
		dummyDto.setMember_nick("AAA");
		dummyDto.setMember_email("aaa@gmail.com");
		dummyDto.setMember_team("자바 스크립터즈");
		dummyDto.setMember_allexp(13000);
		dummyDto.setMember_total(11);
		dummyDto.setMember_win(3);
		double win_rate = (double) dummyDto.getMember_win() / dummyDto.getMember_total() * 100;
		
		Map<String, Object> serviceResult = service.getLatestRecords(dummyDto.getMember_id());
		List<List<String>> singleRecords = (List<List<String>>) serviceResult.get("singleRecords");
		List<ArrayList<InningsDTO>> singleDetails = (List<ArrayList<InningsDTO>>) serviceResult.get("singleDetails");
		
		// 뷰에 뿌려줄 데이터
		mv.addObject("memberDto", dummyDto); // 회원 DTO
		mv.addObject("win_rate", Math.round(win_rate * 10) / 10.0); // 회원 DTO
		mv.addObject("singleRecords", singleRecords); // 회원 최근 전적
		mv.addObject("singleDetails", singleDetails); // 회원 최근 전적 상세
		mv.setViewName("mypage");
		
		return mv;
	}
	
	
}