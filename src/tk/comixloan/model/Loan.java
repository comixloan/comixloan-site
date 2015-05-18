package tk.comixloan.model;

import java.util.Date;
import java.util.List;

import javax.persistence.*;

@Entity
public class Loan {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Id id;
	
	@OneToMany
	private List<Volume> volumes;
	
	@Column(nullable = false)
	@Temporal(TemporalType.TIMESTAMP)
	private Date startDate;

	public Loan(List<Volume> volumes, Date startDate) {
		super();
		this.volumes = volumes;
		this.startDate = startDate;
	}

	public Id getId() {
		return id;
	}

	public void setId(Id id) {
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
	
	
	
}
