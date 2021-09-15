package cubes.main.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import cubes.main.entity.Message;

public interface MessageReposotiry extends JpaRepository<Message, Integer>{
	
	
	public Long countByIsSeenFalse();

}
