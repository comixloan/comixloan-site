package tk.comixloan.facade;

import java.util.Date;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
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
	public Volume createVolume(Long vol,Double price,String description,Serie serie,User user){
		
		Volume v= new Volume(vol, price, serie,description,user);
		UserFacade uf= new UserFacade(em);
		uf.addVolumes(user, v);
		
		return v;
		
	}
	
	public void setCurrentLoan(Loan l, Volume v){
		v.setLoan(l);
		em.persist(v);
		
		new LoanFacade(em).addVolume(l, v);
	}
	
	public Loan setCurrentLoan(Volume v, User u){
		Loan l = new LoanFacade(em).create(new Date(), u);
		this.setCurrentLoan(l, v);
		return l;
	}

}
