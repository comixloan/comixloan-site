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
	
	public LoanFacade(){}
	
	public LoanFacade(EntityManager em){
		this.em=em;
	}
	
	public Loan create(Date startDate, Long idUser, Long idCreator){
		User user = new UserFacade(this.em).getUser(idUser);
		User creator = new UserFacade(this.em).getUser(idCreator);
		
		return this.create(startDate, user, creator);
	}
	
	public Loan create(Date startDate, User user, User creator){
		Loan l = new Loan(new LinkedList<Volume>(), startDate, user);
		
		List<Loan> loans= creator.getLoans();
    	if (loans == null)
    		loans = new LinkedList<Loan>();
    	loans.add(l);
    	creator.setLoans(loans);
    	
    	try{
    		em.persist(creator);
    		return l;
    	}catch(Exception ex){
    		ex.printStackTrace();
    		return null;
    	}
	}
	
	public boolean addVolume(Loan l, Long idVolume){
		Volume v = new VolumeFacade(this.em).find(idVolume);
		
		return this.addVolume(l, v);
	}
	
	public boolean addVolume(Loan l, Volume v){
		v.setLoan(l);
		
		try{
			em.persist(v);
			return true;
		}catch(Exception ex){
			ex.printStackTrace();
			return false;
		}
	}
	
	public boolean removeVolume(Loan l, Long idVolume){
		Volume v = new VolumeFacade(this.em).find(idVolume);
		
		return this.removeVolume(l, v);
	}
	
	public boolean removeVolume(Loan l, Volume v){
		v.setLoan(null);
		try{
			em.persist(v);
			return true;
		}catch(Exception ex){
			ex.printStackTrace();
			return false;
		}
	}
	
	public Loan find(Long id){
		return em.find(Loan.class, id);
	}
	
	public List<Loan> listLoanUser(Long id){
		User u = new UserFacade(this.em).getUser(id);
		return u.getLoans();
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
