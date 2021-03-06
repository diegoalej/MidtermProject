package com.skilldistillery.urbangarden.data;

import java.util.List;

import com.skilldistillery.urbangarden.entities.Address;
import com.skilldistillery.urbangarden.entities.GardenStoreFront;
import com.skilldistillery.urbangarden.entities.User;

public interface GardenStoreFrontDAO {
	GardenStoreFront findById(int id);

	List<GardenStoreFront> findAll();

	GardenStoreFront create(GardenStoreFront gsf);

	boolean delete(int id);

	GardenStoreFront deactivateStore(GardenStoreFront gsf);

	GardenStoreFront activateStore(GardenStoreFront gsf);

	GardenStoreFront update(GardenStoreFront gsf);

	List<GardenStoreFront> searchByZip(int id);

	List<GardenStoreFront> searchByKeyword(String keyword);

	List<GardenStoreFront> searchByFarm(String farm);

	GardenStoreFront createUserandGardenWithAddress(GardenStoreFront gsf, int id, Address address);

}
