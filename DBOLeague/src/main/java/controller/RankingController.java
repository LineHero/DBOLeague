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
import org.springframework.web.servlet.ModelAndView;

import dto.RankingDTO;
import service.RankingService;

@Controller
public class RankingController {

	@Autowired
	@Qualifier("rankingServiceImpl")
	RankingService service;

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

	@RequestMapping("/ranking")
	public ModelAndView Ranking(
			@RequestParam(value = "year", required = false) Integer year,
			@RequestParam(value = "month", required = false) Integer month,
			@RequestParam(value = "day", required = false) Integer day) {
		
		if (year == null) {
			year = LocalDate.now().getYear();
		}
		if (month == null) {
			month = LocalDate.now().getMonthValue();
		}
		if (day == null) {
			day = LocalDate.now().getDayOfMonth();
		}
		ModelAndView mv = new ModelAndView();
		HashMap<String, String> map = ISOWeekInfoWithRange(LocalDate.of(year, month, day));
		List<RankingDTO> list = service.getWeekelyRanking(map);
		mv.addObject("year", Integer.parseInt(map.get("year")));
		mv.addObject("week", Integer.parseInt(map.get("week")));
		mv.addObject("firstDayOfWeek", map.get("firstDayOfWeek"));
		mv.addObject("lastDayOfWeek", map.get("lastDayOfWeek"));
		mv.addObject("ranklist", list);
		mv.setViewName("ranking");
		return mv;
	}

}