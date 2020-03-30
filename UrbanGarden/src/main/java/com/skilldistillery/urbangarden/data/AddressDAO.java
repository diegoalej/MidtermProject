package com.skilldistillery.urbangarden.data;

import java.util.List;

import com.skilldistillery.urbangarden.entities.Address;

public interface AddressDAO {
	Address findById(int id);
	List<Address> findAll();
	Address create(Address address);
	boolean delete(int id);
	Address update(int id, Address updateAdd);
	
}
