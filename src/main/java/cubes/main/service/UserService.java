package cubes.main.service;

import java.util.List;


import cubes.main.entity.User;

public interface UserService {
	
	public List<User> findAll(); 
	
	public User findByUsername(String username);
	
	
	public void save(User user);
	
	public void deleteByUsername(String username);

}
