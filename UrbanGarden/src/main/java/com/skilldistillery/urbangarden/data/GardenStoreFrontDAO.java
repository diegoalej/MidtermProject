package com.skilldistillery.urbangarden.data;

import java.util.List;

import com.skilldistillery.urbangarden.entities.GardenStoreFront;

public interface GardenStoreFrontDAO {
	GardenStoreFront findById(int id);
	List<GardenStoreFront> findAll();
}
