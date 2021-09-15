package cubes.main.controler;


import java.io.FileOutputStream;
import java.security.Principal;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import cubes.main.dao.RoleRepository;
import cubes.main.entity.Blog;
import cubes.main.entity.Category;
import cubes.main.entity.ChangePassword;
import cubes.main.entity.Comment;
import cubes.main.entity.Message;
import cubes.main.entity.Slider;
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
@RequestMapping(value = "/admin")
public class AdminController {
	
	@Autowired
	private CategoryService categoryService;
	@Autowired
	private TagService tagService;
	@Autowired
	private MessageService messageService;
	@Autowired
	private UserService userService;
	@Autowired
	private SliderService sliderService;
	@Autowired
	private CommentService commentService;
	@Autowired
	private BlogService blogService;
	@Autowired
	private RoleRepository roleRepository;
	
	
	@ModelAttribute("currentUser")
	public User getCurentUser(Principal p) {
		User u = userService.findByUsername(p.getName());
		return u;
	}
	
	// ------------------ DASHBOARD -----------------------------------
	
	@RequestMapping(value={"/", "", "dashboard"})
	public String getDashBoardPage(Model model) {
		
		long unreadMesagesCount = messageService.countUnReadMessage();
		model.addAttribute("unreadMesagesCount", unreadMesagesCount);
		return "dashboard";
	}
	
		
	// ---------------------- CATEGORY ----------------------
	
	
	@RequestMapping(value="/category-list")
	public String getCategoryList(Model model) {
		
		List<Category> list = categoryService.FindFirst4ByPriorityOrderByPriority();
		model.addAttribute("categories", list);
		return "category-list";
	}
	
	
	@RequestMapping(value = "/category-form")
	public String getCategoryForm(Model model) {
		
		model.addAttribute("category", new Category());
		
		return "category-form";
	}
	
	@RequestMapping(value="/category-save")
	public String getCategorySave(@ModelAttribute Category category) {
		
		categoryService.save(category);
		return "redirect:category-list";
	}
	
	@RequestMapping(value = "/category-update")
	public String getCategoryUpdate(@RequestParam int id, Model model) {
		
		Category category = categoryService.findById(id);
		model.addAttribute("category", category);
		
		
		return "category-form";
	}
	
	@RequestMapping(value="/category-delete")
	public String getCategoryDelete(@RequestParam int id) {
		
		categoryService.deleteById(id);
		
		
		return "redirect:category-list";
	}
	
	// ---------------------- TAGS ----------------------
	
	
	@GetMapping(value="/tag-list")
	public String getTagList(Model model) {
		
		List<Tag> list = tagService.findAll();
		model.addAttribute("tags", list);
		return "tag-list";
	}
	
	@GetMapping(value = "/tag-form")
	public String getTagForm(Model model) {
		
		model.addAttribute("tag", new Tag());
		
		return "tag-form";
	}
	
	@PostMapping(value="/tag-save")
	public String getTagSave(@ModelAttribute Tag tag) {
		
	
		tagService.save(tag);
		return "redirect:tag-list";
	}
	
	
	@GetMapping(value = "/tag-update")
	public String getTagUpdate(@RequestParam int id, Model model) {
		Tag tag = tagService.findById(id);
		model.addAttribute("tag", tag);
		
		return "tag-form";
	}
	
	@GetMapping(value="/tag-delete")
	public String getTagDelete(@RequestParam int id) {
		
		tagService.deleteById(id);
		
		return "redirect:tag-list";
	}
	
	// ---------------------- MESSAGE ----------------------
	
	@GetMapping(value="/message-list")
	public String getMessageList(Model model) {
		
		List<Message>list = messageService.findAll();
		model.addAttribute("messages", list);

		model.addAttribute("unread", messageService.countUnReadMessage());

		return "message-list";
	}
	
	@GetMapping(value="/message-seen")
	public String getMessageSeenPage(@RequestParam int id) {
		
		Message message = messageService.findById(id);
		message.setIsSeen(true);
		messageService.save(message);
		
		return "redirect:message-list";
	}
	
	// ------------------ **** USER PAGE **** --------------------------
	
	@RequestMapping(value = "user-list")
	public String getUserList(Model model) {
		
				
		model.addAttribute("users",userService.findAll());
		
		return "user-list";
	}
	
	@GetMapping(value = "/user-form")
	public String getUserForm(Model model) {
		
		model.addAttribute("user", new User());
		model.addAttribute("userRoles", roleRepository.findAll());
		
		return "user-form";
	}
	
