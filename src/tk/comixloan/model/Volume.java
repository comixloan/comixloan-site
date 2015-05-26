package tk.comixloan.model;

import java.util.List;

import javax.persistence.*;

@Entity
public class Volume {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	
	@Column(nullable = false)
	private Long number;
	
	@Column(nullable = false)
	private Double price;
	
	@Column(nullable = false)
	@ManyToOne
	private Serie serie;
	
	@Column(nullable = true, length = 2000)
	private String description;
	
	@ManyToMany
	private List<HistoryLoan> loanHistory;
	
	@ManyToOne
	private Loan loan;
	
	@ManyToOne
	private User user;
	
	public Volume() {}

	public Volume(Long vol, Double price, Serie serie) {
		super();
		this.number = vol;
		this.price = price;
		this.serie = serie;
		this.description = null;
	}
	
	public Volume(Long vol, Double price, Serie serie, String description, User user) {
		super();
		this.number = vol;
		this.price = price;
		this.serie = serie;
		this.description = description;
		this.user = user;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Long getNumber() {
		return number;
	}

	public void setNumber(Long vol) {
		this.number = vol;
	}

	public Double getPrice() {
		return price;
	}

	public void setPrice(Double price) {
		this.price = price;
	}

	public Serie getSerie() {
		return serie;
	}

	public void setSerie(Serie serie) {
		this.serie = serie;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}
	
	public Loan getLoan() {
		return loan;
	}
	
	public void setLoan(Loan loan) {
		this.loan = loan;
	}
	
	public List<HistoryLoan> getLoanHistory() {
		return loanHistory;
	}
	
	public void setLoanHistory(List<HistoryLoan> loanHistory) {
		this.loanHistory = loanHistory;
	}
	
	public User getUser() {
		return user;
	}
	
	public void setUser(User user) {
		this.user = user;
	}
}
