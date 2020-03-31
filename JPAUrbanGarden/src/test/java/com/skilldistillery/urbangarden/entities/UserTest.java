package com.skilldistillery.urbangarden.entities;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;
import static org.junit.jupiter.api.Assertions.assertNull;
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

class UserTest {
	
	static EntityManagerFactory emf;
	private EntityManager em;
	private User user;
	
	

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
		user = em.find(User.class, 1);
		
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		user = null;
	}

	@Test
	@DisplayName("testing initial mapping of user entity")
	void test1() {
		assertNotNull(user);
		assertEquals(1, user.getId());
		assertEquals("jjsmith", user.getUsername());
		assertEquals("Smith", user.getLastName());
		assertEquals("JJ", user.getFirstName());
		assertEquals("jjsmithpassword", user.getPassword());
		assertTrue(user.getEnabled());
		assertEquals("admin", user.getRole());
		assertEquals(null, user.getPhoneNumber());
		assertNull(user.getImageURL());
		
	}
	
	@Test
	@DisplayName("Relational Mapping between User and GardenStore")
	void test2() {
		assertEquals(1, user.getGardenStoreFront().getId());
		assertEquals(100, user.getGardenStoreFront().getSize());
		assertTrue(user.getGardenStoreFront().getOrganic());
		assertEquals("The best tomatoes you've ever had. Also, I have honey.", user.getGardenStoreFront().getDescription());
	}

}
