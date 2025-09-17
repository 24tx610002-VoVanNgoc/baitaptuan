package ltweb.daos;

import ltweb.models.UserModel;

public interface UserDao {
	
	UserModel findbyUserName(String username);

	boolean register(UserModel user);

	boolean checkExistUsername(String username);

	UserModel findByUserNameAndPassword(String username, String password);

}
