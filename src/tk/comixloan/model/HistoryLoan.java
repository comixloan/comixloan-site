package tk.comixloan.model;

import java.util.Date;
import java.util.LinkedList;
import java.util.List;

import javax.persistence.*;

@Entity
public class HistoryLoan {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	
	@Column(nullable = false)
	@Temporal(TemporalType.TIMESTAMP)
	private Date dateStart;
	
	@Column(nullable = false)
	@Temporal(TemporalType.TIMESTAMP)
	private Date dateEnd;
	
	@Column(nullable = false)
	@ManyToMany(mappedBy = "loanHistory")
	private List<Volume> volumes;
	
	@ManyToOne
	private User user;
	
	public HistoryLoan(){}

	public HistoryLoan(Date dateStart, Date dateEnd, List<Volume> volumes, User user) {
		super();
		this.dateStart = dateStart;
		this.dateEnd = dateEnd;
		this.volumes = volumes;
		this.user = user;
	}
	
	public HistoryLoan(Loan loan){
		this.user = loan.getUser();
		this.dateStart = loan.getStartDate();
		this.dateEnd = new Date();
		this.volumes = new LinkedList<Volume>(loan.getVolumes());
	}
	
	public HistoryLoan(Date dateStart, List<Volume> volumes, User user) {
		super();
		this.dateStart = dateStart;
		this.dateEnd = new Date();
		this.volumes = volumes;
		this.user = user;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Date getDateStart() {
		return dateStart;
	}

	public void setDateStart(Date dateStart) {
		this.dateStart = dateStart;
	}

	public Date getDateEnd() {
		return dateEnd;
	}

	public void setDateEnd(Date dateEnd) {
		this.dateEnd = dateEnd;
	}

	public List<Volume> getVolumes() {
		return volumes;
	}

	public void setVolumes(List<Volume> volumes) {
		this.volumes = volumes;
	}
	
	public User getUser() {
		return user;
	}
	
	public void setUser(User user) {
		this.user = user;
	}
}
