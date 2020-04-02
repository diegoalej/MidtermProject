package com.skilldistillery.urbangarden.client;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.apache.jasper.tagplugins.jstl.core.ForEach;

import com.skilldistillery.urbangarden.entities.GardenProduce;
import com.skilldistillery.urbangarden.entities.Offer;
import com.skilldistillery.urbangarden.entities.User;

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
		
//		String query = "SELECT gsf FROM GardenStoreFront gsf where gsf.nameOfGarden like :farm";
//		List<GardenStoreFront> gsfResults = em.createQuery(query, GardenStoreFront.class).setParameter("farm", "%"+"marge"+"%").getResultList();
//		
//		for (GardenStoreFront gardenStoreFront : gsfResults) {
//			System.out.println(gardenStoreFront);
//		}
		
//		String query = "SELECT gp from GardenStoreFront gsf join GardenProduce gp on gsf.id = gp.garden.id where gsf.id = 1";
//		List<GardenProduce> gp = em.createQuery(query, GardenProduce.class).getResultList();
//		for (GardenProduce gardenProduce : gp) {
//			System.out.println(gardenProduce);
//		}
//		String userQ = "SELECT u from User u where u.id = 1";
//		User user = em.createQuery(userQ, User.class).getSingleResult();
//		List<GardenProduce> gp = user.getGardenStoreFront().getGardenProduces();
//		for (GardenProduce gardenProduce : gp) {
//			System.out.println(gp);
//		}
		
//		String query = "SELECT DISTINCT(o) "
//				+ "FROM Offer o "
//				+ "JOIN GardenProduce gp "
//				+ "on o.offered.id = gp.id "
//				+ "join GardenStoreFront gsf "
//				+ "on gsf = gp.garden "
//				+ "where gsf.user.id = :userId";
		
		String query = "SELECT DISTINCT(o)"
				+ " FROM Offer o "
				+ "JOIN GardenProduce gp "
				+ "ON o.desired.id = gp.id "
				+ "JOIN GardenStoreFront gsf "
				+ "ON gsf = gp.garden "
				+ "WHERE gsf.user.id = :userId";
		List<Offer> offers = em.createQuery(query, Offer.class).setParameter("userId", 1).getResultList();
		for (Offer offer : offers) {
			System.out.println(offer);
		}
		// TODO Auto-generated method stub

	}

}
