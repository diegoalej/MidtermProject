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
		// TODO Auto-generated method stub
		return null;
	}

}
