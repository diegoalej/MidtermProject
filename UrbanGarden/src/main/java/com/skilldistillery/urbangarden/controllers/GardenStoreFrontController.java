package com.skilldistillery.urbangarden.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.skilldistillery.urbangarden.data.GardenStoreFrontDAO;
import com.skilldistillery.urbangarden.entities.GardenStoreFront;

@Controller
public class GardenStoreFrontController {
		
	@Autowired
	private GardenStoreFrontDAO dao;
	
	@RequestMapping(path = "getGardenStoreFront.do", method = RequestMethod.GET, params = "id")
	public String showGardenStoreFront(@RequestParam Integer id, Model model) {
		String view = "gardenStoreFront/show";
		GardenStoreFront gardenStoreFront = dao.findById(id);
		model.addAttribute("gardenStoreFront", gardenStoreFront);
		return view;
	}
	
	@RequestMapping(path = "addGardenStoreFront.do", method = RequestMethod.GET)
	public String addGardenStoreFront( Model model, GardenStoreFront gardenStoreFront) {
		String view = "addGardenStoreFront";
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
	public String editGardenStoreFront(GardenStoreFront gardenStoreFront, Model model) {
		String view = "editGardenStoreFront";
		model.addAttribute("gardenStoreFront", gardenStoreFront);
		return view;
	}
	
	@RequestMapping(path = "editGardenStoreFront.do", method = RequestMethod.POST)
	public String updateGardenStoreFront(@RequestParam Integer id, GardenStoreFront gardenStoreFront, Model model) {
		String view = "updateGardenStoreFront";
		model.addAttribute("gardenStoreFront", gardenStoreFront);
		dao.update(id, gardenStoreFront);
		return view;
	}
}
