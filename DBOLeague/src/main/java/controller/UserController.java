package controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import service.UserService;


@Controller
public class UserController {
	/*
	 * @Autowired UserService service;
	 */
	
	@RequestMapping("/join")
	public ModelAndView signUp() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("signUp");
		return mv;
	}
	
	@RequestMapping("/login")
	public ModelAndView signIn() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("signIn");
		return mv;
	}
	
	//회원가입
	//@GetMapping("/signup")
	//public String signUp() {
		//return "signUp";
	//}
	
	//@PostMapping("/signup")
	//public String userSignUp() {
		//return "signIn";
	//}
	
	//로그인
	//@GetMapping()
	//public String signIn() {
		//return "signIn";
	//}
	
	//@PostMapping()
	//public String userSignIn() {
		//return "signIn";
	//}
	
	//비밀번호 찾기
	
}