package com.skilldistillery.urbangarden.controllers;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.skilldistillery.urbangarden.data.GardenStoreFrontDAO;
import com.skilldistillery.urbangarden.data.UserDAO;
import com.skilldistillery.urbangarden.entities.GardenStoreFront;

@Controller
public class SearchController {

	@Autowired
	private UserDAO dao;
	@Autowired
	private GardenStoreFrontDAO gsfDAO;

	@RequestMapping(path = "searchByZip.do", method = RequestMethod.POST)
	public String searchByZip(int zip, HttpSession session) {
		List<GardenStoreFront> gsfResults = gsfDAO.searchByZip(zip);
		session.removeAttribute("gsfResults");
		session.setAttribute("gsfResults", gsfResults);

		return "#######";
	}

	@RequestMapping(path = "searchByKeyword.do", method = RequestMethod.POST)
	public String searchByKeyword(String keyword, HttpSession session) {
		List<GardenStoreFront> gsfResults = gsfDAO.searchByKeyword(keyword);
		session.removeAttribute("gsfResults");
		session.setAttribute("gsfResults", gsfResults);
		return "#######";
	}

	@RequestMapping(path = "searchByProduct.do", method = RequestMethod.POST)
	public String searchByProduct(String farm, HttpSession session) {
		List<GardenStoreFront> gsfResults = gsfDAO.searchByFarm(farm);
		session.removeAttribute("gsfResults");
		session.setAttribute("gsfResults", gsfResults);
		return "#######";
	}

}
