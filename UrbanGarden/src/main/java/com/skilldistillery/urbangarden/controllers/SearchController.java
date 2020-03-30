package com.skilldistillery.urbangarden.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.skilldistillery.urbangarden.data.GardenStoreFrontDAO;
import com.skilldistillery.urbangarden.data.UserDAO;

@Controller
public class SearchController {
	
	@Autowired
	private UserDAO dao;
	@Autowired
	private GardenStoreFrontDAO gsfDAO;
	
	@RequestMapping(path = "searchByZip", method = RequestMethod.POST)
	public String searchByZip(int zip) {
		
		
		return "#######";
	}

}
