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
	
	public HistoryLoanFacade(EntityManager em2) {
		this.em = em2;
	}

	public HistoryLoan create(Long idLoan, Long idUser){
		
		HistoryLoan hl = new HistoryLoan(this.em.find(Loan.class, idLoan));
		
		User user = this.em.find(User.class, idUser);
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
	
	public List<HistoryLoan> listHistoryLoanUser(Long idUser){
		User currentUser = em.find(User.class,idUser);
		
		return currentUser.getHistoriesLoan();
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
