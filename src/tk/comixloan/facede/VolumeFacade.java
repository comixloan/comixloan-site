package tk.comixloan.facede;

import java.util.List;

import javax.ejb.Stateless;
import javax.persistence.Column;
import javax.persistence.EntityManager;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.PersistenceContext;

import tk.comixloan.model.HistoryLoan;
import tk.comixloan.model.Loan;
import tk.comixloan.model.Serie;
import tk.comixloan.model.User;
import tk.comixloan.model.Volume;

@Stateless
public class VolumeFacade {
	
	@PersistenceContext(unitName = "comixloan-database")
    private EntityManager em;
	
	public VolumeFacade(EntityManager em){
		this.em=em;
	}
	
	//da finire i collegamenti con utente e con serie 
	public Volume createVolume(Long vol,Double price,String description,User user,Serie serie){
		
		Volume v= new Volume(vol, price, serie, user);
		em.persist(v);
		return v;
		
		
	}

}
