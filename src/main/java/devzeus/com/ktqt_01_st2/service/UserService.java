package devzeus.com.ktqt_01_st2.service;

import devzeus.com.ktqt_01_st2.model.User;

import java.util.List;

public interface UserService {
    User login(String email, String password);
    User register(String username, String password, String fullName, String phone);
    User getUserById(int id);
    User getUserByEmail(String email);
    List<User> getAll();
    void createUser(User user);
    void updateUser(User user);
    void deleteUser(int id);
    boolean checkExistEmail(String email);
    boolean checkExistUsername(String username);
    boolean checkExistPhone(String phone);
}
