package ltweb.services;

import ltweb.models.UserModel;

public interface UserSevice {
	
	
	UserModel login(String username, String password);
	
	UserModel findbyUserName(String username);
	 boolean register(UserModel user);

}