	@RequestMapping(value = "/user-myupdate")
	public String getUserMyUpdate(Principal principal, Model model) {
		
		User user = userService.findByUsername(principal.getName());
		model.addAttribute("user", user);

		return "user-form-update";
	}
	
	
	@RequestMapping(value="/user-save")
	public String getUserSave(HttpSession session, @ModelAttribute User user, Principal p) {
		
		User u = userService.findByUsername(p.getName());
		if(user.getPassword() == null) {
			
			user.setPassword("");
		}
		
		 if(!user.getFile().isEmpty()) {
		 
			
			user.setImage(user.getFile().getOriginalFilename());
			 
	        // cuvanje slike
	    	
		    String filename=user.getFile().getOriginalFilename(); 
				String path = "C:\\Users\\Korisnik\\Documents\\workspace-spring-tool-suite-4-4.9.0.RELEASE\\MyBlog\\src\\main\\resources\\static\\admin\\slike\\" + filename;


				        try{  
				        byte barr[]=user.getFile().getBytes();  
				        
				        FileOutputStream fos = new FileOutputStream(path);
				        					   
				        fos.write(barr);
				        fos.close();
				        }
				        catch(Exception e){
				        	
				        	System.out.println(e);				        		
				        } 
       
		}
		
	
		user.setEnabled(true);

		user.generateBCryptPassword(); 


		userService.save(user);
		if(u.getRole().equals("ROLE_admin")) {
			return "redirect:user-list";
			
		}
	
			return "redirect:dashboard";

		
	}
	
	@GetMapping(value = "user-enabled")
	public String getUserEnabled(@RequestParam String username) {
		
		User user = userService.findByUsername(username);
		user.setEnabled(!user.getEnabled());
		userService.save(user);
		return "redirect:user-list";
	}
	
	@GetMapping(value = "user-delete")
	public String getUserDelete(@RequestParam String username) {
		
	
		userService.deleteByUsername(username);;
		return "redirect:user-list";
	}
	
	@GetMapping(value = "/user-update")
	public String getUserUpdate(@RequestParam String username, Model model) {
		
		User user = userService.findByUsername(username);
		
		model.addAttribute("user", user);
		model.addAttribute("userRoles", roleRepository.findAll());
		model.addAttribute("isAdmin", true);
		
		
		return "user-form-update";
	}
	
	@RequestMapping(value="/user-change-password")
	public String getChangePasswordPage(Principal principal, Model model) {
		
		model.addAttribute("changePassword", new ChangePassword());
		return "user-form-change-password";
	}
	
	
	@RequestMapping(value="/user-save-change-password")
	public String getChangePasswordSave(@ModelAttribute ChangePassword changePassword, Principal principial, Model model) {
		User user = userService.findByUsername(principial.getName());
		
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		if(!changePassword.getNewPassword().equalsIgnoreCase(changePassword.getConfirmPassword())) {
			// ako nisu isti novi password i confirm novog passworda:
			
			model.addAttribute("message", "Nova lozinka i potvrda nov lozinke se na poklapaju");
			model.addAttribute("changePassword", changePassword);
		}
		
		else if(!encoder.matches(changePassword.getOldPassword(), user.getEncodePasword())) {
			// ako stari pasword nije ok
			model.addAttribute("message", "Stara lozinka nije odgovarajuca!");
			model.addAttribute("changePassword", changePassword);		
			
			
		}
		
		else {
			user.setPassword(changePassword.getNewPassword());
			user.generateBCryptPassword();
			userService.save(user);
			model.addAttribute("message", "Uspesno ste promenili lozinku!");
			model.addAttribute("changePassword", new ChangePassword());		
			
		}
		
		return "user-form-change-password";
	}
	
	
	// ---------------------- SLIDER ----------------------
	
	@GetMapping(value = "slider-list")
	public String getSliderList(Model model) {
		
		model.addAttribute("sliders", sliderService.findAll());
		return "slider-list";
	}
	
	@GetMapping(value = "slider-form")
	public String getSliderForm(Model model) {
		
		model.addAttribute("slider", new Slider());
		return "slider-form";
	}
	
	@PostMapping(value = "slider-save")
	public String getSliderSave(@ModelAttribute Slider slider) {
		
		sliderService.save(slider);
		return "redirect:slider-list";
	}
	
	@GetMapping(value = "slider-enabled")
	public String getSliderEnabled(@RequestParam int id) {
		Slider slider = sliderService.findById(id);
		slider.setEnabled(!slider.getEnabled());
		sliderService.save(slider);

		return "redirect:slider-list";
	}
	
	@GetMapping(value = "slider-delete")
	public String getSliderUpadate(@RequestParam int id) {
		
		sliderService.deleteById(id);
		
		return "redirect:slider-list";
	}
	
