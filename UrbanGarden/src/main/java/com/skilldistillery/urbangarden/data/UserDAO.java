package com.skilldistillery.urbangarden.data;

import java.util.List;

import com.skilldistillery.urbangarden.entities.User;


public interface UserDAO {
	User findById(int id);
	List<User> findAll();
	User create(User user);
	boolean delete(int id);
	User deactivateUser(User user);
	User activateUser(User user);
	User update(int id, User user);
	
}
