package com.codingdojo.Amukan.controllers;


import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.codingdojo.Amukan.models.User;
import com.codingdojo.Amukan.services.UserService;
import com.codingdojo.Amukan.services.UserTypeService;



@Controller
public class UserController {
	private final UserService userService;
	private final  UserTypeService userTypeService;
	public UserController (UserService userService , UserTypeService userTypeService) {
		this.userService = userService;
		this.userTypeService = userTypeService;
	}
	@RequestMapping("/")
	public String home(HttpSession session , Model model) {
		System.out.println(session.getAttribute("userId"));
		if(session.getAttribute("userId") == null) {
			model.addAttribute("sessionON", false);
			return "/users/homePage.jsp";
		}else {
			Long userId = (Long) session.getAttribute("userId");
			User user = userService.findUserById(userId);
			model.addAttribute("user", user);
			return "/users/homePage.jsp";
		}
		
	}
	@RequestMapping("/login")
	public String login(Model model, HttpSession session) {
		if(session.getAttribute("userId") == null) {
			model.addAttribute("sessionON", false);
		}else {
			model.addAttribute("sessionON", true);
			Long userId = (Long) session.getAttribute("userId");
			User user = userService.findUserById(userId);
			model.addAttribute("user", user);
		}
		return "/users/loginPage.jsp";
	}
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
	@RequestMapping("/registration")
	public String registration(Model model, HttpSession session) {
		if(session.getAttribute("userId") == null) {
			model.addAttribute("sessionON", false);
			return "/users/registrationPage.jsp";
		}else {
			Long userId = (Long) session.getAttribute("userId");
			User user = userService.findUserById(userId);
			model.addAttribute("user", user);
			return "/users/registrationPage.jsp";
		}
		
	}
	@RequestMapping("/registration/turista")
	public String registrationTurista(@ModelAttribute("user")User user) {
		return "/users/registrationTurista.jsp";
	}
	@RequestMapping("/registration/empresa")
	public String registrationEmpresa(@ModelAttribute("user")User user) {
		return "/users/registrationEmpresa.jsp";
	}
	@RequestMapping(value="/login", method=RequestMethod.POST)
	public String loginUser(@RequestParam("email") String email, @RequestParam("password") String password, Model model, HttpSession session) {
		boolean isAuthenticated = userService.authenticateUser(email, password);
		if(isAuthenticated) {
			User u = userService.findByEmail(email);
			session.setAttribute("userId", u.getId());
			return "redirect:/";
		}
		else {
			model.addAttribute("error", "Credenciales Invalidas, Intente Nuevamente.");
			return "/users/loginPage.jsp";
		}
	}
	@RequestMapping(value="/registration/turista", method=RequestMethod.POST)
	public String registerUserT(@Valid @ModelAttribute("user") User user, BindingResult result, HttpSession session) {
		if(result.hasErrors()) {
			return "/users/registrationTurista.jsp";
		}
		user.setUserType(userTypeService.findUserType(2L));
		User u = userService.registerUser(user);
		session.setAttribute("userId", u.getId());
		return "redirect:/";
	}
	
	@RequestMapping(value="/registration/empresa", method=RequestMethod.POST)
	public String registerUserE(@Valid @ModelAttribute("user") User user, BindingResult result, HttpSession session) {
		if(result.hasErrors()) {
			return "/users/registrationEmpresa.jsp";
		}
		user.setUserType(userTypeService.findUserType(3L));
		User u = userService.registerUser(user);
		session.setAttribute("userId", u.getId());
		return "redirect:/";
	}
	
}
