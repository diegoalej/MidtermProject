package com.skilldistillery.urbangarden.controllers;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.skilldistillery.urbangarden.data.GardenStoreFrontDAO;
import com.skilldistillery.urbangarden.data.UserDAO;
import com.skilldistillery.urbangarden.entities.GardenProduce;
import com.skilldistillery.urbangarden.entities.GardenStoreFront;
import com.skilldistillery.urbangarden.entities.User;

@Controller
public class SearchController {

	@Autowired
	private UserDAO dao;
	@Autowired
	private GardenStoreFrontDAO gsfDAO;

	@RequestMapping(path = "search.do")
	public String searchPage(HttpSession session, Model model) {
		if (session.getAttribute("userSession") != null) {
			User user = ((User) session.getAttribute("userSession"));
			int zip = user.getGardenStoreFront().getAddress().getZipCode();
			List<GardenStoreFront> gsfList = gsfDAO.searchByZip(zip);
			model.addAttribute("gsfResults", gsfList);

		}
		return "search";
	}

	@RequestMapping(path = "searchByZip.do", method = RequestMethod.POST)
	public String searchByZip(String zipString, HttpSession session, Model model) {
		List<GardenStoreFront> gsfResults = gsfDAO.findAll();
		try {
			int zip = Integer.parseInt(zipString);
			gsfResults = gsfDAO.searchByZip(zip);
		} catch (Exception e) {
			System.out.println("Could not parse integer. Returning list of all farms");
		}
		model.addAttribute("gsfResults", gsfResults);
		return "search";
	}

	@RequestMapping(path = "searchByKeyword.do", method = RequestMethod.POST)
	public String searchByKeyword(String keyword, HttpSession session, Model model) {
		List<GardenStoreFront> gsfResults = gsfDAO.searchByKeyword(keyword);
		model.addAttribute("gsfResults", gsfResults);
		return "search";
	}

	@RequestMapping(path = "searchByFarm.do", method = RequestMethod.POST)
	public String searchByProduct(String farm, HttpSession session, Model model) {
		List<GardenStoreFront> gsfResults = gsfDAO.searchByFarm(farm);
		model.addAttribute("gsfResults", gsfResults);
		return "search";
	}

}
