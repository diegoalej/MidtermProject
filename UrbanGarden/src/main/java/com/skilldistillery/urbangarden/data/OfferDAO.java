package com.skilldistillery.urbangarden.data;

import java.util.List;

import com.skilldistillery.urbangarden.entities.Offer;


public interface OfferDAO {
	Offer findById(int id);
	List<Offer> findAll();
}
