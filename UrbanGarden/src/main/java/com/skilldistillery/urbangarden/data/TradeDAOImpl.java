package com.skilldistillery.urbangarden.data;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

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
	public Trade create(Trade trade) {
		em.persist(trade);
		em.flush();
		return trade;
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

}
