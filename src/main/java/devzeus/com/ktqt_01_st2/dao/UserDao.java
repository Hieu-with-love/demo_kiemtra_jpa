package devzeus.com.ktqt_01_st2.dao;

import devzeus.com.ktqt_01_st2.model.User;

import java.util.List;

public interface UserDao {
    User findById(int id);
    User findByEmail(String username);
    List<User> findAll();
    void saveUser(User user);
    void updateUser(User user);
    void deleteUser(int id);
    boolean checkExistEmail(String email);
    boolean checkExistUsername(String username);
    boolean checkExistPhone(String phone);
}
