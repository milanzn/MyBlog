package cubes.main.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import cubes.main.entity.Comment;
import cubes.main.entity.User;

public interface CommentRepository extends JpaRepository<Comment, Integer> {
	
	
	
	public List<Comment> findAllByOrderByIdDesc();
	public List<Comment> findByBlogUserOrderByIdDesc(User user);
	
}
