package com.example.demo.controller;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class CalendarController {
	
	@GetMapping("/cal")
	public String cal(
			@RequestParam(name="year", required=false) Integer year,
			@RequestParam(name="month", required=false) Integer month,
			Model model
		) {
		LocalDate now = LocalDate.now();
		
		year = year != null ? year : now.getYear();
		month = month != null ? month : now.getMonthValue();
		
		LocalDate date = LocalDate.of(year, month, 1);
		System.out.println(date);
		
		int max = date.lengthOfMonth();
		System.out.println(max);
		
		//曜日を取得
		int week = date.getDayOfWeek().getValue();
		System.out.println(week);
		
		List<String> list = new ArrayList<>();
		
		list.add("2023-06-02");
		list.add("2023-06-13");
		list.add("2023-06-14");
		list.add("2023-06-15");
		list.add("2023-06-16");
		
		model.addAttribute("date", date);
		model.addAttribute("max", max);
		model.addAttribute("week", week == 7 ? 0 : week);
		model.addAttribute("list", list);
		model.addAttribute("year", year);
		model.addAttribute("month", month.toString().length() == 1 ? "0" + month : month);
		
		model.addAttribute("lastYear", month - 1 < 1 ? year - 1 : year);
		model.addAttribute("lastMonth", month - 1 < 1 ? 12 : month - 1);
		model.addAttribute("nextYear", month + 1 > 12 ? year + 1 : year);
		model.addAttribute("nextMonth", month + 1 > 12 ? 1 : month + 1);
		
		return "cal";
	}


}
