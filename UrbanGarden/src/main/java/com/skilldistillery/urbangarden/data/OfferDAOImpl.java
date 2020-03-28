package com.skilldistillery.urbangarden.data;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.urbangarden.entities.Offer;

@Transactional
@Service
public class OfferDAOImpl implements OfferDAO {

	@PersistenceContext
	private EntityManager em;
	
	@Override
	public Offer findById(int id) {
		return em.find(Offer.class, id);
	}

	@Override
	public List<Offer> findAll() {
		String query = "SELECT o FROM Offer o";
		return em.createQuery(query, Offer.class).getResultList();
	}

}
