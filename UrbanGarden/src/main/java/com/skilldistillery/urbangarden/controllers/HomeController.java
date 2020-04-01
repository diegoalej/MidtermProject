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
	public String login(User userLogin, Model model, HttpSession session) {
		User user = dao.login(userLogin);
		if (user != null) {
			session.setAttribute("userSession", user);
			model.addAttribute("user", user);
			return "myGardenStoreFront";
		} else {
			return "index";
		}

	}
	
	@RequestMapping(path = "homePage.do", method = RequestMethod.GET)
	public String homePage(Model model, HttpSession session) {
		model.addAttribute("user", dao.findById(((User) session.getAttribute("userSession")).getId()));
		return "myGardenStoreFront";
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
