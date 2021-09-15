package cubes.main.service;

import java.util.List;

import org.springframework.data.domain.Page;

import cubes.main.entity.Blog;
import cubes.main.entity.Tag;
import cubes.main.entity.User;


public interface BlogService {
	
	public List<Blog> findAll(); 
	
	public Blog findById(int id);
	
	public void save(Blog blog);
	
	public void deleteById(int id);
	
	
	public Page <Blog>findPaginated(int pageNo, int pageSize);
	public List<Blog>findFirst3ByOrderByTitleAsc();
	public List<Blog>findTop12();
	public List<Blog>findTop3();
	public List<Blog>findTop3Important();
	public List<Blog>findTop3Views();
	public Page<Blog>findAllByCategoryId(int id, int pageNo, int pageSize);
	public Page<Blog>findAllByUser(User user, int pageNo, int pageSize);
	public List<Blog>findAllByUser(User user);
	public Page<Blog> findAllByTag(Tag tag, int pageNo, int pageSize);
	public Blog findNext(int id);
	public Blog findPrevious(int id);
	public Page<Blog> searchBlog(String text, int pageNo, int pageSize);
	
	
	public List<Blog>filterSearch(String title, Integer category, String username, Boolean enabled);


}
