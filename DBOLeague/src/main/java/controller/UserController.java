package controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import dto.MemberDTO;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import service.UserService;


@Controller
public class UserController {
	 @Autowired
	 UserService service;
	
	@RequestMapping("/login")
	public ModelAndView signIn() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("signIn");
		return mv;
	}
	
	//회원가입
	@GetMapping("/join")
	public String signUp() {
		return "signUp";
	}
	
	@PostMapping("/join")
	@ResponseBody
	public String signUp(@ModelAttribute("member") MemberDTO member) {
		service.signUp(member);
		
		return "redirect:/login";
	}
	
	//로그인
	//@GetMapping("/login")
	//public String signIn() {
		//return "signIn";
	//}
	
	//@PostMapping("/login")
	//public String userSignIn(@ModelAttribute MemberDTO dto, HttpServletResponse response,
	//HttpServletRequest request, Model model) {
		//response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
		//response.setHeader("Pragma", "no-cache");
		//response.setDateHeader("Expires", 0);

		//HttpSession session = request.getSession(false);
		//if (session == null || session.getAttribute("userlogin") == null) {
			//MemberDTO mdto = service.login(dto);
			//if (dto != null) {
				//session = request.getSession();
				//session.setAttribute("userlogin", mdto);
				//return "redirect:/main";
			//} else {
				//model.addAttribute("loginfail", "아이디 또는 비밀번호가 맞지 않습니다.");
				//return "login";
			//}
		//} else {
			//return "redirect:/main";
		//}
	//}
	
	// 로그아웃
		@RequestMapping("/logout")
		public String logout(HttpServletResponse response, HttpServletRequest request) {
			response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1.
			response.setHeader("Pragma", "no-cache"); // HTTP 1.0.
			response.setDateHeader("Expires", 0); // Proxies.

			HttpSession session = request.getSession(false);

			if (session != null) {
				session.invalidate();
			}

			return "signIn";
		}
	
}