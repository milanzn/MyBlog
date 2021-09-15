package cubes.main.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import cubes.main.entity.Tag;

public interface TagRepository  extends JpaRepository<Tag, Integer> {
	
	@Query("SELECT t FROM Tag t ORDER BY t.blogs.size DESC")
	public List<Tag> findTaggg();

}
