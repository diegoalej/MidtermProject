package com.skilldistillery.urbangarden.data;

import java.util.List;

import com.skilldistillery.urbangarden.entities.Trade;


public interface TradeDAO {
	Trade findById(int id);
	List<Trade> findAll();
}
