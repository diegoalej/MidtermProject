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

	@Override
	public Offer create(Offer offer) {
		em.persist(offer);
		em.flush();
		return offer;
	}

	@Override
	public Offer update(int id, Offer offer) {
		Offer managedOffer = em.find(Offer.class, id);
		managedOffer.setAccepeted(offer.getAccepeted());
		managedOffer.setComment(offer.getComment());
		managedOffer.setDesired(offer.getDesired());
		managedOffer.setOfferDate(offer.getOfferDate());
		managedOffer.setOffered(offer.getOffered());
		managedOffer.setTrade(offer.getTrade());
		return managedOffer;
	}

	@Override
	public Offer deactivate(int id) {
		Offer managedOffer = em.find(Offer.class, id);
		managedOffer.setAccepeted(false);
		return managedOffer;
	}

	@Override
	public boolean delete(int id) {
		Offer managedOffer = em.find(Offer.class, id);
		if (managedOffer != null) {
			em.remove(managedOffer);
			em.flush();
			if (!em.contains(managedOffer)) {
				return true;
			}
		}
		return false;
	}

	@Override
	public List<Offer> findDesiredOffersByUser(int userId) {
		String query = "SELECT DISTINCT(o) "
				+ "FROM Offer o "
				+ "JOIN GardenProduce gp "
				+ "on o.offered.id = gp.id "
				+ "join GardenStoreFront gsf "
				+ "on gsf = gp.garden "
				+ "where gsf.user.id = :userId";
		return em.createQuery(query, Offer.class).setParameter("userId", userId).getResultList();
	}

	@Override
	public List<Offer> findRequestOffersByUser(int userId) {
		String query = "SELECT DISTINCT(o)"
				+ " FROM Offer o "
				+ "JOIN GardenProduce gp "
				+ "ON o.desired.id = gp.id "
				+ "JOIN GardenStoreFront gsf "
				+ "ON gsf = gp.garden "
				+ "WHERE gsf.user.id = :userId";
		return em.createQuery(query, Offer.class).setParameter("userId", userId).getResultList();
	}

}
