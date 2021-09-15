package cubes.main.service;

import java.util.List;

import cubes.main.entity.Category;



public interface CategoryService {

	
	public List<Category> findAll(); 
	
	public Category findById(int id);
	
	public void save(Category category);
	
	public void deleteById(int id);
	
	public  List<Category> FindFirst4ByPriorityOrderByPriority();

}
