package ltweb.services.Impl;   // nên viết "impl" chữ thường (theo convention)

import ltweb.daos.UserDao;
import ltweb.daos.impl.UserDaoImpl;
import ltweb.models.UserModel;
import ltweb.services.UserSevice;

public class UserServiceImpl implements UserSevice {

    private UserDao userDao = new UserDaoImpl();

    @Override
    public UserModel findbyUserName(String username) {
        return userDao.findbyUserName(username);
    }

    @Override
    public UserModel login(String username, String password) {
        // Gọi trực tiếp DAO kiểm tra username + password
        return userDao.findByUserNameAndPassword(username, password);
    }

    @Override
    public boolean register(UserModel user) {
        // Trước khi đăng ký, kiểm tra username đã tồn tại chưa
        if (userDao.checkExistUsername(user.getUsername())) {
            return false; // tồn tại thì trả về false
        }
        return userDao.register(user);
    }
}
