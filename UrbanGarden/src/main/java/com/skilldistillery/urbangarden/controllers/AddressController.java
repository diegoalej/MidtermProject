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
	
	@RequestMapping(path = "addAddress.do", method = RequestMethod.GET)
	public String addAddress(Address address, Model model) {
		String view = "addAddress";
		model.addAttribute("address", address);
		return view;
	}
	
	@RequestMapping(path = "addAddress.do", method = RequestMethod.POST)
	public String postProduct(Address address, Model model) {
		String view = "offerAddress";
		dao.create(address);
		return view;
	}
	
	@RequestMapping(path = "deleteAddress.do", method = RequestMethod.POST, params="id")
	public String deleteAddress(@RequestParam Integer id, Model model) {
		String view = "deleteAddress";
		boolean deleted = dao.delete(id);
		model.addAttribute("delete", deleted);
		model.addAttribute("id", id);
		return view;
	}
	
	@RequestMapping(path = "editAddress.do", method = RequestMethod.GET)
	public String editAddress(Address address, Model model) {
		String view = "editAddress";
		model.addAttribute("address", address);
		return view;
	}
	
	@RequestMapping(path = "editAddress.do", method = RequestMethod.POST)
	public String updateAddress(@RequestParam Integer id, Address address, Model model) {
		String view = "updateAddress";
		model.addAttribute("address", address);
		dao.update(id, address);
		return view;
	}
}
