package controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;

import service.RankingService;

@Controller
public class AdminController {
	
	@Autowired
	@Qualifier("rankingServiceImpl")
	RankingService service;
	
}