package controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import dto.InningsDTO;
import dto.SingleDTO;
import service.GameServiceImpl;
import service.MypageService;
import service.UserService;


@Controller
public class GameController {
	@Autowired
	@Qualifier("gameServiceImpl")
	GameServiceImpl service;
	
	//게임페이지
	@GetMapping("/game")
	public ModelAndView game() {
		SingleDTO dto = new SingleDTO();
		dto.setMember_id("aaa");
		int single_id = service.insertSingle(dto);
		ModelAndView mv = new ModelAndView();
		mv.addObject("single_id",single_id);
		mv.setViewName("game");
		return mv;
	}
	
	@RequestMapping("/ajaxResult")
	@ResponseBody
	public String ajaxResult(int single_all, int single_result, int single_id) {
		boolean result = true;
		if(single_result == 0) {
			result = false;
		}
		SingleDTO dto = new SingleDTO();
		dto.setSingle_all(single_all);
		dto.setSingle_id(single_id);
		dto.setSingle_result(result);
		service.updateSingle(dto);
		return "success";
	}
	
	@RequestMapping("/score")
	@ResponseBody
	public String score(int  strikes, int  balls, int single_id, int innings_count) {
		InningsDTO dto = new InningsDTO();
		dto.setInnings_ball(balls);
		dto.setInnings_strike(strikes);
		dto.setInnings_count(innings_count);
		dto.setSingle_id(single_id);
		service.insertInnings(dto);
		return "success";
	}
	
}