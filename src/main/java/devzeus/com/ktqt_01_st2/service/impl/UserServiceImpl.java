package devzeus.com.ktqt_01_st2.service.impl;

import devzeus.com.ktqt_01_st2.dao.UserDao;
import devzeus.com.ktqt_01_st2.dao.impl.UserDaoImpl;
import devzeus.com.ktqt_01_st2.model.User;
import devzeus.com.ktqt_01_st2.service.UserService;

import java.util.List;

public class UserServiceImpl implements UserService {
    UserDao userDao = new UserDaoImpl();

    @Override
    public User login(String username, String password) {
        return this.getUserByUsername(username);
    }

    @Override
    public User register(String username, String password) {
        User user = new User();
        user.setEmail(username);
        user.setPasswd(password);
        userDao.saveUser(user);
        if (user.getEmail() == null)
            return null;
        return user;
    }

    @Override
    public User getUserById(int id) {
        return null;
    }

    @Override
    public User getUserByUsername(String username) {
        return null;
    }

    @Override
    public List<User> getAll() {
        return userDao.findAll();
    }

    @Override
    public void createUser(User user) {
        userDao.saveUser(user);
    }

    @Override
    public void updateUser(User user) {
        userDao.updateUser(user);
    }

    @Override
    public void deleteUser(int id) {
        userDao.deleteUser(id);
    }

    @Override
    public boolean checkExistEmail(String email) {
        return userDao.checkExistEmail(email);
    }

    @Override
    public boolean checkExistUsername(String username) {
        return userDao.checkExistUsername(username);
    }

    @Override
    public boolean checkExistPhone(String phone) {
        return userDao.checkExistPhone(phone);
    }
}
