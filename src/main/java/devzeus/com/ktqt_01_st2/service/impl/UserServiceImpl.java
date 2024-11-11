package devzeus.com.ktqt_01_st2.service.impl;

import devzeus.com.ktqt_01_st2.dao.UserDao;
import devzeus.com.ktqt_01_st2.dao.impl.UserDaoImpl;
import devzeus.com.ktqt_01_st2.model.User;
import devzeus.com.ktqt_01_st2.service.UserService;

import java.util.List;

public class UserServiceImpl implements UserService {
    UserDao userDao = new UserDaoImpl();

    @Override
    public User login(String email, String password) {
        try{
            User user = this.getUserByEmail(email);
            if(user != null && user.getPasswd().equals(password)){
               return user;
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public User register(String email, String password, String fullName, String phone) {
        User user = new User();
        user.setEmail(email);
        user.setFullname(fullName);
        user.setPhone(phone);
        user.setPasswd(password);
        user.setIs_admin(false);
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
    public User getUserByEmail(String email) {
        return userDao.findByEmail(email);
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
