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
	//MINE
//	@RequestMapping(path = "addUser.do", method = RequestMethod.GET)
//	public String addUser( Model model) {
//		String view = "addUser";
//		return view;
//	}
	
	@RequestMapping(path = "addUser.do", method = RequestMethod.GET)
	public String addUser(User user, Model model) {
		String view = "addUser";
		model.addAttribute("user", user);
		return view;
	}
	
	@RequestMapping(path = "addUser.do", method = RequestMethod.POST)
	public String postUser(User user, Model model) {
		String view = "offerUser";
		dao.create(user);
		return view;
	}
	
	@RequestMapping(path = "deleteUser.do", method = RequestMethod.POST, params="id")
	public String deleteUser(@RequestParam Integer id, Model model) {
		String view = "deleteUser";
		boolean deleted = dao.delete(id);
		model.addAttribute("delete", deleted);
		model.addAttribute("id", id);
		return view;
	}
	
	@RequestMapping(path = "editUser.do", method = RequestMethod.GET)
	public String editUser(User user, Model model) {
		String view = "editUser";
		model.addAttribute("user", user);
		return view;
	}
	
	@RequestMapping(path = "editUser.do", method = RequestMethod.POST)
	public String updateUser(@RequestParam Integer id, User user, Model model) {
		String view = "updateUser";
		model.addAttribute("user", user);
		dao.update(id, user);
		return view;
	}
	
}
