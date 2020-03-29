package com.skilldistillery.urbangarden.data;

import java.util.List;

import com.skilldistillery.urbangarden.entities.GardenProduce;
import com.skilldistillery.urbangarden.entities.User;


public interface GardenProduceDAO {
	GardenProduce findById(int id);
	List<GardenProduce> findAll();
}
