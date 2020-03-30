package com.skilldistillery.urbangarden.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.skilldistillery.urbangarden.data.ProductDAO;
import com.skilldistillery.urbangarden.entities.Offer;
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
	
	@RequestMapping(path = "addProduct.do", method = RequestMethod.GET)
	public String addProduct( Model model, Product product) {
		String view = "addProduct";
		model.addAttribute("product", product);
		return view;
	}
	
	@RequestMapping(path = "addProduct.do", method = RequestMethod.POST)
	public String postProduct(Model model, Product product) {
		String view = "offerProduct";
		dao.create(product);
		return view;
	}
	
	@RequestMapping(path = "deleteProduct.do", method = RequestMethod.POST, params="id")
	public String deleteProduct(@RequestParam Integer id, Model model) {
		String view = "deleteProduct";
		boolean deleted = dao.delete(id);
		model.addAttribute("delete", deleted);
		model.addAttribute("id", id);
		return view;
	}
	
	@RequestMapping(path = "editProduct.do", method = RequestMethod.GET)
	public String editProduct(Product product, Model model) {
		String view = "editProduct";
		model.addAttribute("product", product);
		return view;
	}
	
	@RequestMapping(path = "editProduct.do", method = RequestMethod.POST)
	public String updateProduct(@RequestParam Integer id, Product product, Model model) {
		String view = "updateProduct";
		model.addAttribute("product", product);
		dao.update(id, product);
		return view;
	}
}
