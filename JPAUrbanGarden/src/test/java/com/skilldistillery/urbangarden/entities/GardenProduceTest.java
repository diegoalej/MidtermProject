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

class GardenProduceTest {

	private static EntityManagerFactory emf;
	private EntityManager em;
	private GardenProduce produce;

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
		produce = em.find(GardenProduce.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		produce = null;
	}

	@Test
	@DisplayName("test trade mappings")
	void test1() {
//		SELECT *
//	    -> FROM garden_produce
//	    -> WHERE id = 1;
		assertEquals(12, produce.getAmount());
		assertEquals("2020-10-10", produce.getDateAvailable().toString());

	}
	
	@Test
	@DisplayName("Relational Mapping test between GardenProduce and GardenStore")
	void test2() {
		assertEquals(1, produce.getGarden().getId());
		assertEquals(100, produce.getGarden().getSize());
		assertTrue(produce.getGarden().isOrganic());
		assertEquals("Marge's Place", produce.getGarden().getNameOfGarden());
		assertEquals(1, produce.getGarden().getUser().getId());
		assertEquals("The best tomatoes you've ever had. Also, I have honey.", produce.getGarden().getDescription());
		assertEquals(1, produce.getGarden().getAddress().getId());
		assertNull(produce.getGarden().getGardenURL());
		
	}
	
	@Test
	@DisplayName("Relational Mapping test between GardenProduce and Product")
	void test3() {
		assertEquals(1, produce.getProduct().getId());
		assertEquals("Tomatoes", produce.getProduct().getName());
		assertEquals("Cherokee Purple", produce.getProduct().getType());
		assertEquals("Large, Purple, Heirloom tomato", produce.getProduct().getDescription());
		assertEquals("large", produce.getProduct().getSizeOfProduct().toString());
		assertNull(produce.getProduct().getImageURL());
	}
	
	@Test
	@DisplayName("Relational Mapping test between GardenProduce and Offer")
	void test4() {
		assertEquals(2, produce.getOfferedProduct().get(0).getId());
		assertEquals(1, produce.getRequestedProduct().get(0).getId());
		assertEquals("2020-06-30T01:00", produce.getRequestedProduct().get(0).getOfferDate().toString());
		assertEquals("2020-07-15T01:00", produce.getOfferedProduct().get(0).getOfferDate().toString());
		assertEquals("We love your tomatoes", produce.getRequestedProduct().get(0).getComment());
		assertEquals("Your Melons make me happy", produce.getOfferedProduct().get(0).getComment());
		assertTrue(produce.getRequestedProduct().get(0).getAccepeted());
		assertNull(produce.getOfferedProduct().get(0).getAccepeted());
//		assertEquals
	}

}