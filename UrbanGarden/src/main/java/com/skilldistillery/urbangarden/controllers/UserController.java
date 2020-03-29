package com.skilldistillery.urbangarden.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.skilldistillery.urbangarden.data.UserDAO;
import com.skilldistillery.urbangarden.entities.User;

@Controller
public class UserController {
		
	@Autowired
	private UserDAO dao;
	
	@RequestMapping(path = "getUser.do", method = RequestMethod.GET, params = "id")
	public String showUser(@RequestParam Integer id, Model model) {
		String view = "user/show";
		User user = dao.findById(id);
		model.addAttribute("user", user);
		return view;
	}
	
	
}
