package com.skilldistillery.urbangarden.data;

import java.util.List;

import com.skilldistillery.urbangarden.entities.GardenProduce;
import com.skilldistillery.urbangarden.entities.GardenStoreFront;
import com.skilldistillery.urbangarden.entities.Product;


public interface GardenProduceDAO {
	GardenProduce findById(int id);
	List<GardenProduce> findAll();
	GardenProduce create(GardenProduce gardenProduce);
	GardenProduce update(GardenProduce gardenProduce);
	boolean delete(int id);
}
