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
	
	@RequestMapping(path = "getOffer.do", method = RequestMethod.GET, params = "id")
	public String showOffer(@RequestParam Integer id, Model model) {
		String view = "offer/show";
		Offer offer = dao.findById(id);
		model.addAttribute("offer", offer);
		return view;
	}
}
