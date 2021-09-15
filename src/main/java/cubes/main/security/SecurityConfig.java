package cubes.main.security;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;

@Configuration
@EnableWebSecurity
public class SecurityConfig extends WebSecurityConfigurerAdapter{
	
	
	@Autowired
	private DataSource myDataSource;

	
	@Override
	protected void configure(AuthenticationManagerBuilder auth) throws Exception {
	
		
		auth.jdbcAuthentication().dataSource(myDataSource);
	}
	
	
	@Override
	protected void configure(HttpSecurity http) throws Exception {
		
		http.authorizeRequests()
		// .andMatchers("/").permitAll
		.antMatchers("/").permitAll()
		.antMatchers("/admin/dist/**").permitAll()
		.antMatchers("/admin/plugins/**").permitAll()
		// .antMatchers("/api/**").permitAll()
		
	
		.antMatchers("/admin/category-list").hasRole("admin")
		.antMatchers("/admin/category-form").hasRole("admin")
		.antMatchers("/admin/message-list").hasRole("admin")
		.antMatchers("/admin/message-form").hasRole("admin")
		.antMatchers("/admin/tag-list").hasRole("admin")
		.antMatchers("/admin/tag-form").hasRole("admin")
		
		
		.antMatchers("/admin/user-list").hasRole("admin")
		.antMatchers("/admin/user-form").hasRole("admin")
		
		.antMatchers("/admin/user-update").hasRole("admin")

		.antMatchers("/admin/**").hasAnyRole("admin, blogger")
		.antMatchers("${pageContext.request.contextPath}/resources/admin/slike/**").hasAnyRole("admin, blogger")
		.and().formLogin().loginPage("/login-page").
		loginProcessingUrl("/authenticateTheUser").defaultSuccessUrl("/admin/").permitAll();
		
	
	
	
	}


}
