package controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import dto.MemberDTO;
import jakarta.servlet.http.HttpSession;
import service.MypageService;

@Controller
public class MypageController {
	
	@Autowired
	@Qualifier("mypageServiceImpl")
	MypageService service;
	
	@RequestMapping("/mypage")
	public ModelAndView mypage(HttpSession session) {
		ModelAndView mv = new ModelAndView();
		// 만약 로그인한 회원이 아닌 경우 메인으로 redirect
//		if (session.getAttribute("") == null) {
//			mv.setViewName("redirect:/");
//			return mv;
//		}
		//MemberDTO dto = (MemberDTO) session.getAttribute("");
		//String member_id = dto.getMember_id();
		//
		// 뷰에 뿌려줄 데이터
		//mv.addObject("member_id", member_id); // 회원 아이디
		//mv.addObject("member_nick", dto.getMember_nick()); // 회원 닉네임
		//mv.addObject("member_email", dto.getMember_email()); // 회원 이메일
		//mv.addObject("member_team", dto.getMember_team()); // 회원 소속팀
		//mv.addObject("member_allexp", dto.getMember_allexp()); // 회원 총 경험치
		//mv.addObject("member_total", dto.getMember_total()); // 회원 총 플레이한 게임 수
		//mv.addObject("member_win", dto.getMember_win()); // 회원 성공 횟수
		mv.setViewName("mypage");
		return mv;
	}
	
	
}
