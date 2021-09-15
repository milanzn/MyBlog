package cubes.main.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cubes.main.dao.CommentRepository;
import cubes.main.entity.Comment;
import cubes.main.entity.User;

@Service
public class CommentServiceImpl implements CommentService{
	
	@Autowired
	private CommentRepository commentRepository;

	@Override
	public List<Comment> findAll() {
		
		return commentRepository.findAllByOrderByIdDesc();
	}

	@Override
	public void save(Comment comment) {
		commentRepository.save(comment);
		
	}

	@Override
	public Comment findById(int id) {
		
		return commentRepository.getById(id);
	}

	@Override
	public List<Comment> findByBlogUserOrderByIdDesc(User user) {
		
		return commentRepository.findByBlogUserOrderByIdDesc(user);
	}

}
