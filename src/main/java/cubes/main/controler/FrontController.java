package cubes.main.controler;


import java.util.Date;
import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import cubes.main.entity.Blog;
import cubes.main.entity.Comment;
import cubes.main.entity.Message;
import cubes.main.entity.Tag;
import cubes.main.entity.User;
import cubes.main.service.BlogService;
import cubes.main.service.CategoryService;
import cubes.main.service.CommentService;
import cubes.main.service.MessageService;
import cubes.main.service.SliderService;
import cubes.main.service.TagService;
import cubes.main.service.UserService;

@Controller
public class FrontController {
	
	@Autowired
	private SliderService sliderService;
	@Autowired
	private BlogService blogService;
	@Autowired
	private MessageService messageService;
	@Autowired
	private CategoryService categoryService;
	@Autowired
	private UserService userService;
	@Autowired
	private TagService tagService;
	@Autowired
	private CommentService commentService;
	private int pageSize = 2;

	
	//------------------------- INDEX -------------------------
	
	@GetMapping(value = "/index")
	public String getIndexPage(Model model) {
		
		model.addAttribute("sliders", sliderService.findAllByEnbledOrderByPriority());
		model.addAttribute("blog3", blogService.findTop3());
		model.addAttribute("blogs", blogService.findTop3Important());
		model.addAttribute("blog12", blogService.findTop12());
		model.addAttribute("categories", categoryService.FindFirst4ByPriorityOrderByPriority());
		
		return "index";
	}
	
	
	//------------------------- BLOGS ---------------------------


	@GetMapping(value ={"/blog", "/blog/{pageNo}"})
	public String getPaginated(@PathVariable(required = false) Integer pageNo, Model model) {
		
		int pageSizeBlogs = 12;
		if(pageNo == null) {
			
			pageNo = 1; 
		}

		Page<Blog> page = blogService.findPaginated(pageNo, pageSizeBlogs);
		
		
		List<Blog> list = page.getContent();
		model.addAttribute("curentPage", pageNo);
		model.addAttribute("totalPage", page.getTotalPages());
		
		model.addAttribute("blog3", blogService.findTop3Important());
		model.addAttribute("blog12", list);
		model.addAttribute("blog33", blogService.findTop3Views());
		model.addAttribute("categories", categoryService.FindFirst4ByPriorityOrderByPriority());
		model.addAttribute("category5", categoryService.FindFirst4ByPriorityOrderByPriority());
		model.addAttribute("tags", tagService.findAllByBlogs());
		return "blogs";
	}
	
	
	
	@GetMapping(value = {"/blog-category/{title}/{id}", "/blog-category/{title}/{id}/{pageNo}"})
	public String getBlogsPageByCategory(@PathVariable int id, @PathVariable(required = false) Integer pageNo, Model model) {
		
		if(pageNo == null) {
			
			pageNo = 1; 
		}

		Page<Blog> page = blogService.findAllByCategoryId(id, pageNo, pageSize);
		
		List<Blog> list = page.getContent();

		model.addAttribute("curentPage", pageNo);
		model.addAttribute("totalPage", page.getTotalPages());
		
		model.addAttribute("blog3", blogService.findTop3Important());
		model.addAttribute("blog12", list);
		model.addAttribute("blog33", blogService.findTop3Views());
		model.addAttribute("categories", categoryService.FindFirst4ByPriorityOrderByPriority());
		model.addAttribute("category5", categoryService.FindFirst4ByPriorityOrderByPriority());
		model.addAttribute("tags", tagService.findAllByBlogs());
		model.addAttribute("HeadTitle", categoryService.findById(id).getName());
		model.addAttribute("categoryId", id);
		model.addAttribute("categorySeoTitle", categoryService.findById(id).getSeoTitle());
		return "blog-category";
	}
	
	@GetMapping(value = {"/blog-author/{title}/{username}", "/blog-author/{title}/{username}/{pageNo}"})
	public String getBlogsPageByUsername(@PathVariable String username, @PathVariable(required = false) Integer pageNo, Model model) {
		
		if(pageNo == null) {
			
			pageNo = 1; 
		}

		User user = userService.findByUsername(username);
		Page<Blog> page = blogService.findAllByUser(user, pageNo, pageSize);

		List<Blog> list = page.getContent();

		model.addAttribute("curentPage", pageNo);
		model.addAttribute("totalPage", page.getTotalPages());
			
		model.addAttribute("blog3", blogService.findTop3Important());
		model.addAttribute("blog12", list);
		model.addAttribute("blog33", blogService.findTop3Views());
		model.addAttribute("categories", categoryService.FindFirst4ByPriorityOrderByPriority());
		model.addAttribute("category5", categoryService.FindFirst4ByPriorityOrderByPriority());
		model.addAttribute("tags", tagService.findAllByBlogs());
		model.addAttribute("HeadTitle", user.getName() + " " + user.getSurname());
		model.addAttribute("username", username);
		model.addAttribute("userSeoTitle", user.getSeoTitle());
		
		return "blog-user";
	}
	
