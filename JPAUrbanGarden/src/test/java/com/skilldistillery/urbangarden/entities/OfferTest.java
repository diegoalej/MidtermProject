package com.skilldistillery.urbangarden.entities;

import static org.junit.jupiter.api.Assertions.assertEquals;

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

}