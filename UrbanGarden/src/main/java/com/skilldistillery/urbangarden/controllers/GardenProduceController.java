package com.skilldistillery.urbangarden.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.skilldistillery.urbangarden.data.GardenProduceDAO;
import com.skilldistillery.urbangarden.entities.GardenProduce;

@Controller
public class GardenProduceController {
		
	@Autowired
	private GardenProduceDAO dao;
	
	@RequestMapping(path = "getGardenProduce.do", method = RequestMethod.GET, params = "id")
	public String showGardenProduce(@RequestParam Integer id, Model model) {
		String view = "gardenProduce/show";
		GardenProduce gardenProduce = dao.findById(id);
		model.addAttribute("gardenProduce", gardenProduce);
		return view;
	}
	
	@RequestMapping(path = "addGardenProduce.do", method = RequestMethod.GET)
	public String addGardenProduce( Model model, GardenProduce gardenProduce) {
		String view = "addGardenProduce";
		model.addAttribute("gardenProduce", gardenProduce);
		return "redirect:addGardenProduce.do"; //Will redirect if time allots for new JSP
	}
	
	@RequestMapping(path = "addGardenProduce.do", method = RequestMethod.POST)
	public String postGardenProduce(Model model, GardenProduce gardenProduce) {
		String view = "gardenProducePost";
		System.out.println("@@@@@@@@@@@@@@@@@@@YOU MDADE IT HERE @@@@@@@@@@@@@@@@@@@@@@@");
		dao.create(gardenProduce);
		return "redirect:homePage.do";
	}
	
	@RequestMapping(path = "deleteGardenProduce.do", method = RequestMethod.POST, params="id")
	public String deleteGardenProduce(@RequestParam Integer id, Model model) {
		String view = "deleteGardenProduce";
		boolean deleted = dao.delete(id);
		model.addAttribute("delete", deleted);
		model.addAttribute("id", id);
		return view;
	}
	
	@RequestMapping(path = "editGardenProduce.do", method = RequestMethod.GET)
	public String editGardenProduce(GardenProduce gardenProduce, Model model) {
		String view = "editGardenProduce";
		model.addAttribute("gardenProduce", gardenProduce);
		return view;
	}
	
	@RequestMapping(path = "editGardenProduce.do", method = RequestMethod.POST)
	public String updateGardenProduce(@RequestParam Integer id, GardenProduce gardenProduce, Model model) {
		String view = "updateGardenProduce";
		model.addAttribute("gardenProduce", gardenProduce);
		dao.update(id, gardenProduce);
		return view;
	}
	
	@RequestMapping(path = "showGardenProduce.do")
	public String showGardenProduce(Model model) {
		String view = "showGardenProduce";
		return view;
	}
	
}
