package cubes.main.dao;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import cubes.main.entity.Blog;
import cubes.main.entity.Tag;
import cubes.main.entity.User;

public interface BlogRepository extends JpaRepository<Blog, Integer>{
		
	List<Blog>findFirst3ByOrderByTitleDesc();
	List<Blog>findFirst5ByOrderByTitleDesc();
	
	// pronalazenje liste blogova za stranicu blog:
	
	public Page<Blog>findAllByEnabledTrueOrderByIdDesc(Pageable pageable);
	
	// pronalazenje prva 3 najnovija bloga
	
	public List<Blog>findFirst3ByEnabledTrueOrderByIdDesc();
	
	// pronalazenje prvih 12 najnovijih blogova
	
	public List<Blog>findFirst12ByEnabledTrueOrderByIdDesc();
	
	// pronalazenje prva 3 important bloga
	
	public List<Blog>findFirst3ByEnabledTrueAndImportantTrueOrderByIdDesc();
	
	// pronalazenje prva 3  bloga sa najvise komentara 
	
	public List<Blog>findFirst3ByEnabledTrueOrderByViewsDesc();
	
	// pronalazenje svih blogova po id Kategorije
	
	public Page <Blog>findAllByCategoryIdAndEnabledTrueOrderByIdDesc(int id, Pageable pageable);
	
	// pronalazenje svih blogova po username PAGE
	
	public Page<Blog>findAllByUserAndEnabledTrueOrderByIdDesc(User user, Pageable pageable);
	
	// pronalazenje svih blogova po username LIST
	
		public List<Blog>findAllByUserOrderByIdDesc(User user);
	
	//pronalazenje svih blogova po Tagovima
	
	public Page<Blog> findAllByTagsAndEnabledTrueOrderByIdDesc(Tag tag, Pageable pageable);
	
	// pronalazenje prvog sledeceg // OVO IZBRISATI, PROVERITI DA LI JE KORISCENA I U SERVICE LATYERU!!!
	
	public List<Blog>findFirst2ByEnabledTrueAndIdOrderByIdAsc(int id);
	
	
	// pronalazenje prethodnog Bloga
	
	public Blog findFirst1ByEnabledTrueAndIdLessThanOrderByIdDesc(int id);
	
	
	// pronalazenje sledeceg Bloga, tj NEXT
	
		public Blog findFirst1ByEnabledTrueAndIdGreaterThan(int id);
	
	// metoda za search blog
		
		 @Query("select b from Blog b where b.title like ?1 OR b.description like ?1 OR b.post like ?1 ORDER BY b.id Desc")
		public Page<Blog>findSearch11(String text, Pageable pageable);
	
	public Page<Blog>findAllByEnabledTrueAndTitleLikeOrDescriptionLikeOrPostLikeOrderByIdDesc(String text, String text1, String text2, Pageable pageable);
	
	
	public List<Blog>findAllByEnabledTrueAndTitleLikeOrDescriptionLikeOrPostLikeOrderByIdDesc(String text, String text1, String text2);
	
	// metoda za filter na admin delu:
	
	
	@Query("SELECT b FROM Blog b WHERE (:title is null or b.title LIKE %:title%)  and " + 
	"(:category is null or b.category.id = : category) and " +		
	"(:username is null" + " or b.user.username = : username) and " +
	"(:enabled is null" + " or b.enabled = : enabled) " +
	"ORDER BY b.id Desc")

	public List<Blog>findBlogByCategoryIdAndUserUsernameAndEnabled( @Param ("title") String title, 
			@Param ("category") Integer category, 
			@Param ("username") String username,
			@Param ("enabled") Boolean enabled);



}	

	


