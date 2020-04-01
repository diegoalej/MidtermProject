package com.skilldistillery.urbangarden.controllers;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.skilldistillery.urbangarden.data.GardenStoreFrontDAO;
import com.skilldistillery.urbangarden.entities.Address;
import com.skilldistillery.urbangarden.entities.GardenStoreFront;
import com.skilldistillery.urbangarden.entities.User;

@Controller
public class GardenStoreFrontController {
		
	@Autowired
	private GardenStoreFrontDAO dao;
	
	@RequestMapping(path = "getGardenStoreFront.do", method = RequestMethod.GET, params = "id")
	public String showGardenStoreFront(@RequestParam Integer id, Model model) {
		String view = "gardenStoreFront";
		GardenStoreFront gardenStoreFront = dao.findById(id);
		model.addAttribute("gardenStoreFront", gardenStoreFront);
		return view;
	}
	
	@RequestMapping(path = "addGardenStoreFront.do", method = RequestMethod.GET)
	public String addGardenStoreFront( Model model, GardenStoreFront gardenStoreFront) {
		String view = "addGarden";
		model.addAttribute("gardenStoreFront", gardenStoreFront);
		return view;
	}
	
	@RequestMapping(path = "addGardenStoreFront.do", method = RequestMethod.POST)
	public String postGardenStoreFront(Model model, GardenStoreFront gardenStoreFront) {
		String view = "gardenStoreFront";
		dao.create(gardenStoreFront);
		return view;
	}
	
	@RequestMapping(path = "deleteGardenStoreFront.do", method = RequestMethod.POST, params="id")
	public String deleteGardenStoreFront(@RequestParam Integer id, Model model) {
		String view = "deleteGardenStoreFront";
		boolean deleted = dao.delete(id);
		model.addAttribute("delete", deleted);
		model.addAttribute("id", id);
		return view;
	}
	
	@RequestMapping(path = "editGardenStoreFront.do", method = RequestMethod.GET)
	public String editGardenStoreFront(Model model, HttpSession session) {
		User user = (User) session.getAttribute("user"); //Later - 
		GardenStoreFront gsf = user.getGardenStoreFront();
		session.setAttribute("gardenStoreFront", gsf);
		model.addAttribute("gardenStoreFront", gsf);
		model.addAttribute("address", gsf.getAddress());
		
		String view = "editGarden";
		System.out.println("#################  " + gsf);
		return view;
	}
	
	@RequestMapping(path = "editGardenStoreFront.do", method = RequestMethod.POST)
	public String updateGardenStoreFront(GardenStoreFront gardenStoreFront, HttpSession session) {
		String view = "myGardenStoreFront";
		gardenStoreFront.setUser((User) session.getAttribute("user"));
		gardenStoreFront.setAddress(gardenStoreFront.getAddress());
		session.setAttribute("gardenStoreFront", dao.update(gardenStoreFront));
		session.setAttribute("user", gardenStoreFront.getUser());
		return "redirect:homePage.do";
	}
}
