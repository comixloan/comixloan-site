package tk.comixloan.model;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;

@Entity
public class User {

	@Id
	@GeneratedValue(strategy= GenerationType.IDENTITY)
	private Id id;

	@Column(nullable=false)
	private String name;
	
	@Column(nullable=false)
	private String surName;
	
	@Column(nullable=false)
	private String email;
	
	@Column(nullable=false)
	private String password;
	
	@Column(nullable=false)
	private String userName;
	
	@OneToMany
	private List<Volume> volumes;
	
	@OneToMany
	private List<HistoryLoan> historiesLoan;
	
	@OneToMany
	private List<Loan> loans;

	@ManyToMany
	private List<Community> communities;
	
	public User(){}
	
	public User(String name, String surName, String email, String password,
			String userName) {
		super();
		this.name = name;
		this.surName = surName;
		this.email = email;
		this.password = password;
		this.userName = userName;
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

	public String getSurName() {
		return surName;
	}

	public void setSurName(String surName) {
		this.surName = surName;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public List<Volume> getVolumes() {
		return volumes;
	}

	public void setVolumes(List<Volume> volumes) {
		this.volumes = volumes;
	}

	public List<HistoryLoan> getHistoriesLoan() {
		return historiesLoan;
	}

	public void setHistoriesLoan(List<HistoryLoan> historiesLoan) {
		this.historiesLoan = historiesLoan;
	}

	public List<Loan> getLoans() {
		return loans;
	}

	public void setLoans(List<Loan> loans) {
		this.loans = loans;
	}

	public List<Community> getCommunities() {
		return communities;
	}

	public void setCommunities(List<Community> communities) {
		this.communities = communities;
	}
	
	
	
	
}