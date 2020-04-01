package com.skilldistillery.urbangarden.controllers;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.skilldistillery.urbangarden.data.UserDAO;
import com.skilldistillery.urbangarden.entities.User;

@Controller
public class AdminController {
	@Autowired
	private UserDAO dao;

//	@RequestMapping(path = "adminGarden.do", method = RequestMethod.POST, params = "id")//
//	public String adminGarden(@RequestParam Integer id, Model model) { 
//		String view = "myGardenStoreFront";
//		User user = dao.findById(id);		
//		model.addAttribute("user", user);
//		return view;
//	}
	@RequestMapping(path = "disableUser.do", method = RequestMethod.POST, params = "id")
	public String disableUser(@RequestParam Integer id,  Model model, HttpSession session) {
		String view = "admin";
		User user = dao.deactivate(id);
		dao.update(id, user);
		List<User> allUsers = dao.findAll();		
		model.addAttribute("users", allUsers);
		model.addAttribute("user", session.getAttribute("userSession"));
		return view;
	}
	@RequestMapping(path = "enableUser.do", method = RequestMethod.POST, params = "id")
	public String enableUser(@RequestParam Integer id,  Model model, HttpSession session) {
		String view = "admin";
		User user = dao.activate(id);
		dao.update(id, user);
		List<User> allUsers = dao.findAll();		
		model.addAttribute("users", allUsers);
		model.addAttribute("user", session.getAttribute("userSession"));
		return view;
	}

	
}
