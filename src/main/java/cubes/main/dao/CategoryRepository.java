package cubes.main.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import cubes.main.entity.Category;

public interface CategoryRepository extends JpaRepository<Category, Integer>{
	
	
	public List<Category>findFirst4ByOrderByPriorityAsc();
	

}
