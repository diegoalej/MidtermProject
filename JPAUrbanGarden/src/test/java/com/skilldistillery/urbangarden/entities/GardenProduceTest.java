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

	}

}