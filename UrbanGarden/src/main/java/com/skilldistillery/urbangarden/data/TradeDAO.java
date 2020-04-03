package com.skilldistillery.urbangarden.data;

import java.util.List;

import com.skilldistillery.urbangarden.entities.Offer;
import com.skilldistillery.urbangarden.entities.Trade;


public interface TradeDAO {
	Trade findById(int id);
	List<Trade> findAll();
	Trade create(Offer offer);
	Trade update(int id, Trade trade);
	boolean delete(int id);
	List<Trade> tradesByUser();
	
}
