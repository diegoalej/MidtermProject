package com.skilldistillery.urbangarden.entities;

//import static org.junit.jupiter.api.Assertions.assertEquals;
//import static org.junit.jupiter.api.Assertions.assertTrue;
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

class GardenStoreFrontTest {
	
	private static EntityManagerFactory emf;
	private EntityManager em;
	private GardenStoreFront gstore;
	
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
		gstore = em.find(GardenStoreFront.class, 1); 
		
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		gstore = null;
	}

	@Test
	@DisplayName("test mapping for all fields without relationship")
	void test1() {
		assertEquals(1, gstore.getId());
		assertEquals(100, gstore.getSize());
		assertTrue(gstore.isOrganic());
		assertEquals("Marge's Place", gstore.getNameOfGarden());
		assertEquals("The best tomatoes you've ever had. Also, I have honey.", gstore.getDescription());
		assertNull(gstore.getGardenURL());
	}

}
