package com.skilldistillery.urbangarden.data;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.urbangarden.entities.GardenStoreFront;

@Transactional
@Service
public class GardenStoreFrontDAOImpl implements GardenStoreFrontDAO {
	
	@PersistenceContext
	private EntityManager em;
	
	@Override
	public GardenStoreFront findById(int id) {
		return em.find(GardenStoreFront.class, id);

	}

	@Override
	public List<GardenStoreFront> findAll() {
		List<GardenStoreFront> results = null;
		String queryString = "SELECT s from XXXXX s";
		results = em.createQuery(queryString, GardenStoreFront.class)
                 .getResultList();
		return results;

	}

}
