package cubes.main.entity;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.web.multipart.MultipartFile;



@Entity
@Table(name="users")
public class User {

	@Id
	@Column
	private String username;
	@Column
	private String password;
	@Column
	private boolean enabled;
	@Column
	private String name;
	@Column
	private String surname;
	@Column
	private String image;
	
	@JoinTable(name="authorities", joinColumns = @JoinColumn(name="username"), inverseJoinColumns = @JoinColumn(name="authority"))
	@ManyToMany(cascade = {CascadeType.DETACH, CascadeType.MERGE, CascadeType.PERSIST, CascadeType.REFRESH}, fetch = FetchType.EAGER)
	private List<Role> roles;

	@Transient
	private MultipartFile file;
	
	public User() {
		
	}

	public User(String username, String password, boolean enabled) {
		super();
		this.username = username;
		this.password = password;
		this.enabled = enabled;
	}

	public boolean getEnabled() {
		return enabled;
	}

	public void setEnabled(boolean enabled) {
		this.enabled = enabled;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}
	
	public String getEncodePasword() {
		return password.replace("{bcrypt}","");
	}

	public void setPassword(String password) {
		
		this.password = password;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getSurname() {
		return surname;
	}

	public void setSurname(String surname) {
		this.surname = surname;
	}

	public List<Role> getRoles() {
		return roles;
	}
	
	public Role getRole() {
		return roles.get(0);
	}

	public void setRoles(List<Role> roles) {
		this.roles = roles;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}
	


	public MultipartFile getFile() {
		return file;
	}

	public void setFile(MultipartFile file) {
		this.file = file;
	}
	
	public String getSeoTitle() {
		return name.replace(" ", "-").toLowerCase() + "-" + surname.replace(" ", "-").toLowerCase();
	}

	public void generateBCryptPassword() {
		if(!getPassword().contains("{bcrypt}")) {
		String password = new BCryptPasswordEncoder().encode(getPassword());
		setPassword("{bcrypt}"+password);
		}

	}


}
