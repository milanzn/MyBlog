package cubes.main.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import cubes.main.entity.User;

public interface UserRepository extends JpaRepository<User, String>{
	
	public User findByUsername(String username);

}
