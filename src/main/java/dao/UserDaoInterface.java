package dao;


import pojos.User;

import java.util.ArrayList;


public interface UserDaoInterface {
    public void createUser(String username, String password, String email, int bought_items, int location);
    public void createUser(User user);
    public void deleteUser(int user_id);
    public void updateUser(User user);
    public ArrayList<User> getAllUsers(String string);
    public User getUserById(int userId);
    public User getUserByCred(String username, String password);
    public boolean login(String username, String password);
}
