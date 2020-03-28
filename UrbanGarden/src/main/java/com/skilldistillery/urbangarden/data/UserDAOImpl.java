package com.skilldistillery.urbangarden.data;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import com.skilldistillery.urbangarden.entities.User;

public class UserDAOImpl implements UserDAO {
	private static EntityManagerFactory emf = Persistence.createEntityManagerFactory("UrbanGarden");

	@Override
	public User create(User user) {
		EntityManager em = emf.createEntityManager();
//		System.out.println("DAO, Before persist " + user);

		// start transaction
		em.getTransaction().begin();

		// write user to db
		em.persist(user);

		// update "local" User object
		em.flush();

		em.getTransaction().commit();

		em.close();

		return user;
	}

	@Override
	public User update(int id, User user) {
		EntityManager em = emf.createEntityManager();

		User userToBeChanged = em.find(User.class, id);

		em.getTransaction().begin();

//		userToBeChanged.setFirstName(user.getFirstName());
//		userToBeChanged.setLastName(user.getLastName());

		em.flush();

		em.getTransaction().commit();
		em.close();

		return userToBeChanged;
	}

	@Override
	public boolean destroy(int id) {
		EntityManager em = emf.createEntityManager();
		User user = em.find(User.class, id);

		// now changes to db are done, so create transaction
		em.getTransaction().begin();

		em.remove(user);

		em.flush();

		em.getTransaction().commit();

		// if boolean is true it was not removed, flipped logic below
		boolean removeStatus = !em.contains(user);

		em.close();

		return removeStatus;
	}

}
