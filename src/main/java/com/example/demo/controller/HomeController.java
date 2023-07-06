package com.example.demo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomeController {
	@GetMapping("/home")
	public String homepage(
			Model model) {
		return "home";
	}
	
	@GetMapping("/fclogin")
	public String fcLogin(
			Model model) {
		return "fcLogin";
	}
	
}
