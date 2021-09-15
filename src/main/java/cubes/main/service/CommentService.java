package cubes.main.service;

import java.util.List;

import cubes.main.entity.Comment;
import cubes.main.entity.User;


public interface CommentService {
	
	public List<Comment> findAll();
	public void save(Comment comment);
	public Comment findById(int id);
	public List<Comment> findByBlogUserOrderByIdDesc(User user);

}
