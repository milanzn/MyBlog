package cubes.main.service;

import java.util.List;


import cubes.main.entity.Message;

public interface MessageService {
	
	public List<Message> findAll();
	public void save(Message message);
	public Message findById(int id);
	public Long countUnReadMessage();
}