	@GetMapping(value = "slider-update")
	public String getSliderDelete(@RequestParam int id, Model model) {
		
		
		Slider slider = sliderService.findById(id);
		model.addAttribute("slider", slider);
		
		
		return "slider-form";
	}
	
	// ---------------------- COMMENT ----------------------
	
	@GetMapping(value="/comment-list")
	public String getCommentList(Model model, Principal p) {
		
		List<Comment>list = commentService.findAll();
		List<Comment>list1 = commentService.findByBlogUserOrderByIdDesc(userService.findByUsername(p.getName()));
		model.addAttribute("comments", list);
		model.addAttribute("comments1", list1);
		
		
		return "comment-list";
	}
	
	@GetMapping(value="/comment-enabled")
	public String getCommentEnabled(@RequestParam int id) {
		
		Comment comment = commentService.findById(id);
		comment.setEnabled(!comment.getEnabled());
		commentService.save(comment);
		
		return "redirect:comment-list";
	}
	
	
	// ---------------------- BLOG ----------------------
	
	@GetMapping(value="/blog-list")
	public String getBlogList(@RequestParam(required = false) String title, @RequestParam(required = false) Integer category, 
			@RequestParam(required = false) String username, @RequestParam(required = false) Boolean enabled, Model model, Principal p) {
		
		if(username!= null && username.length() == 0) {
		username = null;}
		
		if(title!=null && title.length() == 0) {
			title = null;
			}
		
		
		List<Blog>list1 = blogService.filterSearch(title, category, p.getName(), enabled);
				
		List<Category> categories = categoryService.findAll();
		List<Tag> tags = tagService.findAll();
		List<User> users = userService.findAll();
		model.addAttribute("blogs", blogService.filterSearch(title, category, username, enabled));
		model.addAttribute("blogs1", list1);
		model.addAttribute("categories",  categories);
		model.addAttribute("tags",  tags);
		model.addAttribute("users",  users);
		model.addAttribute("userSelected", username);
		model.addAttribute("titleSelected", title);
		model.addAttribute("categorySelected", category);
		model.addAttribute("enabledSelected", enabled);
		

		return "blog-list";
	}
	
	@GetMapping(value = "blog-form")
	public String getBlogForm(Model model, Principal  principial) {
		List<Category> categories = categoryService.findAll();
		List<Tag> tags = tagService.findAll();
		User user = userService.findByUsername(principial.getName());
		model.addAttribute("blog", new Blog());
		model.addAttribute("categories", categories);
		model.addAttribute("tags", tags);
		model.addAttribute("users", user);
		return "blog-form";
	}
	
	@PostMapping(value = "blog-save")
	public String getBlogSave(@Valid @Validated @ModelAttribute Blog blog, BindingResult result, Model model, Principal principial) {
		

		if(result.hasErrors()) {
			model.addAttribute("blog", blog);
			model.addAttribute("categories", categoryService.findAll());
			model.addAttribute("tags", tagService.findAll());
			model.addAttribute("user", userService.findAll());
			
			return "blog-form";
		}
		
		blog.setDateCreated(new Date());
		blog.setUser(userService.findByUsername(principial.getName()));

		Category category = categoryService.findById(blog.getCategory().getId());
		
		List<Tag> tags = new ArrayList<Tag>();
		
		for(Tag tag: blog.getTags()) {
			
			Tag tempTag = tagService.findById(tag.getId());
			tags.add(tempTag);
			
		}

		blog.setCategory(category);
		blog.setTags(tags);

		blogService.save(blog);

		return "redirect:blog-list";
	}
	
	@GetMapping(value="/blog-enabled")
	public String getBlogEnabled(@RequestParam int id) {
		Blog blog = blogService.findById(id);
		blog.setEnabled(!blog.getEnabled());
		blogService.save(blog);
		
		return "redirect:blog-list";
	}
	
	@GetMapping(value="/blog-important")
	public String getBlogImportant(@RequestParam int id) {
		Blog blog = blogService.findById(id);
		blog.setImportant(!blog.getImportant());
		blogService.save(blog);
		
		return "redirect:blog-list";
	}
	
	@GetMapping(value = "blog-delete")
	public String getBlogDelete(@RequestParam int id) {
		
		blogService.deleteById(id);
		
		return "redirect:blog-list";
	}
	
	@GetMapping(value = "blog-update")
	public String getBlogUpdate(@RequestParam int id, Model model) {
		
		model.addAttribute("categories", categoryService.findAll());
		model.addAttribute("tags", tagService.findAll());
		model.addAttribute("user", userService.findAll());
		model.addAttribute("blog", blogService.findById(id));
		
		
		return "blog-form";
	}
}
