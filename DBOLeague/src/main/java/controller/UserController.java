package controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import service.UserService;


@Controller
public class UserController {
	@Autowired
	UserService service;
	
	//회원가입
	@GetMapping("/signup")
	public String signUp() {
		return "signUp";
	}
	
	@PostMapping("/signup")
	public String userSignUp() {
		return "signIn";
	}
	
	//로그인
	@GetMapping()
	public String signIn() {
		return "signIn";
	}
	
	@PostMapping()
	public String userSignIn() {
		return "signIn";
	}
	
	//비밀번호 찾기
	
}