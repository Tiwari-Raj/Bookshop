package com.DOA;
import java.util.List;

import com.entity.User;
public interface UserDAO {

	public boolean userRegister(User us);
	
	public User login(String email,String password); 
		
	public boolean checkPassword(int id, String ps); 
	
	public boolean updateProfile(User us);
	
	public  boolean checkUser(String em); 
	
	public List<User> getalluser();
	
	public boolean deleteUser(int id);
	
	
	
}
