package cubes.main.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cubes.main.dao.TagRepository;
import cubes.main.entity.Tag;
@Service
public class TagServiceImpl implements TagService{
	
	@Autowired
	private TagRepository tagRepository;

	@Override
	public List<Tag> findAll() {
		
		return tagRepository.findAll();
	}

	@Override
	public Tag findById(int id) {
		
		return tagRepository.getById(id);
	}

	@Override
	public void save(Tag tag) {
		
		tagRepository.save(tag);
		
		
	}

	@Override
	public void deleteById(int id) {
		tagRepository.deleteById(id);
		
	}

	@Override
	public List<Tag> findAllByBlogs() {
		
		return tagRepository.findTaggg();
	}

}
