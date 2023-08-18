package controller;

import java.time.DayOfWeek;
import java.time.LocalDate;
import java.time.temporal.IsoFields;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import dto.MemberDTO;
import dto.RankingDTO;
import jakarta.servlet.http.HttpServletResponse;
import service.RankingService;

@Controller
public class MyItemShopController {

	@Autowired
	@Qualifier("rankingServiceImpl")
	RankingService service;

	//날짜 매개변수로 연도, 주차, 주차의 시작일과 마지막일 hashmap으로 반환
	public HashMap<String, String> ISOWeekInfoWithRange(LocalDate localDate) {

	        LocalDate currentDate = localDate; // 예시 날짜

	        int year = currentDate.get(IsoFields.WEEK_BASED_YEAR);
	        int week = currentDate.get(IsoFields.WEEK_OF_WEEK_BASED_YEAR);

	        LocalDate firstDayOfWeek = currentDate.with(DayOfWeek.MONDAY);
	        LocalDate lastDayOfWeek = currentDate.with(DayOfWeek.SUNDAY);
	        
	        HashMap<String, String> map = new HashMap<>();
	        map.put("firstDayOfWeek", firstDayOfWeek.toString());
	        map.put("lastDayOfWeek", lastDayOfWeek.toString());
	        map.put("year", Integer.toString(year));
	        map.put("week", Integer.toString(week));
	        
	        return map;
	}

	@RequestMapping("/myItemShop")
	public ModelAndView myItemShop(
			@SessionAttribute(name = "userlogin", required = false)MemberDTO dto,
			HttpServletResponse response) {
		response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1.
		response.setHeader("Pragma", "no-cache"); // HTTP 1.0.
		response.setDateHeader("Expires", 0); // Proxies.
		
		ModelAndView mv = new ModelAndView();
		
		if (dto != null) {
			mv.addObject("login", "true");
		} else {
			RedirectView rv = new RedirectView();
			rv.setUrl("/login");
			mv.setView(rv);
			return mv;
		}
		
		mv.setViewName("myItemShop");
		return mv;
	}

}