package cubes.main.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import cubes.main.dao.BlogRepository;
import cubes.main.entity.Blog;
import cubes.main.entity.Tag;
import cubes.main.entity.User;
@Service
public class BlogServiceImpl implements BlogService {
	
	@Autowired
	private BlogRepository blogRepository;
	
	@Override
	public List<Blog> findAll() {
		
		return blogRepository.findAll();
	}

	@Override
	public Blog findById(int id) {
		
		return blogRepository.getById(id);
	}

	@Override
	public void save(Blog blog) {
		
		blogRepository.save(blog);
	}

	@Override
	public void deleteById(int id) {
		
		blogRepository.deleteById(id);
	}

	@Override
	public List<Blog> findFirst3ByOrderByTitleAsc() {
		
		return blogRepository.findFirst3ByOrderByTitleDesc();
	}

	@Override
	public List<Blog> findTop3Important() {
		
		return  blogRepository.findFirst3ByEnabledTrueAndImportantTrueOrderByIdDesc();
	}

	@Override
	public List<Blog> findTop3() {
		
		return blogRepository.findFirst3ByEnabledTrueOrderByIdDesc();
	}

	@Override
	public List<Blog> findTop3Views() {
		
		return blogRepository.findFirst3ByEnabledTrueOrderByViewsDesc();
	}
	
	@Override
	public Page<Blog> findPaginated(int pageNo, int pageSize) {
		Pageable pageable = PageRequest.of(pageNo - 1, pageSize);
		return blogRepository.findAllByEnabledTrueOrderByIdDesc(pageable);
	}

	@Override
	public Page<Blog> findAllByCategoryId(int id, int pageNo, int pageSize) {
		Pageable pageable = PageRequest.of(pageNo - 1, pageSize);
		return blogRepository.findAllByCategoryIdAndEnabledTrueOrderByIdDesc(id, pageable);
	}

	@Override
	public Page<Blog> findAllByUser(User user, int pageNo, int pageSize) {
		Pageable pageable = PageRequest.of(pageNo - 1, pageSize);
		return blogRepository.findAllByUserAndEnabledTrueOrderByIdDesc(user, pageable);
	}

	@Override
	public Page<Blog> findAllByTag(Tag tag, int pageNo, int pageSize) {
		Pageable pageable = PageRequest.of(pageNo - 1, pageSize);
		return blogRepository.findAllByTagsAndEnabledTrueOrderByIdDesc(tag, pageable);
	}

	@Override
	public List<Blog> findTop12() {
		
		return blogRepository.findFirst12ByEnabledTrueOrderByIdDesc();
	}

	@Override
	public Blog findNext(int id) {
		
		return blogRepository.findFirst1ByEnabledTrueAndIdGreaterThan(id);
	}

	@Override
	public Blog findPrevious(int id) {
		
		return blogRepository.findFirst1ByEnabledTrueAndIdLessThanOrderByIdDesc(id);
	}

	@Override
	public Page<Blog> searchBlog(String text, int pageNo, int pageSize) {
		
		Pageable pageable = PageRequest.of(pageNo - 1, pageSize);
		
		return blogRepository.findAllByEnabledTrueAndTitleLikeOrDescriptionLikeOrPostLikeOrderByIdDesc
		("%" + text + "%", "%" + text + "%", "%" + text + "%", pageable);
		
		
	}

	@Override
	public List<Blog> findAllByUser(User user) {
		
		return blogRepository.findAllByUserOrderByIdDesc(user);
	}

	@Override
	public List<Blog> filterSearch(String title, Integer category, String username, Boolean enabled) {
		
		return blogRepository.
				findBlogByCategoryIdAndUserUsernameAndEnabled(title, category, username, enabled);
	}


	



}
