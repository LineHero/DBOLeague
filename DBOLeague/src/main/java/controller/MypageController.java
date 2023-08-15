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
//		if (session.getAttribute("memberDto") == null) {
//			mv.setViewName("redirect:/maintest");
//			return mv;
//		}
		//MemberDTO dto = (MemberDTO) session.getAttribute("memberDto");
		//List<HashMap<String, Object>> recordList = service.getMemberLatestResult(dto.getMember_id());
		// 뷰에 뿌려줄 데이터
		//mv.addObject("memberDto", memberDto); // 회원 DTO
		//mv.addObject("recordList", recordList); // 최근 전적 리스트
		mv.setViewName("mypage");
		return mv;
	}
	
	
}