package com.skilldistillery.urbangarden.data;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.urbangarden.entities.Address;

@Transactional
@Service
public class AddressDAOImpl implements AddressDAO {

	@PersistenceContext
	private EntityManager em;
	
	@Override
	public Address findById(int id) {
		return em.find(Address.class, id);
	}

	@Override
	public List<Address> findAll() {
		String query = "SELECT a FROM Address a";
		return em.createQuery(query, Address.class).getResultList();
	}

	@Override
	public Address createAddress(Address address) {
		em.persist(address);
		em.flush();
		// TODO Auto-generated method stub
		return address;
	}

	@Override
	public boolean destroyAddress(int id) {
		boolean destroyed = false;
		try {
			Address toDestroy = em.find(Address.class, id);
			if(em.contains(toDestroy)){
			em.remove(toDestroy);
			em.flush();
			destroyed = true;
			}
		} catch (Exception e){
			System.out.println("Unable to delete address record. It may not exist in the database.");
		}
		// TODO Auto-generated method stub
		return destroyed;
	}

	@Override
	public Address updateAddress(Address updateAddress) {
		if(em.contains(updateAddress)) {
			Address managedAddress = em.find(Address.class, updateAddress.getId());
			managedAddress.setStreet(updateAddress.getStreet());
			managedAddress.setStreet2(updateAddress.getStreet2());
			managedAddress.setCity(updateAddress.getCity());
			managedAddress.setState(updateAddress.getState());
			managedAddress.setZipCode(updateAddress.getZipCode());
			managedAddress.setCountry(updateAddress.getCountry());
			return managedAddress;
		}else return null;
	}

}
