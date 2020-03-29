package com.skilldistillery.urbangarden.data;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.urbangarden.entities.Product;

@Transactional
@Service
public class ProductDAOImpl implements ProductDAO {

	@PersistenceContext
	private EntityManager em;
	
	@Override
	public Product findById(int id) {
		return em.find(Product.class, id);
	}

	@Override
	public List<Product> findAll() {
		String query = "SELECT p FROM Product p";
		return em.createQuery(query, Product.class).getResultList();
	}

}
