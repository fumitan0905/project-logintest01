package com.example.demo.controller;

import java.time.LocalDate;
import java.time.LocalTime;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.demo.entity.Cook;
import com.example.demo.entity.Health;
import com.example.demo.entity.Player;
import com.example.demo.repository.CookRepository;
import com.example.demo.repository.HealthRepository;
import com.example.demo.repository.PlayerRepository;

@Controller
@SpringBootApplication
public class HealthController {

	@Autowired
	HealthRepository healthRepository;

	@Autowired
	PlayerRepository playerRepository;

	@Autowired
	CookRepository cookRepository;

	@GetMapping("/health")
	public String index(
			@RequestParam(value = "year", required = false) Integer year,
			@RequestParam(value = "month", required = false) Integer month,
			@RequestParam(value = "day", required = false) Integer day,
			Model m) {

		List<Player> playerList = playerRepository.findByOrderById();
		m.addAttribute("playerList", playerList);

		LocalDate now = LocalDate.now();

		year = year != null ? year : now.getYear();
		month = month != null ? month : now.getMonthValue();
		day = day != null ? day : now.getDayOfMonth();

		LocalDate date = LocalDate.of(year, month, 1);
		System.out.println(date);

		int max = date.lengthOfMonth();
		System.out.println(max);

		int week = date.getDayOfWeek().getValue();
		System.out.println(week);

		m.addAttribute("date", date);
		m.addAttribute("max", max);
		m.addAttribute("week", week == 7 ? 0 : week);
		m.addAttribute("year", year);
		m.addAttribute("month", month.toString().length() == 1 ? "0" + month : month);

		m.addAttribute("lastYear", month - 1 < 1 ? year - 1 : year);
		m.addAttribute("lastMonth", month - 1 < 1 ? 12 : month - 1);
		m.addAttribute("nextYear", month + 1 > 12 ? year + 1 : year);
		m.addAttribute("nextMonth", month + 1 > 12 ? 1 : month + 1);

		return "health";
	}

	@PostMapping("/health")
	public String add(
			Model m,
			@RequestParam(value = "playerHealthId", defaultValue = "") Integer playerHealthId,
			@RequestParam(value = "eatDate", defaultValue = "") LocalDate eatDate,
			@RequestParam(value = "wakeupTime", defaultValue = "") LocalTime wakeupTime,
			@RequestParam(value = "bedtimeTime", defaultValue = "") LocalTime bedtimeTime,
			@RequestParam(value = "breakfastId", defaultValue = "") Integer breakfastId,
			@RequestParam(value = "lunchId", defaultValue = "") Integer lunchId,
			@RequestParam(value = "dinnerId", defaultValue = "") Integer dinnerId) {

		List<Health> a = healthRepository.findAll();
		System.out.println(a);
		if (playerHealthId == null) {
			return "redirect:/health/information?year=" + eatDate.getYear() + "&month=" + eatDate.getMonthValue()
					+ "&day=" + eatDate.getDayOfMonth() + "&error=1";
		}

		if (playerHealthId <= 0) {
			return "redirect:/admin/health/information?year=" + eatDate.getYear() + "&month=" + eatDate.getMonthValue()
					+ "&day=" + eatDate.getDayOfMonth() + "&error=3";

		}
		
		Optional<Player> b = playerRepository.findById(playerHealthId);
		
		if (b.isEmpty() == true) {
			return "redirect:/admin/health/information?year=" + eatDate.getYear() + "&month=" + eatDate.getMonthValue()
					+ "&day=" + eatDate.getDayOfMonth() + "&error=4";
		}
		
//		if (playerHealthId >= a.size() || playerHealthId <= 0) {
//			return "redirect:/health/information?year=" + eatDate.getYear() + "&month=" + eatDate.getMonthValue()
//					+ "&day=" + eatDate.getDayOfMonth() + "&error=3";
//
//		}

		Optional<Health> search = healthRepository.findByEatDateAndPlayerHealthId(eatDate, playerHealthId);
		if (search.isEmpty() == false) {
			return "redirect:/health/information?year=" + eatDate.getYear() + "&month=" + eatDate.getMonthValue()
					+ "&day=" + eatDate.getDayOfMonth() + "&error=2";// + "IDを入力してください";

		}
		Health health = new Health(playerHealthId, wakeupTime, bedtimeTime, breakfastId, lunchId, dinnerId,
				eatDate);
		healthRepository.save(health);
		m.addAttribute("playerHealthId", playerHealthId);

		return "redirect:/health/information?year=" + eatDate.getYear() + "&month=" + eatDate.getMonthValue()
				+ "&day=" + eatDate.getDayOfMonth();

	}

