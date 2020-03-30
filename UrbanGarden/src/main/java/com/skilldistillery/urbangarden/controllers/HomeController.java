package com.skilldistillery.urbangarden.controllers;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.skilldistillery.urbangarden.data.GardenStoreFrontDAO;
import com.skilldistillery.urbangarden.data.UserDAO;
import com.skilldistillery.urbangarden.entities.User;

@Controller
public class HomeController {
	@Autowired
	private UserDAO dao;
	@Autowired
	private GardenStoreFrontDAO gsfDAO;

	@RequestMapping(path = { "/", "home.do" })
	public String home() {
		return "index";
	}

	@RequestMapping(path = "login.do", method = RequestMethod.POST)
	public String login(User user, Model model, HttpSession session) {
		User userLogin = dao.login(user);
		if (userLogin != null) {
			session.setAttribute("user", userLogin);
			return "myGardenStoreFront";
		} else {
			model.addAttribute("errorLogin", "Invalid username and password combination. Please try again.");
			return "index";
		}

	}

	@RequestMapping(path = "logout.do", method = RequestMethod.GET)
	public String logout(Model model, HttpSession session) {
		if (session.getAttribute("user") != null) {
			session.removeAttribute("user");
			model.addAttribute("logout", "Logout successful.");
		}

		return "index";
	}

//	@RequestMapping(path = "search.do", method = RequestMethod.GET)
//	public String searchAllGardens(HttpSession session) {
//
//		User user = (User) session.getAttribute("user");
//		session.setAttribute("allGSF", dao.otherGardenStoreFronts(user));
//		return "######";
//	}
}
