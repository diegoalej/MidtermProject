package com.skilldistillery.urbangarden.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.skilldistillery.urbangarden.data.TradeDAO;
import com.skilldistillery.urbangarden.entities.Trade;

@Controller
public class TradeController {
		
	@Autowired
	private TradeDAO dao;
	
	@RequestMapping(path = "getTrade.do", method = RequestMethod.GET, params = "id")
	public String showTrade(@RequestParam Integer id, Model model) {
		String view = "trade/show";
		Trade trade = dao.findById(id);
		model.addAttribute("trade", trade);
		return view;
	}
}
