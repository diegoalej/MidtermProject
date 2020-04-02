package com.skilldistillery.urbangarden.controllers;

import java.time.LocalDate;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.skilldistillery.urbangarden.data.GardenProduceDAO;
import com.skilldistillery.urbangarden.data.GardenStoreFrontDAO;
import com.skilldistillery.urbangarden.data.ProductDAO;
import com.skilldistillery.urbangarden.entities.GardenProduce;

@Controller
public class GardenProduceController {
		
	@Autowired
	private GardenProduceDAO dao;
	
	@Autowired
	private GardenStoreFrontDAO daoGSF;
	
	@Autowired
	private ProductDAO daoProd;
	
	@RequestMapping(path = "getGardenProduce.do", method = RequestMethod.GET, params = "id")
	public String showGardenProduce(@RequestParam Integer id, Model model) {
		String view = "gardenProduce/show";
		GardenProduce gardenProduce = dao.findById(id);
		model.addAttribute("gardenProduce", gardenProduce);
		return view;
	}
	
	@RequestMapping(path = "addGardenProduce.do", method = RequestMethod.GET)
	public String addGardenProduce( Model model, GardenProduce gardenProduce) {
		model.addAttribute("gardenProduce", gardenProduce);
		return "redirect:addGardenProduce.do"; //Will redirect if time allots for new JSP
	}
	
	@RequestMapping(path = "addGardenProduce.do", method = RequestMethod.POST)
	public String postGardenProduce(Model model, GardenProduce gardenProduce, int gardenId, int productId,
			String dateAvailableString, String harvestedString, String dateExpiresString) {
		try {
			gardenProduce.setDateAvailable(LocalDate.parse(dateAvailableString));
		} catch (Exception e) {
			e.printStackTrace();
		}
		try {
			gardenProduce.setHarvested(LocalDate.parse(harvestedString));
		} catch (Exception e) {
			e.printStackTrace();
		}
		try {
			gardenProduce.setExpires(LocalDate.parse(dateExpiresString));
		} catch (Exception e) {
			e.printStackTrace();
		}
		gardenProduce.setGardenStoreFront(daoGSF.findById(gardenId));
		gardenProduce.setProduct(daoProd.findById(productId));
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
	
	@RequestMapping(path = "editGardenProduce.do", method = RequestMethod.GET) //Redirect Home?
	public String editGardenProduce() {
		return "redirect:homePage.do";
	}
	
	@RequestMapping(path = "editGardenProduce.do", method = RequestMethod.POST)
	public String updateGardenProduce(GardenProduce gardenProduce, Model model, String dateAvailableString, String harvestedString, String dateExpiresString) {
		try {
			gardenProduce.setDateAvailable(LocalDate.parse(dateAvailableString));
		} catch (Exception e) {
			e.printStackTrace();
		}
		try {
			gardenProduce.setHarvested(LocalDate.parse(harvestedString));
		} catch (Exception e) {
			e.printStackTrace();
		}
		try {
			gardenProduce.setExpires(LocalDate.parse(dateExpiresString));
		} catch (Exception e) {
			e.printStackTrace();
		}
		model.addAttribute("gardenProduce", gardenProduce);
		dao.update(gardenProduce);
		return "redirect:editGardenProduce.do";
	}
	
	@RequestMapping(path = "showGardenProduce.do")
	public String showGardenProduce(Model model) {
		String view = "showGardenProduce";
		return view;
	}
	
}
