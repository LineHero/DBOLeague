package controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import service.UserService;


@Controller
public class GameController {
	/*
	 * @Autowired UserService service;
	 */
	
	//게임페이지
	@GetMapping("/game")
	public String game() {
		return "game";
	}

	
}