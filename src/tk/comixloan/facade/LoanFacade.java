package tk.comixloan.facade;

import java.util.Date;
import java.util.LinkedList;
import java.util.List;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import tk.comixloan.model.Loan;
import tk.comixloan.model.User;
import tk.comixloan.model.Volume;

@Stateless
public class LoanFacade {
	
	@PersistenceContext(unitName = "comixloan-database")
    private EntityManager em;
	
	public LoanFacade(EntityManager em){
		this.em=em;
	}
	
	public Loan create(Date startDate, User user){
		Loan l = new Loan(new LinkedList<Volume>(), startDate, user);
		
		List<Loan> loans= user.getLoans();
    	if (loans == null)
    		loans = new LinkedList<Loan>();
    	loans.add(l);
    	user.setLoans(loans);
    	
    	try{
    		em.persist(user);
    		return l;
    	}catch(Exception ex){
    		ex.printStackTrace();
    		return null;
    	}
	}
	
	public boolean addVolume(Loan l, Volume v){
		List<Volume> lv = l.getVolumes();
		if (lv == null)
			lv = new LinkedList<Volume>();
		lv.add(v);
		l.setVolumes(lv);
		
		try{
			em.persist(l);
			return true;
		}catch(Exception ex){
			ex.printStackTrace();
			return false;
		}
	}
	
	public Loan find(Long id){
		return em.find(Loan.class, id);
	}
	
	public List<Volume> getVolumes(Long id){
		try{
			return this.find(id).getVolumes();
		}catch(Exception ex){
			ex.printStackTrace();
			return null;
		}
	}
	
	public void delete(Loan hl){
		em.remove(hl);
	}
	
	public void delete(Long id){
		delete(this.find(id));
	}
}
