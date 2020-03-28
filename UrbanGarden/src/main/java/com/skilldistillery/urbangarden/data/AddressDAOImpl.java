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

}
