package com.skilldistillery.urbangarden.data;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.urbangarden.entities.User;

@Transactional
@Service
public class UserDAOImpl implements UserDAO {

	@PersistenceContext
	private EntityManager em;

	@Override
	public User findById(int id) {
		return em.find(User.class, id);
	}

	@Override
	public List<User> findAll() {
		List<User> results = null;
		String queryString = "SELECT s from User s";
		results = em.createQuery(queryString, User.class).getResultList();
		return results;
	}

	@Override
	public User createUser(User user) {
		em.persist(user);
		em.flush();
		return user;
	}

	@Override
	public boolean destroyUser(int id) {
		boolean destroyed = false;
		try {
			User toDestroy = em.find(User.class, id);
			if (em.contains(toDestroy)) {
				em.remove(toDestroy);
				em.flush();
				destroyed = true;
			}
		} catch (Exception e) {
			System.out.println("Unable to delete user record. It may not exist in the database.");
		}
		// TODO Auto-generated method stub
		return destroyed;
	}

	@Override
	public User deactivateUser(User user) {
		if (em.contains(user)) {
			user.setEnabled(false);
		}
		return user;
	}
	
	@Override
	public User activateUser(User user) {
		if(em.contains(user)) {
			user.setEnabled(true);
		}
		return user;
	}

	@Override
	public User updateUser(User user) {
		if(em.contains(user)) {
			User managedUser = em.find(User.class, user.getId());
			managedUser.setAddressID(user.getAddressID());
			managedUser.setFirstName(user.getFirstName());
			managedUser.setLastName(user.getLastName());
			managedUser.setUsername(user.getUsername());
			managedUser.setPassword(user.getPassword());
			managedUser.setRole(user.getRole());
			managedUser.setPhoneNumber(user.getPhoneNumber());
			managedUser.setImageURL(user.getImageURL());
			return managedUser;
		} else return null;
	}

}
