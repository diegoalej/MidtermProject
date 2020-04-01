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
public class AdminController {
	@Autowired
	private UserDAO dao;

	@RequestMapping(path = "testAdmin.do")//, method = RequestMethod.GET, params = "id"
	public String testAdmin(Model model) {//@RequestParam Integer id, 
		String view = "admin";
//		User user = dao.findById(id);
//		model.addAttribute("user", user);
		return view;
	}
}
