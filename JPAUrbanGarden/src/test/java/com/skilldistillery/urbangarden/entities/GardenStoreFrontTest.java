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
		assertTrue(gstore.isActive());
	}
	
	@Test
	@DisplayName("Relational Mapping test between GardenStore and Address")
	void test2() {
		assertEquals("2345 Random Street", gstore.getAddress().getStreet());
		assertNull(gstore.getAddress().getStreet2());
		assertEquals(80111, gstore.getAddress().getZipCode());
		assertEquals("Denver", gstore.getAddress().getCity());
		assertEquals("Colorado", gstore.getAddress().getState());
		assertEquals("United States", gstore.getAddress().getCountry());
	}
	
	@Test
	@DisplayName("Relational Mapping test between GardenStore and User")
	void test3() {
		assertEquals("JJ", gstore.getUser().getFirstName());
		assertEquals("Smith", gstore.getUser().getLastName());
		assertEquals("jjsmith", gstore.getUser().getUsername());
		assertEquals("jjsmithpassword", gstore.getUser().getPassword());
		assertTrue(gstore.getUser().getEnabled());
		assertEquals("admin", gstore.getUser().getRole());
		assertNull(gstore.getUser().getPhoneNumber());
		assertNull(gstore.getUser().getImageURL());
		assertNull(gstore.getUser().getAddressID());
		
	}

}