	@GetMapping("/health/information")
	public String information(
			@RequestParam(value = "year", required = false) Integer year,
			@RequestParam(value = "month", required = false) Integer month,
			@RequestParam(value = "day", required = false) Integer day,
			@RequestParam(value = "error", required = false) Integer error,
			Model m) {

		List<Player> playerList = playerRepository.findByOrderById();
		m.addAttribute("playerList", playerList);

		List<Cook> cookList = cookRepository.findAll();
		m.addAttribute("cookList", cookList);

		if (year != null && month != null && day != null) {

			LocalDate search = LocalDate.of(year, month, day);
			List<Health> finds = healthRepository.findByEatDateOrderByIdAsc(search);

			for (Health h : finds) {
				for (Cook cook : cookList) {
					if (h.getBreakfastId() == cook.getId()) {
						h.setBreakfastCalory(cook.getDishCalories());
						h.setBreakfastName(cook.getDishName());

					}
					if (h.getLunchId() == cook.getId()) {
						h.setLunchCalory(cook.getDishCalories());
						h.setLunchName(cook.getDishName());

					}
					if (h.getDinnerId() == cook.getId()) {
						h.setDinnerCalory(cook.getDishCalories());
						h.setDinnerName(cook.getDishName());

					}
				}

			}

			LocalDate now = LocalDate.now();
			year = year != null ? year : now.getYear();
			month = month != null ? month : now.getMonthValue();
			day = day != null ? day : now.getDayOfMonth();

			m.addAttribute("finds", finds);
			m.addAttribute("year", year);
			m.addAttribute("month", month);
			m.addAttribute("day", day);
		
			LocalDate date = LocalDate.of(year, month, day);
			LocalDate yesterday = date.minusDays(1);
			LocalDate tomorrow = date.plusDays(1);

		
		m.addAttribute("lastYear", yesterday.getYear());
		m.addAttribute("lastMonth", yesterday.getMonthValue());
		m.addAttribute("lastDay", yesterday.getDayOfMonth());
		
		m.addAttribute("nextYear", tomorrow.getYear());
		m.addAttribute("nextMonth", tomorrow.getMonthValue());
		m.addAttribute("nextDay", tomorrow.getDayOfMonth());


		if (error != null) {
			String msg = "";

			switch (error) {
			case 1:
				msg = "IDを入力してください";
				break;
			case 2:
				msg = "同じ日付に同じIDは入力できません";
				break;
			case 3:
				msg = "IDが見つかりません";
				break;
			case 4:
				msg = "IDが見つかりません";
				break;
			}
			m.addAttribute("error", msg);
		}
		m.addAttribute("search", search);
	}
		return "healthDate";
	}

	@GetMapping("/health/{id}/edit")
	public String detail(
			@PathVariable("id") Integer id,
			Model m) {
		if (id == null) {
			return "health";
		} else if (id != null) {

			Player player = playerRepository.findById(id).get();
			m.addAttribute("player", player);
		}
		return "healthDetail";
	}

	@PostMapping("/health/{id}/edit")
	public String update(
			@PathVariable("id") Integer id,
			@RequestParam(value = "playerId", defaultValue = "") Integer playerId,
			@RequestParam(value = "name", defaultValue = "") String name,
			@RequestParam(value = "height", defaultValue = "") Integer height,
			@RequestParam(value = "weight", defaultValue = "") Integer weight,
			@RequestParam(value = "age", defaultValue = "") Integer age,
			@RequestParam(value = "birthplace", defaultValue = "") String birthplace,
			@RequestParam(value = "position", defaultValue = "") String position,
			@RequestParam(value = "bodyFatPer", defaultValue = "") Integer bodyFatPer,
			Model m) {
		Player player = new Player(id, playerId, name, height, weight, age, position, birthplace, bodyFatPer);
		playerRepository.save(player);
		return "redirect:/health";
	}

	@PostMapping("/health/{playerHealthId}/delete")
	public String delete(
			@PathVariable("playerHealthId") Integer playerHealthId,
			@RequestParam(value = "eatDate", defaultValue = "") LocalDate eatDate) {

		Health a = healthRepository.findByPlayerHealthIdAndEatDate(playerHealthId, eatDate).get();
		healthRepository.delete(a);
		return "redirect:/health/information?year=" + eatDate.getYear() + "&month=" + eatDate.getMonthValue()
				+ "&day=" + eatDate.getDayOfMonth();
	}

	@GetMapping("/health/{id}/detail")
	public String details(
			@PathVariable("id") Integer playerHealthId,
			@PathVariable("id") Integer id,			
			Model m) {
		if (playerHealthId == null) {
			return "health";
		} else if (playerHealthId != null) {

			Optional<Player> playerList = playerRepository.findById(id);
			m.addAttribute("playerList", playerList);
			List<Cook> cookList = cookRepository.findAll();
			m.addAttribute("cookList", cookList);
			List<Health> finds = healthRepository.findByPlayerHealthId(playerHealthId);
			for (Health h : finds) {
				for (Cook cook : cookList) {
					if (h.getBreakfastId() == cook.getId()) {
						h.setBreakfastCalory(cook.getDishCalories());
						h.setBreakfastName(cook.getDishName());

					}
					if (h.getLunchId() == cook.getId()) {
						h.setLunchCalory(cook.getDishCalories());
						h.setLunchName(cook.getDishName());

					}
					if (h.getDinnerId() == cook.getId()) {
						h.setDinnerCalory(cook.getDishCalories());
						h.setDinnerName(cook.getDishName());

					}
				}

			}

			Player player = playerRepository.findById(id).get();
			m.addAttribute("player", player);
			m.addAttribute("finds", finds);
		}
		return "playerHealthDetail";
	}

}
