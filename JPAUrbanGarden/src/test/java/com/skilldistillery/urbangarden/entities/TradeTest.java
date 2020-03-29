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

class TradeTest {

	private static EntityManagerFactory emf;
	private EntityManager em;
	private Trade trade;

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
		trade = em.find(Trade.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		trade = null;
	}

	@Test
	@DisplayName("test trade mappings")
	void test1() {
//		SELECT *
//	    -> FROM trade
//	    -> WHERE id = 1;
		assertEquals(5, trade.getSellerRating());

	}
	
	@Test
	@DisplayName("Relational Mapping between Trade and Offer")
	void test2() {
		assertEquals(1, trade.getOffer().getId());
		assertEquals("2020-06-30T01:00", trade.getOffer().getOfferDate().toString());
		assertEquals(2, trade.getOffer().getOffered().getId());
		assertTrue(trade.getOffer().getAccepeted());
		assertEquals("We love your tomatoes", trade.getOffer().getComment());
		assertEquals("Tomatoes", trade.getOffer().getDesired().getProduct().getName()); //Testing extensive reach between the entities.
	}

}