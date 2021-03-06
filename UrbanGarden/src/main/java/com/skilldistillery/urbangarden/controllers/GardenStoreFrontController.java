package com.skilldistillery.urbangarden.controllers;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.skilldistillery.urbangarden.data.GardenStoreFrontDAO;
import com.skilldistillery.urbangarden.data.UserDAO;
import com.skilldistillery.urbangarden.entities.Address;
import com.skilldistillery.urbangarden.entities.GardenStoreFront;
import com.skilldistillery.urbangarden.entities.User;

@Controller
public class GardenStoreFrontController {

	@Autowired
	private GardenStoreFrontDAO dao;
	@Autowired
	private UserDAO udao;

	@RequestMapping(path = "getGardenStoreFront.do", method = RequestMethod.GET, params = "id")
	public String showGardenStoreFront(@RequestParam Integer id, Model model) {
		String view = "gardenStoreFront";
		GardenStoreFront gardenStoreFront = dao.findById(id);
		model.addAttribute("gardenStoreFront", gardenStoreFront);
		return view;
	}

	@RequestMapping(path = "getMyGardenStoreFront.do", method = RequestMethod.GET, params = "id")
	public String showMyGardenStoreFront(HttpSession session, Model model) {
		System.out.println();
		String view = "gardenStoreFront";
		User user = (User) session.getAttribute("userSession");
		int id = user.getId();
		GardenStoreFront gardenStoreFront = dao.findById(id);
		model.addAttribute("gardenStoreFront", gardenStoreFront);
		return view;
	}
//
//	@RequestMapping(path = "addGardenStoreFront.do", method = RequestMethod.GET)
//	public String addGardenStoreFront(Model model, GardenStoreFront gardenStoreFront) {
//		String view = "addGarden";
//		model.addAttribute("gardenStoreFront", gardenStoreFront);
//		return view;
//	}

	@RequestMapping(path = "addGardenStoreFront.do", method = RequestMethod.GET)
	public String addGardenStoreFront(Model model, int id) {
		String view = "addGarden";
		model.addAttribute("user", udao.findById(id));
		return view;
	}

//	@RequestMapping(path = "addGardenStoreFront.do", method = RequestMethod.POST)
//	public String postGardenStoreFront(Model model, GardenStoreFront gardenStoreFront) {
//		String view = "gardenStoreFront";
//		dao.create(gardenStoreFront);
//		return view;
//	}
//	
	@RequestMapping(path = "addGardenStoreFront.do", method = RequestMethod.POST, params = "userid")
	public String postGardenStoreFront(Model model, GardenStoreFront gardenStoreFront, int userid, 
			String street, String street2, int zipCode, String city, String state, String country) {
		String view = "createGardenConfirm";
		Address address = new Address(street, street2, zipCode, city, state, country);
		dao.createUserandGardenWithAddress(gardenStoreFront, userid, address);
		model.addAttribute("object", gardenStoreFront);
		return view;
	}

	@RequestMapping(path = "deleteGardenStoreFront.do", method = RequestMethod.POST, params = "id")
	public String deleteGardenStoreFront(@RequestParam Integer id, Model model) {
		String view = "deleteGardenStoreFront";
		boolean deleted = dao.delete(id);
		model.addAttribute("delete", deleted);
		model.addAttribute("id", id);
		return view;
	}

	@RequestMapping(path = "editGardenStoreFront.do", method = RequestMethod.GET)
	public String editGardenStoreFront(Model model, HttpSession session) {
		User user = (User) session.getAttribute("userSession"); // Later -
		GardenStoreFront gsf = user.getGardenStoreFront();
		session.setAttribute("gardenStoreFrontSession", gsf);
		model.addAttribute("gardenStoreFront", dao.findById(gsf.getId()));
		model.addAttribute("address", dao.findById(gsf.getId()).getAddress());

		String view = "editGarden";
		System.out.println("#################  " + gsf);
		return view;
	}

	@RequestMapping(path = "editGardenStoreFront.do", method = RequestMethod.POST)
	public String updateGardenStoreFront(GardenStoreFront gardenStoreFront, HttpSession session, RedirectAttributes redir) {
		gardenStoreFront.setUser((User) session.getAttribute("userSession"));
		System.out.println((User) session.getAttribute("userSession"));
		gardenStoreFront.setAddress(gardenStoreFront.getAddress());
		session.setAttribute("gardenStoreFront", dao.update(gardenStoreFront));
		session.removeAttribute("userSession");// Probably don't need this
		session.setAttribute("userSession", gardenStoreFront.getUser());
		System.out.println((User) session.getAttribute("userSession"));
//		redir.addFlashAttribute("user", gardenStoreFront.getUser());
		return "redirect:homePage.do";
	}
}
