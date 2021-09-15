package cubes.main.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cubes.main.dao.UserRepository;
import cubes.main.entity.User;

@Service
public class UserServiceImpl implements UserService{
	
	@Autowired
	private UserRepository userRepository;
	
	@Override
	public List<User> findAll() {
		
		return userRepository.findAll();
	}

	@Override
	public User findByUsername(String username) {
		
		return userRepository.findByUsername(username);
	}

	@Override
	public void save(User user) {
		userRepository.save(user);
		
	}

	@Override
	public void deleteByUsername(String username) {
		userRepository.deleteById(username);
		
	}

}
