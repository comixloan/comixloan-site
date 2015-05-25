package tk.comixloan.facade;

import java.util.LinkedList;
import java.util.List;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import tk.comixloan.model.HistoryLoan;
import tk.comixloan.model.Loan;
import tk.comixloan.model.User;
import tk.comixloan.model.Volume;

@Stateless
public class HistoryLoanFacade {
	
	@PersistenceContext(unitName = "comixloan-database")
    private EntityManager em;
	
	public HistoryLoanFacade(){}
	
	public HistoryLoan create(Loan loan){
		HistoryLoan hl = new HistoryLoan(loan);
		
		User user = loan.getUser();
		List<HistoryLoan> historiesLoan = user.getHistoriesLoan();
    	if (historiesLoan == null)
    		historiesLoan = new LinkedList<HistoryLoan>();
		historiesLoan.add(hl);
		user.setHistoriesLoan(historiesLoan);
		
		try{
    		em.persist(user);
    		return hl;
    	}catch(Exception ex){
    		ex.printStackTrace();
    		return null;
    	}
	}
	
	public HistoryLoan find(Long id){
		return em.find(HistoryLoan.class, id);
	}
	
	public List<Volume> getVolumes(Long id){
		return this.find(id).getVolumes();
	}
	
	public void delete(HistoryLoan hl){
		em.remove(hl);
	}
	
	public void delete(Long id){
		delete(this.find(id));
	}
}
