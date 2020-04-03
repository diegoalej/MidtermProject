package com.skilldistillery.urbangarden.data;

import java.time.LocalDateTime;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.urbangarden.entities.Offer;
import com.skilldistillery.urbangarden.entities.Trade;

@Transactional
@Service
public class TradeDAOImpl implements TradeDAO {

	@PersistenceContext
	private EntityManager em;
	
	@Override
	public Trade findById(int id) {
		return em.find(Trade.class, id);
	}

	@Override
	public List<Trade> findAll() {
		String query = "SELECT t FROM Trade t";
		return em.createQuery(query, Trade.class).getResultList();
	}

	@Override
	public Trade create(Offer offer) {
		Trade unmanagedTrade = new Trade();
		unmanagedTrade.setOffer(offer);
		unmanagedTrade.setTradeDate(LocalDateTime.now());
		
		
		unmanagedTrade.setBuyerComment("Something");
		unmanagedTrade.setSellerComment("Else");
		unmanagedTrade.setBuyerRating(5);
		unmanagedTrade.setSellerRating(5);
		
		em.persist(unmanagedTrade);
		
		System.out.println("SECOND TIME PRINTING TRADE"+ unmanagedTrade);
		
		em.flush();
		return unmanagedTrade;
	}

	@Override
	public Trade update(int id, Trade trade) {
		Trade managedTrade = em.find(Trade.class, id);
		managedTrade.setTradeDate(trade.getTradeDate());
		managedTrade.setBuyerComment(trade.getBuyerComment());
		managedTrade.setBuyerRating(trade.getBuyerRating());
		managedTrade.setSellerComment(trade.getSellerComment());
		managedTrade.setSellerRating(trade.getSellerRating());
		managedTrade.setOffer(trade.getOffer());
		return managedTrade;
	}

	@Override
	public boolean delete(int id) {
		Trade managedTrade = em.find(Trade.class, id);
		if (managedTrade != null) {
			em.remove(managedTrade);
			em.flush();
			if (!em.contains(managedTrade)) {
				return true;
			}
		}
		return false;
	}

	@Override
	public List<Trade> tradesByUser(int userId) { //Functionality needs to be implemented.
		String query2 = "SELECT DISTINCT(t) "
				+ "FROM Trade t "
				+ "WHERE t.offer.desired.garden.user.id = :userId "
				+ "OR t.offer.offered.garden.user.id = :userId";
				
		return em.createQuery(query2, Trade.class).setParameter("userId", 1).getResultList();
	}

}
