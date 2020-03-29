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

	@Override
	public Product create(Product product) {
		em.persist(product);
		em.flush();
		return product;
	}

	@Override
	public Product update(int id, Product product) {
		Product managedProduct = em.find(Product.class, id);
		managedProduct.setType(product.getType());
		managedProduct.setSizeOfProduct(product.getSizeOfProduct());
		managedProduct.setName(product.getName());
		managedProduct.setImageURL(product.getImageURL());
		managedProduct.setDescription(product.getDescription());
		managedProduct.setGardenProduces(product.getGardenProduces());
		return managedProduct;
	}

	@Override
	public boolean delete(int id) {
		Product managedProduct = em.find(Product.class, id);
		if (managedProduct != null) {
			em.remove(managedProduct);
			em.flush();
			if (!em.contains(managedProduct)) {
				return true;
			}
		}
		return false;
	}

}
