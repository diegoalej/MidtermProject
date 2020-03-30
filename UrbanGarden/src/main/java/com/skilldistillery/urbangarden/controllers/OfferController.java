package com.skilldistillery.urbangarden.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.skilldistillery.urbangarden.data.OfferDAO;
import com.skilldistillery.urbangarden.entities.Offer;

@Controller
public class OfferController {
		
	@Autowired
	private OfferDAO dao;
	
//	@RequestMapping(path= {"/","home.do"})
//	public String home() {
//		return "index";
//	}
	
	@RequestMapping(path = "getOffer.do", method = RequestMethod.GET, params = "id")
	public String showOffer(@RequestParam Integer id, Model model) {
		String view = "offer/show";
		Offer offer = dao.findById(id);
		model.addAttribute("offer", offer);
		return view;
	}
	
	@RequestMapping(path = "addOffer.do", method = RequestMethod.GET)
	public String addTrade( Model model, Offer offer) {
		String view = "addOffer";
		model.addAttribute("offer", offer);
		return view;
	}
	
	@RequestMapping(path = "addOffer.do", method = RequestMethod.POST)
	public String postOffer(Model model, Offer offer) {
		String view = "offerPost";
		dao.create(offer);
		return view;
	}
	
	@RequestMapping(path = "deleteOffer.do", method = RequestMethod.POST, params="id")
	public String deleteOffer(@RequestParam Integer id, Model model) {
		String view = "deleteOffer";
		boolean deleted = dao.delete(id);
		model.addAttribute("delete", deleted);
		model.addAttribute("id", id);
		return view;
	}
	
	@RequestMapping(path = "editOffer.do", method = RequestMethod.GET)
	public String editOffer(Offer offer, Model model) {
		String view = "editOffer";
		model.addAttribute("offer", offer);
		return view;
	}
	
	@RequestMapping(path = "editOffer.do", method = RequestMethod.POST)
	public String updateOffer(@RequestParam Integer id, Offer offer, Model model) {
		String view = "updateOffer";
		model.addAttribute("offer", offer);
		dao.update(id, offer);
		return view;
	}
	
}
