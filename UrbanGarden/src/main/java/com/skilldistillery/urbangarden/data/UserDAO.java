package com.skilldistillery.urbangarden.data;

import com.skilldistillery.urbangarden.entities.User;

public interface UserDAO {
	public User create(User user);
	public User update(int id, User user);
	public boolean destroy(int id);
}
