package tk.comixloan.model;

import java.util.Date;
import java.util.List;

import javax.persistence.*;

@Entity
public class Loan {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	
	@OneToMany(fetch=FetchType.EAGER, mappedBy = "loan")
	private List<Volume> volumes;
	
	@Column(nullable = false)
	@Temporal(TemporalType.TIMESTAMP)
	private Date startDate;
	
	@ManyToOne
	private User user;
	
	public Loan(){}

	public Loan(List<Volume> volumes, Date startDate, User user) {
		super();
		this.volumes = volumes;
		this.startDate = startDate;
		this.user = user;
	}
	
	public Loan(List<Volume> volumes, User user) {
		super();
		this.volumes = volumes;
		this.startDate = new Date();
		this.user = user;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public List<Volume> getVolumes() {
		return volumes;
	}

	public void setVolumes(List<Volume> volumes) {
		this.volumes = volumes;
	}

	public Date getStartDate() {
		return startDate;
	}

	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}
	
	public User getUser() {
		return user;
	}
	
	public void setUser(User user) {
		this.user = user;
	}
	

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((id == null) ? 0 : id.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Loan other = (Loan) obj;
		if (id == null) {
			if (other.id != null)
				return false;
		} else if (!id.equals(other.id))
			return false;
		return true;
	}

	
}
