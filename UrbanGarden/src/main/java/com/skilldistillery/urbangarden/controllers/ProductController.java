package com.skilldistillery.urbangarden.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.skilldistillery.urbangarden.data.ProductDAO;
import com.skilldistillery.urbangarden.entities.Product;

@Controller
public class ProductController {
		
	@Autowired
	private ProductDAO dao;
	
	@RequestMapping(path = "getProduct.do", method = RequestMethod.GET, params = "id")
	public String showProduct(@RequestParam Integer id, Model model) {
		String view = "product/show";
		Product product = dao.findById(id);
		model.addAttribute("product", product);
		return view;
	}
}
