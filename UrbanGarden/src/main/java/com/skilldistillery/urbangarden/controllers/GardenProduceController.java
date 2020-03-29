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
}
