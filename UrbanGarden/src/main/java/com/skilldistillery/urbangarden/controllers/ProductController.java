package com.skilldistillery.urbangarden.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ProductController {
		
	@RequestMapping(path= {"/","home.do"})
	public String home() {
		return "index";
	}
}
