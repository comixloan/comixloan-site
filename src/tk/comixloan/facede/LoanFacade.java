package tk.comixloan.facede;

import java.util.Date;
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
public class LoanFacade {
	
	@PersistenceContext(unitName = "comixloan-database")
    private EntityManager em;
	
	public Loan create(Date startDate, User user){
		Loan hl = new Loan(new LinkedList<Volume>(), startDate, user);
		em.persist(hl);
		return hl;
	}
	
	public void addVolume(Loan l, Volume v){
		List<Volume> lv = l.getVolumes();
		if (lv == null)
			lv = new LinkedList<Volume>();
		lv.add(v);
		l.setVolumes(lv);
		em.persist(l);
	}
	
	public Loan find(Long id){
		return em.find(Loan.class, id);
	}
	
	public List<Volume> getVolumes(Long id){
		return this.find(id).getVolumes();
	}
	
	public void delete(Loan hl){
		em.remove(hl);
	}
	
	public void delete(Long id){
		delete(this.find(id));
	}
}
