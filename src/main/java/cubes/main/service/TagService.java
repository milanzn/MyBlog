package cubes.main.service;

import java.util.List;


import cubes.main.entity.Tag;

public interface TagService {
	
	public List<Tag> findAll(); 
	
	public Tag findById(int id);
	
	public void save(Tag tag);
	
	public void deleteById(int id);
	
	public List<Tag> findAllByBlogs(); 
	

}
