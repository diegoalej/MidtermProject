package com.skilldistillery.urbangarden.data;

import java.util.List;

import com.skilldistillery.urbangarden.entities.Offer;


public interface OfferDAO {
	Offer findById(int id);
	List<Offer> findAll();
	Offer create(Offer offer);
	Offer update(int id, Offer offer);
	boolean delete(int id);
	Offer deactivate(int id);
}
