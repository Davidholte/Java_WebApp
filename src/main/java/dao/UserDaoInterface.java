package dao;


import pojos.User;

import java.util.ArrayList;


public interface UserDaoInterface {
    public void createUser(String role, String username, String password, String email, int bought_items, int location);
    public void deleteUser(int user_id);
    public void updateUser(User user);
    public ArrayList<User> getAllUsers();
    public User getUserById(int userId);
    public boolean userLogin(String username, String password);
    public boolean adminLogin(String username, String password);
}
