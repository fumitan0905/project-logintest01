package com.example.demo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.demo.entity.Performance;
import com.example.demo.entity.Player;
import com.example.demo.repository.PerformanceRepository;
import com.example.demo.repository.PlayerRepository;

@Controller
public class PerformanceController {
	@Autowired
	PlayerRepository playerRepository;

	@Autowired
	PerformanceRepository performanceRepository;

	@GetMapping("/performance")
	public String index(
			@RequestParam(name="sort", required=false)Integer sort,
			Model m) {
		if (sort == null|| sort == 0) {
			List<Player> playerList = playerRepository.findByOrderById();
			List<Performance> playerPerformance = performanceRepository.findByOrderByIdAsc();
			m.addAttribute("playerPerformance", playerPerformance);
			m.addAttribute("playerList", playerList);
		}else if (sort == 1) {
			List<Player> playerList = playerRepository.findByOrderById();
			List<Performance> playerPerformance = performanceRepository.findByOrderByGoalsDesc();
			m.addAttribute("playerPerformance", playerPerformance);
			m.addAttribute("playerList", playerList);
		}else if (sort==2) {
			List<Player> playerList = playerRepository.findByOrderById();
			List<Performance> playerPerformance = performanceRepository.findByOrderByAsistsDesc();
			m.addAttribute("playerPerformance", playerPerformance);
			m.addAttribute("playerList", playerList);
		}else if (sort==3) {
			List<Player> playerList = playerRepository.findByOrderById();
			List<Performance> playerPerformance = performanceRepository.findByOrderByFoulDesc();
			m.addAttribute("playerPerformance", playerPerformance);
			m.addAttribute("playerList", playerList);
		}else if (sort==4) {
			List<Player> playerList = playerRepository.findByOrderById();
			List<Performance> playerPerformance = performanceRepository.findByOrderByFouledDesc();
			m.addAttribute("playerPerformance", playerPerformance);
			m.addAttribute("playerList", playerList);
		}else if (sort==5) {
			List<Player> playerList = playerRepository.findByOrderById();
			List<Performance> playerPerformance = performanceRepository.findByOrderByYellowcardDesc();
			m.addAttribute("playerPerformance", playerPerformance);
			m.addAttribute("playerList", playerList);
		}else if (sort==6) {
			List<Player> playerList = playerRepository.findByOrderById();
			List<Performance> playerPerformance = performanceRepository.findByOrderByRedcardDesc();
			m.addAttribute("playerPerformance", playerPerformance);
			m.addAttribute("playerList", playerList);
		}else if (sort==7) {
			List<Player> playerList = playerRepository.findByOrderById();
			List<Performance> playerPerformance = performanceRepository.findByOrderByGamesDesc();
			m.addAttribute("playerPerformance", playerPerformance);
			m.addAttribute("playerList", playerList);
		}
//		List<Player> playerList = playerRepository.findByOrderById();
//		List<Performance> playerPerformance = performanceRepository.findByOrderByIdAsc();
//		m.addAttribute("playerPerformance", playerPerformance);
//		m.addAttribute("playerList", playerList);
		return "performance";
	}

	@GetMapping("/performance/{id}/edit")
	public String edit(
			@PathVariable("id") Integer id,
			Model m) {
		if (id == null) {
			return "performance";
		} else if (id != null) {
			Performance playerPerformance = performanceRepository.findById(id).get();
			Player player = playerRepository.findById(id).get();
			m.addAttribute("player", player);
			m.addAttribute("pp", playerPerformance);
		}
		return "performanceDetail";

	}

	@PostMapping("/performance/{playerId}/edit")
	public String update(
			@PathVariable("playerId") Integer playerId,
			@RequestParam(value = "goals", defaultValue = "") Integer goals,
			@RequestParam(value = "asists", defaultValue = "") Integer asists,
			@RequestParam(value = "foul", defaultValue = "") Integer foul,
			@RequestParam(value = "fouled", defaultValue = "") Integer fouled,
			@RequestParam(value = "yellowcard", defaultValue = "") Integer yellowcard,
			@RequestParam(value = "redcard", defaultValue = "") Integer redcard,
			@RequestParam(value = "games", defaultValue = "") Integer games,
			Model m) {
		Performance performance = performanceRepository.findByPlayerId(playerId).get();
		
		performance.setGoals(goals);
		performance.setAsists(asists);
		performance.setFoul(foul);
		performance.setFouled(fouled);
		performance.setYellowcard(yellowcard);
		performance.setRedcard(redcard);
		performance.setGames(games);
//		Performance performance = new Performance(id, goals, asists, foul, fouled, yellowcard, redcard, games,
//				playerId);
		performanceRepository.save(performance);
		return "redirect:/performance";
	}

	
	@PostMapping("/performance/{id}/reset")
	public String reset(
			@PathVariable("id") Integer id,
			@RequestParam(value = "playerId", defaultValue = "") Integer playerId,
			Model m
			) {
	if (id == null) {
		return "performance";
	} else if (id != null) {
		playerId = id;
		Performance performance = new Performance(id, 0, 0, 0, 0, 0, 0, 0, playerId);
		performanceRepository.save(performance);
		
	}
	return "redirect:/performance";

}
	@GetMapping("/performance/add")
	public String addpage(
			Model m,
			@RequestParam(value = "error", defaultValue = "") Integer error
			) {
		if (error != null) {
			String msg = "";

			switch (error) {
			case 1:
				msg = "未入力項目があります";
				break;
				}
			m.addAttribute("error",msg);
		}
		return "addPlayer";
	}

	@PostMapping("/performance/add")
	public String create(
			@RequestParam(value = "playerId", defaultValue = "") Integer playerId,
			@RequestParam(value = "name", defaultValue = "") String name,
			@RequestParam(value = "height", defaultValue = "") Integer height,
			@RequestParam(value = "weight", defaultValue = "") Integer weight,
			@RequestParam(value = "age", defaultValue = "") Integer age,
			@RequestParam(value = "position", defaultValue = "") String position,
			@RequestParam(value = "birthplace", defaultValue = "") String birthplace,
			@RequestParam(value = "bodyFatPer", defaultValue = "") Integer bodyFatPer,
			@RequestParam(value = "goals", defaultValue = "") Integer goals,
			@RequestParam(value = "asists", defaultValue = "") Integer asists,
			@RequestParam(value = "foul", defaultValue = "") Integer foul,
			@RequestParam(value = "fouled", defaultValue = "") Integer fouled,
			@RequestParam(value = "yellowcard", defaultValue = "") Integer yellowcard,
			@RequestParam(value = "redcard", defaultValue = "") Integer redcard,
			@RequestParam(value = "games", defaultValue = "") Integer games,
			Model m) {
		
		if(playerId == null || name == null || height == null || weight == null ||
				age == null || position == null || birthplace == null || bodyFatPer == null ) {
			return "redirect:/performance/add?error=1";
			
		}
		Player player = new Player(playerId,name,height,weight,age,position,birthplace,bodyFatPer);
		playerRepository.save(player);
		Performance performance = new Performance(goals,asists,foul,fouled,yellowcard,redcard,games,player.getId());
		
		performanceRepository.save(performance);
		return "redirect:/performance";
	}


}
