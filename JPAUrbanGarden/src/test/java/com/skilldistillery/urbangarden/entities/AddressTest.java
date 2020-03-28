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

class AddressTest {
	
	private static EntityManagerFactory emf;
	private EntityManager em;
	private Address address;

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
		address = em.find(Address.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		em = null;
		address = null;
	}

	@Test
	@DisplayName("testing entity address with all fields")
	void test() {
		assertEquals(1, address.getId());
		assertEquals("2345 Random Street", address.getStreet());
		assertNull(address.getStreet2());
		assertEquals(80111, address.getZipCode());
		assertEquals("Denver", address.getCity());
		assertEquals("Colorado", address.getState());
		assertEquals("United States", address.getCountry());
	}

}
