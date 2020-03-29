package com.skilldistillery.urbangarden.data;

import java.util.List;

import com.skilldistillery.urbangarden.entities.GardenProduce;


public interface GardenProduceDAO {
	GardenProduce findById(int id);
	List<GardenProduce> findAll();
	GardenProduce create(GardenProduce gardenProduce);
	GardenProduce update(int id, GardenProduce gardenProduce);
	boolean delete(int id);
}
