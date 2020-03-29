package com.skilldistillery.urbangarden.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.skilldistillery.urbangarden.data.AddressDAO;
import com.skilldistillery.urbangarden.entities.Address;

@Controller
public class AddressController {
		
	@Autowired
	private AddressDAO dao;
	
	@RequestMapping(path = "getAddress.do", method = RequestMethod.GET, params = "id")
	public String showAddress(@RequestParam Integer id, Model model) {
		String view = "address/show";
		Address address = dao.findById(id);
		model.addAttribute("address", address);
		return view;
	}
	
	
}
