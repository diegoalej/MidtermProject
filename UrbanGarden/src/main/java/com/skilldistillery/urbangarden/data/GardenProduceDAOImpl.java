package com.skilldistillery.urbangarden.data;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.urbangarden.entities.GardenProduce;

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

}
