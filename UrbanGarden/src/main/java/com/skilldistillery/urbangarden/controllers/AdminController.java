package com.skilldistillery.urbangarden.controllers;

import java.util.List;

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

	@RequestMapping(path = "testAdmin.do")//, method = RequestMethod.GET, params = "id"
	public String testAdmin(Model model) {//@RequestParam Integer id, 
		String view = "admin";
		List<User> allUsers = dao.findAll();		
		model.addAttribute("users", allUsers);
		return view;
	}
//	@RequestMapping(path = "getUser.do", method = RequestMethod.GET, params = "id")
//	public String showUser(@RequestParam Integer id, Model model) {
//		String view = "user/show";
//		User user = dao.findById(id);
//		model.addAttribute("user", user);
//		return view;
//	}
	
}
