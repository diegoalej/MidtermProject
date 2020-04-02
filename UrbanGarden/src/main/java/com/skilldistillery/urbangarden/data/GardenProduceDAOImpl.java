package com.skilldistillery.urbangarden.data;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.urbangarden.entities.GardenProduce;
import com.skilldistillery.urbangarden.entities.GardenStoreFront;
import com.skilldistillery.urbangarden.entities.Product;

@Transactional
@Service
public class GardenProduceDAOImpl implements GardenProduceDAO {

	@PersistenceContext
	private EntityManager em;
	
	@Override
	public GardenProduce findById(int id) {
		return em.find(GardenProduce.class, id);
	}

	@Override
	public List<GardenProduce> findAll() {
		String query = "SELECT p FROM GardenProduce p";
		return em.createQuery(query, GardenProduce.class).getResultList();
	}

	@Override
	public GardenProduce create(GardenProduce gardenProduce) {
		System.out.println("!!!!!!!!!!!!!!!!!!!!!You made it here!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
		em.persist(gardenProduce);
		System.out.println("#########################WAS MY GUESS RIGHT#########################");
		em.flush();
		return gardenProduce;
	}

	@Override
	public GardenProduce update(GardenProduce gardenProduce) {
		GardenProduce managedGardenProduce = em.find(GardenProduce.class, gardenProduce.getId());
		managedGardenProduce.setActive(gardenProduce.getActive());
		managedGardenProduce.setAmount(gardenProduce.getAmount());
		managedGardenProduce.setDateAvailable(gardenProduce.getDateAvailable());
		managedGardenProduce.setExpires(gardenProduce.getExpires());
		managedGardenProduce.setHarvested(gardenProduce.getHarvested());
		return managedGardenProduce;
	}

	@Override
	public boolean delete(int id) {
		GardenProduce managedGardenProduce = em.find(GardenProduce.class, id);
		if (managedGardenProduce != null) {
			em.remove(managedGardenProduce);
			em.flush();
			if (!em.contains(managedGardenProduce)) {
				return true;
			}
		}
		return false;
	}

}
