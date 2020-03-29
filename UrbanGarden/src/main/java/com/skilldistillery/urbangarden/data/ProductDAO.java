package com.skilldistillery.urbangarden.data;

import java.util.List;

import com.skilldistillery.urbangarden.entities.Product;

public interface ProductDAO {
	Product findById(int id);
	List<Product> findAll();
}
