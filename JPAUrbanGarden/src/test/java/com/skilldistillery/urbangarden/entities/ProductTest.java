package com.skilldistillery.urbangarden.entities;

import static org.junit.jupiter.api.Assertions.*;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;

class ProductTest {
	
	private static EntityManagerFactory emf;
	private EntityManager em;
	private Product product;
	

	@BeforeAll
	static void setUpBeforeClass() throws Exception {
		emf = Persistence.createEntityManagerFactory("UrbanGarden");
	}

	@AfterAll
	static void tearDownAfterClass() throws Exception {
		emf.close();
	}

	@BeforeEach
	void setUp() throws Exception {
		em = emf.createEntityManager();
		product = em.find(Product.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		product = null;
	}

	@Test
	@DisplayName("Test mapping for all fields in Product")
	void test() {
		assertEquals(1, product.getId());
		assertEquals("Tomatoes", product.getName());
		assertEquals("Cherokee Purple", product.getType());
		assertEquals("Large, Purple, Heirloom tomato", product.getDescription());
		assertEquals("large", product.getSizeOfProduct().toString());
		assertNull(product.getImageURL());
	}
	
	@Test
	@DisplayName("Relational Mapping between Product and GardenProduce")
	void test2() {
		assertEquals(1, product.getGardenProduces().get(0).getId());
		assertEquals(1, product.getGardenProduces().get(0).getGarden().getId());
		assertEquals(12, product.getGardenProduces().get(0).getAmount());
		assertTrue(product.getGardenProduces().get(0).getActive());	
		}
	
	

}
