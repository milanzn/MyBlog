package cubes.main.entity;


import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.Size;

@Entity
@Table(name = "blogs")
public class Blog {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column
	private int id;
	@Column
	@Size(min=20, max =255, message = "ime mora da ima min 20 i max 255 karaktera")
	private String title;
	@Column
	private String image;
	@Column
	private int views;
	@Column
	@Size(min=50, max =500, message = "ime mora da ima min 50 i max 500 karaktera")
	private String description;
	@Column
	private String post;
	@Column
	private boolean enabled;
	@Column
	private boolean important;
	@Column(name = "date_created",nullable = false, updatable = false)
	private Date dateCreated;
	@ManyToOne(cascade = {CascadeType.DETACH, CascadeType.MERGE, CascadeType.PERSIST, CascadeType.REFRESH}, fetch = FetchType.EAGER)
	@JoinColumn(name = "username")
	private User user;
	@ManyToOne(cascade = {CascadeType.DETACH, CascadeType.MERGE, CascadeType.PERSIST, CascadeType.REFRESH})
	@JoinColumn(name = "category_id")
	private Category category;
	@ManyToMany(cascade = {CascadeType.DETACH, CascadeType.MERGE, CascadeType.PERSIST, CascadeType.REFRESH})
	@JoinTable(name = "blogs_tags", joinColumns = @JoinColumn(name = "blog_id"), inverseJoinColumns = @JoinColumn(name = "tag_id"))
	private List<Tag> tags;
	
	@OneToMany(cascade = {CascadeType.DETACH, CascadeType.PERSIST, CascadeType.REFRESH, CascadeType.REMOVE})
	@JoinColumn(name = "blog_id")
	private List<Comment>comments;
	
	
	public Blog() {
		
	}

	public Blog(Date dateCreated) {
		super();
		this.dateCreated = dateCreated;
	}



	public Blog(int id, String title, String image, int views, String description, String post, boolean enabled,
			boolean important, Date dateCreated, User user, Category category, List<Tag> tags, List<Comment> comments) {
		super();
		this.id = id;
		this.title = title;
		this.image = image;
		this.views = views;
		this.description = description;
		this.post = post;
		this.enabled = enabled;
		this.important = important;
		this.dateCreated = dateCreated;
		this.user = user;
		this.category = category;
		this.tags = tags;
		this.comments = comments;
	}

	public Blog(String title, String image, int views, String description, Date dateCreated, User user,
			Category category, List<Tag> tags, List<Comment> comments) {
		super();
		this.title = title;
		this.image = image;
		this.views = views;
		this.description = description;
		this.dateCreated = dateCreated;
		this.user = user;
		this.category = category;
		this.tags = tags;
		this.comments = comments;
	}


	public int getId() {
		return id;
	}


	public void setId(int id) {
		this.id = id;
	}


	public String getTitle() {
		return title;
	}


	public void setTitle(String title) {
		this.title = title;
	}


	public String getImage() {
		return image;
	}


	public void setImage(String image) {
		this.image = image;
	}


	public int getViews() {
		return views;
	}


	public void setViews(int views) {
		this.views = views;
	}


	public String getDescription() {
		return description;
	}


	public void setDescription(String description) {
		this.description = description;
	}


	public Date getDateCreated() {
		return dateCreated;
	}


	public void setDateCreated(Date dateCreated) {
		this.dateCreated = dateCreated;
	}


	public User getUser() {
		return user;
	}


	public void setUser(User user) {
		this.user = user;
	}


	public Category getCategory() {
		return category;
	}


	public void setCategory(Category category) {
		this.category = category;
	}


	public List<Tag> getTags() {
		return tags;
	}


	public void setTags(List<Tag> tags) {
		this.tags = tags;
	}


	public List<Comment> getComments() {
		return comments;
	}


	public void setComments(List<Comment> comments) {
		this.comments = comments;
	}
	
	
	public String getPost() {
		return post;
	}


	public void setPost(String post) {
		this.post = post;
	}


	public boolean getEnabled() {
		return enabled;
	}


	public void setEnabled(boolean enabled) {
		this.enabled = enabled;
	}


	public boolean getImportant() {
		return important;
	}


	public void setImportant(boolean important) {
		this.important = important;
	}

	public String getSeoTitle() {
		
		return title.replace(" ", "-").toLowerCase();
	}
	
	public String getTimeAgo() {
		
		long timeAgo = new Date().getTime() - dateCreated.getTime();
		long day = 86400000;
		String tAgo = "";
		int tempInt;
		
		if (timeAgo <3600000) {
			tempInt = (int) (timeAgo / 60000); 
			tAgo = tempInt + " minuties ago";
		}
		else if(timeAgo < 86400000) {
			tempInt = (int) (timeAgo / 3600000); 
			tAgo = tempInt + " hours ago";
		}
		else if (timeAgo < (day*30)) {
			tempInt = (int) (timeAgo / 86400000); 
			tAgo = tempInt + " days ago";
		}
		else if (timeAgo < (day*365)) {
			tempInt = (int) (timeAgo / (day * 30)); 
			tAgo = tempInt + " months ago";
		}
		
		else  {
			tempInt = (int) (timeAgo / (day * 365)); 
			tAgo = tempInt + " years ago";
		}
		
		return tAgo;
	}
	
	public int getNumberComments() {
		int counter = 0;
		for(Comment c: comments) {
			
			if(c.getEnabled()) {
				
				counter ++;
			}
			
		}
		
		return counter;
	}
	
	
	@Override
	public String toString() {
		
		return id + "-" + title + "-" + image;
	}
}
