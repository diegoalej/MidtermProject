package com.skilldistillery.urbangarden.data;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.PersistenceContext;

import com.skilldistillery.urbangarden.entities.User;

public class UserDAOImpl implements UserDAO {
	private static EntityManagerFactory emf = Persistence.createEntityManagerFactory("UrbanGarden");

	@PersistenceContext
	private EntityManager em;
	
	@Override
	public User findById(int id) {
		// TODO Auto-generated method stub
		return em.find(User.class, id);
	}

	@Override
	public List<User> findAll() {
		List<User> results = null;
		String queryString = "SELECT s from User s";
		results = em.createQuery(queryString, User.class)
                 .getResultList();
		return results;
	}

}
