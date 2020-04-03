package com.skilldistillery.urbangarden.data;

import java.time.LocalDateTime;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.urbangarden.entities.GardenProduce;
import com.skilldistillery.urbangarden.entities.Offer;
import com.skilldistillery.urbangarden.entities.Trade;

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
	public Offer create(GardenProduce desired, GardenProduce offered, String commentString) {
		Offer offer = new Offer();
		offer.setDesired(desired);
		offer.setOffered(offered);
		offer.setComment(commentString);
		offer.setOfferDate(LocalDateTime.now());
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
		String query = "SELECT DISTINCT(o) " + "FROM Offer o " + "JOIN GardenProduce gp " + "on o.offered.id = gp.id "
				+ "join GardenStoreFront gsf " + "on gsf = gp.garden " + "where gsf.user.id = :userId and o.accepeted = null";
		return em.createQuery(query, Offer.class).setParameter("userId", userId).getResultList();
	}

	@Override
	public List<Offer> findRequestOffersByUser(int userId) {
		String query = "SELECT DISTINCT(o)" + " FROM Offer o " + "JOIN GardenProduce gp " + "ON o.desired.id = gp.id "
				+ "JOIN GardenStoreFront gsf " + "ON gsf = gp.garden " + "WHERE gsf.user.id = :userId and o.accepeted = null";
		return em.createQuery(query, Offer.class).setParameter("userId", userId).getResultList();
	}

	@Override
	public Offer accept(int id) {
		Offer offer = em.find(Offer.class, id); //Makes sure to grab the right Trade
		offer.setAccepeted(true); //sets the accepted_rejected value to true;
//		Trade unmanagedTrade = new Trade(); //creates an unmanagedTrade object to send into DAO
//		unmanagedTrade.setOffer(offer); //Sets unmanageTrade's offer to current offer
//		TradeDAO tDAO = new TradeDAOImpl(); //Creates a DAO to persist Trade
		
//		System.out.println(offer); //Prints to make sure values are not null
//		System.out.println(offer.getDesired().toString());
//		System.out.println(offer.getOffered().toString());
		Trade trade = new Trade();
		trade.setTradeDate(LocalDateTime.now());
		trade.setOffer(offer);
		em.persist(trade);
		em.flush();
//		tDAO.create(offer); // attempts to persist Trade
		return offer;
	}

}