	@GetMapping(value = {"/blog-tag/{title}/{id}", "/blog-tag/{title}/{id}/{pageNo}"})
	public String getBlogsPageByTag(@PathVariable int id, @PathVariable(required = false) Integer pageNo, Model model) {
		
		if(pageNo == null) {
			
			pageNo = 1; 
		}

		Tag tag = tagService.findById(id);
		
		Page<Blog> page = blogService.findAllByTag(tag, pageNo, pageSize);

		List<Blog> list = page.getContent();
		model.addAttribute("curentPage", pageNo);
		model.addAttribute("totalPage", page.getTotalPages());
		
		model.addAttribute("blog3", blogService.findTop3Important());
		model.addAttribute("blog12", list);
		model.addAttribute("blog33", blogService.findTop3Views());
		model.addAttribute("categories", categoryService.FindFirst4ByPriorityOrderByPriority());
		model.addAttribute("category5", categoryService.FindFirst4ByPriorityOrderByPriority());
		model.addAttribute("tags", tagService.findAllByBlogs());
		model.addAttribute("HeadTitle", tag.getName());
		model.addAttribute("tagId", id);
		model.addAttribute("tagSeoTitle", tag.getSeoTitle());
		
		return "blog-tag";
	}
	
	@GetMapping(value = {"/blog-search/", "/blog-search/{pageNo}"})
	public String getSearchBlog(@RequestParam String text, @PathVariable(required = false) Integer pageNo, Model model) {
		
		if(pageNo == null) {
			
			pageNo = 1; 
		}

		Page<Blog> page = blogService.searchBlog(text, pageNo, pageSize);
		List<Blog> list = page.getContent();
		model.addAttribute("curentPage", pageNo);
		model.addAttribute("totalPage", page.getTotalPages());
		
		model.addAttribute("blog3", blogService.findTop3Important());
		
		model.addAttribute("blogSearch", list);
		
		
		model.addAttribute("blog33", blogService.findTop3Views());
		model.addAttribute("categories", categoryService.FindFirst4ByPriorityOrderByPriority());
		model.addAttribute("category5", categoryService.FindFirst4ByPriorityOrderByPriority());
		model.addAttribute("tags", tagService.findAllByBlogs());
		model.addAttribute("HeadTitle", text);
		model.addAttribute("SearchTitle", text);
		

		
		return "blog-search";
	}
	
	//------------------------- BLOG-POST -------------------------
	
	@GetMapping(value = "/blog-post/{title}/{id}")
	public String getBlogPostPage(@PathVariable int id, Model model) {
		
		Blog b = blogService.findById(id);
		b.setViews(b.getViews() + 1);
		blogService.save(b);
		
		Blog previousBlog = blogService.findPrevious(id);
		
		if (previousBlog != null) {
			
			model.addAttribute("prevBlog", previousBlog);
		}
		else {
			
			model.addAttribute("prevBlog",b);
		}
		
		
		Blog nextBlog = blogService.findNext(id);
		
		if (nextBlog != null) {
			
			model.addAttribute("nextBlog", nextBlog);
		}
		else {
			
			model.addAttribute("nextBlog",b);
		}
		
		
	
		model.addAttribute("myBlog", b);
		model.addAttribute("blog3", blogService.findTop3Important());
		model.addAttribute("blog33", blogService.findTop3Views());
		model.addAttribute("categories", categoryService.FindFirst4ByPriorityOrderByPriority());
		model.addAttribute("category5", categoryService.FindFirst4ByPriorityOrderByPriority());
		model.addAttribute("tags", tagService.findAllByBlogs());
		model.addAttribute("comm", new Comment());

		return "blog-post";
	}
		
	
	//------------------------- COMMENT -------------------------
	

	
	@PostMapping(value = "/comment-save/{title}/{id}")
	public String getCommentSave(@PathVariable int id, @PathVariable String title, @ModelAttribute Comment comment,  Model model) {
	
		Blog blog = blogService.findById(id);
		comment.setBlog(blog);
		comment.setDateCreated(new Date());
		comment.setEnabled(true);
		commentService.save(comment);
	
		return "redirect:/blog-post/" + title + "/" + id;
	}
	
	
	//------------------------- CONTACT -------------------------
	
	@RequestMapping(value = "/contact")
	public String getContactPage(Model model) {
		
		model.addAttribute("m", new Message());
		model.addAttribute("blog3", blogService.findTop3Important());
		model.addAttribute("blog33", blogService.findTop3Views());
		model.addAttribute("categories", categoryService.FindFirst4ByPriorityOrderByPriority());
		return "contact";
	}
	
	@PostMapping(value = "/contact-save")
	public String getContactSavePage(@ModelAttribute Message message) {
		
		messageService.save(message);
		return "redirect:contact";
	}
	

}
