package com.codingdojo.Amukan.controllers;

import java.util.HashMap;
import java.util.HashSet;
import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.codingdojo.Amukan.models.Categoria;
import com.codingdojo.Amukan.models.Comuna;
import com.codingdojo.Amukan.models.Lugar;
import com.codingdojo.Amukan.models.LugarEstado;
import com.codingdojo.Amukan.models.SubCategoria;
import com.codingdojo.Amukan.models.User;
import com.codingdojo.Amukan.services.CategoriaService;
import com.codingdojo.Amukan.services.ComunaService;
import com.codingdojo.Amukan.services.LugarEstadoService;
import com.codingdojo.Amukan.services.LugarService;
import com.codingdojo.Amukan.services.SubCategoriaService;
import com.codingdojo.Amukan.services.UserService;

@Controller
public class LugarController {
	private final ComunaService comunaService; 
	private final UserService userService;
	private final LugarService lugarService;
	private final CategoriaService categoriaService;
	private final SubCategoriaService subCategoriaService;
	private final LugarEstadoService lugarEstadoService;

	public LugarController(LugarService lugarService,ComunaService comunaService, UserService userService, CategoriaService categoriaService, SubCategoriaService subCategoriaService, LugarEstadoService lugarEstadoService) {
		this.comunaService = comunaService;
		this.lugarService = lugarService;
		this.userService = userService;
		this.categoriaService = categoriaService;
		this.subCategoriaService = subCategoriaService;
		this.lugarEstadoService = lugarEstadoService;
	}
	@RequestMapping("/show/{id}")
	public String showComuna(@PathVariable("id") Long idComuna, Model model, HttpSession session) {
		if(session.getAttribute("userId") == null) {
			model.addAttribute("sessionON", false);
		}else {
			model.addAttribute("sessionON", true);
			Long userId = (Long) session.getAttribute("userId");
			User user = userService.findUserById(userId);
			model.addAttribute("user", user);
			model.addAttribute("favoritos", getFavoritos(user));
		}
		Comuna comuna =	comunaService.findComuna(idComuna);
		List<Lugar> lugares = lugarService.findByComuna(idComuna, 2L);
		model.addAttribute("lugares", lugares);
		model.addAttribute("comuna", comuna);
		return "/lugares/showLugar.jsp";
	}
	@RequestMapping("/lugar/create")
	public String createLugar(@ModelAttribute("lugar") Lugar lugar, Model model, HttpSession session) {
		if(session.getAttribute("userId") == null) {
			model.addAttribute("sessionON", false);
		}else {
			model.addAttribute("sessionON", true);
			Long userId = (Long) session.getAttribute("userId");
			User user = userService.findUserById(userId);
			model.addAttribute("user", user);
			model.addAttribute("favoritos", getFavoritos(user));
		}
		List<Categoria> allCategorias = categoriaService.allCategoria();
		List<SubCategoria> allSubCategorias = subCategoriaService.allSubCategoria();
		List<Comuna> allComunas = comunaService.allComunas();
		model.addAttribute("categorias", allCategorias);
		model.addAttribute("subCategorias", allSubCategorias);
		model.addAttribute("comunas", allComunas);
		return "/lugares/createLugar.jsp";
	}
	
	
	@RequestMapping(value="/lugar/create", method=RequestMethod.POST)
	public String createLugarForm(@Valid @ModelAttribute("lugar") Lugar lugar, BindingResult result, HttpSession session) {
		if(result.hasErrors()) {
			return "/lugares/createLugar.jsp";
		}else {
			
			lugar.setLugarEstado(lugarEstadoService.findLugarEstado(1L));
			Long userId = (Long) session.getAttribute("userId");
			lugar.setUser(userService.findUserById(userId));
			Lugar l = lugarService.createLugar(lugar);
			return "redirect:/";
		}
		
	}
	
	
	@RequestMapping("/lugar/agregados-por-mi")
	public String addForMeLugar(Model model, HttpSession session) {
		if(session.getAttribute("userId") == null) {
			model.addAttribute("sessionON", false);
		}else {
			model.addAttribute("sessionON", true);
			Long userId = (Long) session.getAttribute("userId");
			User user = userService.findUserById(userId);
			model.addAttribute("user", user);
			model.addAttribute("favoritos", getFavoritos(user));
		}
		Long userId = (Long) session.getAttribute("userId");
		User user = userService.findUserById(userId);
		List<Lugar> lugarByUserId = lugarService.findByTypeUserId(userId , user.getUserType().getId());
		model.addAttribute("lugares", lugarByUserId);
		return "/lugares/addForMeLugar.jsp";
	}
	
	@RequestMapping("/lugar/solicitudes")
	public String viewRequestLugar(Model model, HttpSession session) {
		if(session.getAttribute("userId") == null) {
			model.addAttribute("sessionON", false);
		}else {
			model.addAttribute("sessionON", true);
			Long userId = (Long) session.getAttribute("userId");
			User user = userService.findUserById(userId);
			model.addAttribute("user", user);
			model.addAttribute("favoritos", getFavoritos(user));
		}
		Long userId = (Long) session.getAttribute("userId");
		User user = userService.findUserById(userId);
		model.addAttribute("user", user);
		List<Lugar> lugarByUserId = lugarService.findByTypeUserId(userId,user.getUserType().getId());
		model.addAttribute("lugares", lugarByUserId);
		return "/lugares/viewRequestLugar.jsp";
	}
	
	@RequestMapping("/aprobar/{id}")
	public String aprobarLugar(@PathVariable("id") Long idLugar, Model model, HttpSession session) {
		LugarEstado lugarEstado = lugarEstadoService.findLugarEstado(2L);
		lugarService.updateEstado(idLugar, lugarEstado);
		return "redirect:/lugar/solicitudes";
	}
	
	@RequestMapping("/rechazar/{id}")
	public String rechazarLugar(@PathVariable("id") Long idLugar, Model model, HttpSession session) {
		LugarEstado lugarEstado = lugarEstadoService.findLugarEstado(3L);
		lugarService.updateEstado(idLugar, lugarEstado);
		return "redirect:/lugar/solicitudes";
	}
	
	
	private HashMap<Long,Long> getFavoritos(User user) {
		HashMap<Long,Long> listFav = new HashMap<Long,Long>();
		listFav.put(1L,1L);
		return listFav;
	}
	
}
