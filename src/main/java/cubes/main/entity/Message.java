package cubes.main.entity;


import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "messages")
public class Message {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column
	private int id;
	@Column
	private String name;
	@Column
	private String email;
	@Column
	private String poruka;
	@Column
	private boolean isSeen;
	
	public Message() {
		
	}

	public Message(String message) {
		super();
		this.poruka = message;
	}



	public Message(String name, String email, String message, boolean isSeen) {
		super();
		this.name = name;
		this.email = email;
		this.poruka = message;
		this.isSeen = isSeen;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPoruka() {
		return poruka;
	}

	public void setPoruka(String message) {
		this.poruka = message;
	}

	public boolean getIsSeen() {
		return isSeen;
	}

	public void setIsSeen(boolean isSeen) {
		this.isSeen = isSeen;
	}
	@Override
	public String toString() {
		
		return poruka;
	}
}
