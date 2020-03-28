package com.skilldistillery.urbangarden.data;

import java.util.List;

import com.skilldistillery.urbangarden.entities.User;


public interface UserDAO {
	User findById(int id);
	List<User> findAll();
}
