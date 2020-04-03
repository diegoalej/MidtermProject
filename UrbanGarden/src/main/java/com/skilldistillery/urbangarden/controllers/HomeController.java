package com.skilldistillery.urbangarden.controllers;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.skilldistillery.urbangarden.data.GardenProduceDAO;
import com.skilldistillery.urbangarden.data.GardenStoreFrontDAO;
import com.skilldistillery.urbangarden.data.OfferDAO;
import com.skilldistillery.urbangarden.data.ProductDAO;
import com.skilldistillery.urbangarden.data.UserDAO;
import com.skilldistillery.urbangarden.entities.GardenProduce;
import com.skilldistillery.urbangarden.entities.GardenStoreFront;
import com.skilldistillery.urbangarden.entities.User;

@Controller
public class HomeController {
	@Autowired
	private UserDAO dao;
	@Autowired
	private GardenStoreFrontDAO gsfDAO;
	@Autowired
	private ProductDAO prodDAO;
	@Autowired
	private GardenProduceDAO gpDAO;
	@Autowired
	private OfferDAO offerDAO;

	@RequestMapping(path = { "/", "home.do" })
	public String home() {
		return "index";
	}

	@RequestMapping(path = "login.do", method = RequestMethod.POST)
	public String login(User userLogin, Model model, HttpSession session) {
		User user = dao.login(userLogin);
		if (user != null) {
			if (user.getEnabled()) {
				session.setAttribute("userSession", user);
				if (user.getRole().equals("admin")) {
					List<User> allUsers = dao.findAll();
					model.addAttribute("user", user);
					model.addAttribute("users", allUsers);

					return "admin";
				} else {
					model.addAttribute("user", user);
					model.addAttribute("receivedOffers", offerDAO.findRequestOffersByUser(user.getId()));
					model.addAttribute("madeOffers", offerDAO.findDesiredOffersByUser(user.getId()));
					return "myGardenStoreFront";
				}
			} else return "index";
		} else {
			return "index";
		}

	}

	@RequestMapping(path = "homePage.do", method = RequestMethod.GET)
	public String homePage(Model model, HttpSession session) {
		User user = dao.findById(((User) session.getAttribute("userSession")).getId());

		if (user != null) {
			if (user.getEnabled()) {
				model.addAttribute("user", user);
				model.addAttribute("receivedOffers", offerDAO.findRequestOffersByUser(user.getId()));
				model.addAttribute("madeOffers", offerDAO.findDesiredOffersByUser(user.getId()));
				return "myGardenStoreFront";
			} else {
				return "index";
			}
		} else
			return "index";
	}

	@RequestMapping(path = "logout.do", method = RequestMethod.GET)
	public String logout(Model model, HttpSession session) {
		if (session.getAttribute("user") != null) {
			session.removeAttribute("user");
			model.addAttribute("logout", "Logout successful.");
			session.invalidate();
		}

		return "index";
	}

	@RequestMapping(path = "addNewProduct.do", method = RequestMethod.GET)
	public String newProduct(Model model, HttpSession session) {
		GardenStoreFront userGSF = ((User) session.getAttribute("userSession")).getGardenStoreFront();
		System.out.println(userGSF);
		model.addAttribute("gardenStoreFront", userGSF);
		model.addAttribute("listAllProducts", prodDAO.findAll());
		return "addGardenProduce";
	}

	@RequestMapping(path = "editProduce.do", method = RequestMethod.POST)
	public String editProduce(Model model, HttpSession session, int gardenProduceID) {
		GardenProduce gardenProduce = gpDAO.findById(gardenProduceID);
		model.addAttribute("gardenProduce", gardenProduce);
		return "editGardenProduce";
	}

	@RequestMapping(path = "viewAllOffers")
	public String viewOffers(Model model, HttpSession session, GardenProduce gardenProduce) {

		return "showOffer";
	}

//	@RequestMapping(path = "search.do", method = RequestMethod.GET)
//	public String searchAllGardens(HttpSession session) {
//
//		User user = (User) session.getAttribute("user");
//		session.setAttribute("allGSF", dao.otherGardenStoreFronts(user));
//		return "######";
//	}
}
