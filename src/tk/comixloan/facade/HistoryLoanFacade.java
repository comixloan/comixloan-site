package tk.comixloan.facade;

import java.util.List;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import tk.comixloan.model.HistoryLoan;
import tk.comixloan.model.Loan;
import tk.comixloan.model.Volume;

@Stateless
public class HistoryLoanFacade {
	
	@PersistenceContext(unitName = "comixloan-database")
    private EntityManager em;
	
	public HistoryLoanFacade(){}
	
	public HistoryLoan create(Loan loan){
		HistoryLoan hl = new HistoryLoan(loan);
		em.persist(hl);
		
		new UserFacade(em).addHistoryLoan(loan.getUser(), hl);
		return hl;
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