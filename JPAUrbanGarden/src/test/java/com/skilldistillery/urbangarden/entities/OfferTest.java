package com.skilldistillery.urbangarden.entities;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertTrue;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;

class OfferTest {

	private static EntityManagerFactory emf;
	private EntityManager em;
	private Offer offer;

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
		offer = em.find(Offer.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		offer = null;
	}

	@Test
	@DisplayName("test trade mappings")
	void test1() {
//		SELECT *
//	    -> FROM offer
//	    -> WHERE id = 1;
		assertEquals("We love your tomatoes", offer.getComment());

	}
	
	@Test
	@DisplayName("Relational Mapping between Offer and GardenProduct")
	void test2() {
		assertEquals(1, offer.getDesired().getId());
		assertEquals(1, offer.getDesired().getProduct().getId());
		assertEquals(1, offer.getDesired().getGarden().getId());
		assertEquals(12, offer.getDesired().getAmount());
		assertTrue(offer.getDesired().getActive());
		
	}
	
	@Test
	@DisplayName("Relational Mapping test bewteen Offer and Trade")
	void test3() {
	
		assertEquals("2020-06-29T01:00", offer.getTrade().getTradeDate().toString());
		assertEquals(1, offer.getTrade().getId());
		assertEquals("Great transaction", offer.getTrade().getBuyerComment());
		assertEquals(5, offer.getTrade().getBuyerRating());
		assertEquals("Great melons. Very juicy", offer.getTrade().getSellerComment());
		assertEquals(5, offer.getTrade().getSellerRating());
		assertTrue(offer.getTrade().getOffer().getAccepeted()); //Test relationship is accessible forwards and backwards.
	}
	

}