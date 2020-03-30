package com.skilldistillery.urbangarden.client;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import com.skilldistillery.urbangarden.entities.GardenStoreFront;

public class GardenStoreFrontClient {

	public static void main(String[] args) {
		EntityManagerFactory emf = Persistence.createEntityManagerFactory("UrbanGarden");
		EntityManager em = emf.createEntityManager();
//		String query = "SELECT gsf FROM GardenStoreFront gsf "
//				+ "WHERE gsf.address.zipCode = :zip";
//		List<GardenStoreFront> gsfResults = em.createQuery(query, GardenStoreFront.class).setParameter("zip", 80111).getResultList();

//		String query = "SELECT gsf FROM GardenProduce gp JOIN GardenStoreFront gsf "
//				+ "ON gp.garden = gsf JOIN Product p ON gp.product = p "
//				+ "WHERE p.name LIKE :keyword OR p.type LIKE :keyword " + "OR p.description LIKE :keyword"; // concat
//		List<GardenStoreFront> gsfResults = em.createQuery(query, GardenStoreFront.class)
//				.setParameter("keyword", "%" + "om" + "%").getResultList();
		
		String query = "SELECT gsf FROM GardenStoreFront gsf where gsf.nameOfGarden like :farm";
		List<GardenStoreFront> gsfResults = em.createQuery(query, GardenStoreFront.class).setParameter("farm", "%"+"marge"+"%").getResultList();
		
		for (GardenStoreFront gardenStoreFront : gsfResults) {
			System.out.println(gardenStoreFront);
		}
		// TODO Auto-generated method stub

	}

}
