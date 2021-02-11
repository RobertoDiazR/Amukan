package com.codingdojo.Amukan.controllers;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.codingdojo.Amukan.models.User;
import com.codingdojo.Amukan.services.UserService;

@Controller
public class AmukanController {
	private final UserService userService;
	public AmukanController(UserService userService) {
		this.userService = userService;
	}
	@RequestMapping("/contacto")
	public String contactoAmukan(Model model, HttpSession session) {
		if(session.getAttribute("userId") == null) {
			model.addAttribute("sessionON", false);
		}else {
			model.addAttribute("sessionON", true);
			Long userId = (Long) session.getAttribute("userId");
			User user = userService.findUserById(userId);
			model.addAttribute("user", user);			
		}
		return "/amukan/contacto.jsp";
	}
	
	@RequestMapping("/acerca-de")
	public String acercaDeAmukan(Model model, HttpSession session) {
		if(session.getAttribute("userId") == null) {
			model.addAttribute("sessionON", false);
		}else {
			model.addAttribute("sessionON", true);
			Long userId = (Long) session.getAttribute("userId");
			User user = userService.findUserById(userId);
			model.addAttribute("user", user);			
		}
		return "/amukan/acercaDeAmukan.jsp";
	}
}
