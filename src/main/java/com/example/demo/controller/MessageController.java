package com.example.demo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.demo.entity.Comment;
import com.example.demo.repository.CommentRepository;
import com.example.demo.security.LoginUserDetails;

@Controller
public class MessageController {
	
	@Autowired
	CommentRepository commentRepository;

	@GetMapping("/message")
	public String comment(
			Model model) {
		return "message";
	}

	@PostMapping("/message")
	public String upload(
			@RequestParam(name="title",required = false) String title,
			@RequestParam(name="content",required = false) String content,
			Model model) {
		
SecurityContext securityContext = SecurityContextHolder.getContext();
Authentication authentication = securityContext.getAuthentication();
Object principal = authentication.getPrincipal();
String mail = ((LoginUserDetails)principal).getUsername();


//if(principal instanceof LoginUserDetails) {
//	String name = ((LoginUserDetails)principal).getUsername();
//}else {
//	String name = principal.toString();
//}
		Comment comment = new Comment(title, mail, content);
		
		commentRepository.save(comment);
		

		return "message";
	}

	@GetMapping("/message/archive")
	public String archive(Model model
			)
	{
		List<Comment> commentList = null;
		commentList = commentRepository.findAll();
		model.addAttribute("comments",commentList);
		return "archive";
	}


}
