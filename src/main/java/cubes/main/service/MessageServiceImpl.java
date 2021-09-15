package cubes.main.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cubes.main.dao.MessageReposotiry;
import cubes.main.entity.Message;

@Service
public class MessageServiceImpl implements MessageService{
	
	@Autowired
	private MessageReposotiry messageReposotiry;

	@Override
	public List<Message> findAll() {
		
		return messageReposotiry.findAll();
	}

	@Override
	public void save(Message message) {
		messageReposotiry.save(message);
		
	}

	@Override
	public Message findById(int id) {
		
		return messageReposotiry.getById(id);
	}

	@Override
	public Long countUnReadMessage() {
		
		return messageReposotiry.countByIsSeenFalse();
	}

}
