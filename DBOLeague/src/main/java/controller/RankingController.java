package controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import service.RankingService;

@Controller
public class RankingController {
	
	@Autowired
	@Qualifier("rankingServiceImpl")
	RankingService service;
	
	@RequestMapping("/ranking")
	public ModelAndView Ranking() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("ranking");
		return mv;
	}
	
}