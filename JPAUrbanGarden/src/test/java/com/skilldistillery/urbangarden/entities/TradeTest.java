package com.skilldistillery.urbangarden.entities;

import static org.junit.jupiter.api.Assertions.assertEquals;

import java.time.LocalDate;

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
		emf = Persistence.createEntityManagerFactory("VideoStore");
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
	@DisplayName("test Film mappings")
	void test1() {
//		SELECT *
//	    -> FROM rental
//	    -> WHERE id = 1;
		assertEquals(LocalDate.of(2014, 5, 24), trade.getRentalDate());
		assertEquals(LocalDate.of(2014, 5, 26), trade.getReturnDate());
		assertEquals(46, trade.getStaff().getId());
		assertEquals(130, trade.getCustomer().getId());
//		assertEquals(14072, rental.getItem().getId());
		
	}

}