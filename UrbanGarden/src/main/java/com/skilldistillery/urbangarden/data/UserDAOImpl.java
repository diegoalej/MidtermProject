package com.skilldistillery.urbangarden.data;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

//import com.skilldistillery.urbangarden.entities.GardenStoreFront;
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
	public User create(User user) {
		em.persist(user);
		em.flush();
		return user;
	}

	@Override
	public boolean delete(int id) {
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
	public User deactivate(int id) {
		User managedOffer = em.find(User.class, id);
		managedOffer.setEnabled(false);
		return managedOffer;
	}
	@Override
	public User activate(int id) {
		User managedOffer = em.find(User.class, id);
		managedOffer.setEnabled(true);
		return managedOffer;
	}

	@Override
	public User activateUser(User user) {
		if (em.contains(user)) {
			user.setEnabled(true);
		}
		return user;
	}

	@Override

	public User update(int id, User user) {
		if (em.contains(em.find(User.class, id))) {
			User managedUser = em.find(User.class, id);
			managedUser.setAddressID(user.getAddressID());
			managedUser.setFirstName(user.getFirstName());
			managedUser.setLastName(user.getLastName());
			managedUser.setUsername(user.getUsername());
			managedUser.setPassword(user.getPassword());
			managedUser.setRole(user.getRole());
			managedUser.setPhoneNumber(user.getPhoneNumber());
			managedUser.setImageURL(user.getImageURL());
			return managedUser;
		} else
			return null;
	}

	@Override
	public User login(User user) {
		String username = user.getUsername();
		String password = user.getPassword();
		String loginQuery = "SELECT u FROM User u WHERE u.username = :username and u.password = :password";
		User managedUser = null;
		try {
			managedUser = em.createQuery(loginQuery, User.class).setParameter("username", username)
					.setParameter("password", password).getSingleResult();
		} catch (Exception e) {
			System.out.println("Invalid username and password combination.");
		}

		return managedUser;
	}

//	@Override
//	public List<GardenStoreFront> otherGardenStoreFronts(User user) {
//		String query = "Select g from GardenStoreFront g where g.user != :userid";
//		if (!em.contains(user)) {
//			return em.createQuery("SELECT g from GardenStoreFront g", GardenStoreFront.class).getResultList();
//		} else {
//			return em.createQuery(query, GardenStoreFront.class).setParameter("userid", user).getResultList();
//		}
//	}

}
