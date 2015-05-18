package tk.comixloan.model;

import java.util.Date;
import java.util.List;

import javax.persistence.*;

@Entity
public class Loan {
	private Date startDate;
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Id id;
	@OneToMany
	private List<Volume> volumes;
	
	
	public Loan(Date date){
		this.startDate= date;
	}

}
