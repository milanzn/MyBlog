package cubes.main.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cubes.main.dao.CategoryRepository;
import cubes.main.entity.Category;

@Service
public class CategoryServiceImpl implements CategoryService{
	
	@Autowired
	private CategoryRepository categoryRepository;
	
	@Override
	public List<Category> findAll() {
		
		return categoryRepository.findAll();
	}

	@Override
	public Category findById(int id) {
		
		return categoryRepository.getById(id);
	}

	@Override
	public void save(Category category) {
		
		categoryRepository.save(category);
	}

	@Override
	public void deleteById(int id) {
		
		categoryRepository.deleteById(id);
	}

	@Override
	public List<Category> FindFirst4ByPriorityOrderByPriority() {
		
		return categoryRepository.findFirst4ByOrderByPriorityAsc();
	}



}
