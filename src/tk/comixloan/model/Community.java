package tk.comixloan.model;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.OneToOne;

@Entity
public class Community {
	

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Id id;
	
	@Column(nullable=false)
	private String name;
	
	@Column(nullable=false)
	private String description;

    @ManyToMany(mappedBy = "communities")
    private List<User> users;
    
    @OneToOne
    private User admin;

	public Community(){}
    
	public Community(String name, String description) {
		super();
		this.name = name;
		this.description = description;
	}
	
	
	public Id getId() {
		return id;
	}

	public void setId(Id id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	} 
	
	
}
