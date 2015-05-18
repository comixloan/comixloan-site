package tk.comixloan.facede;

import java.util.LinkedList;
import java.util.List;

import javax.ejb.Stateless;
import javax.persistence.Column;
import javax.persistence.EntityManager;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.PersistenceContext;

import tk.comixloan.model.Community;
import tk.comixloan.model.HistoryLoan;
import tk.comixloan.model.Loan;
import tk.comixloan.model.User;
import tk.comixloan.model.Volume;


@Stateless
public class UserFacade {
	
    @PersistenceContext(unitName = "comixloan-database")
    private EntityManager em;
    
    public UserFacade(EntityManager em){
    	this.em = em;
    }

    public User createUser(String name,String surName,String email, String password, String userName){
    	User user = new User(name, surName, email, password, userName);
    	em.persist(user);
    	return user;
    }
    
    public void addCommunity(User u,Community c){
    	List<Community> communities= u.getCommunities();
    	if (communities == null)
    		communities = new LinkedList<Community>();
    		
    	communities.add(c);
    	u.setCommunities(communities);
    	em.persist(u);
    }
    
    public void addVolumes(User u,Volume v){
    	List<Volume> volumes=u.getVolumes();
    	if (volumes == null)
    		volumes = new LinkedList<Volume>();
    	volumes.add(v);
    	u.setVolumes(volumes);
    	em.persist(u);
    }
    
    public void addHistoryLoan(User u,HistoryLoan hl){
    	List<HistoryLoan> historiesLoan = u.getHistoriesLoan();
    	if (historiesLoan == null)
    		historiesLoan = new LinkedList<HistoryLoan>();
		historiesLoan.add(hl);
		u.setHistoriesLoan(historiesLoan);
		em.persist(u);
    }
    
    public void addLoan(User u,Loan l){
    	List<Loan> loans= u.getLoans();
    	if (loans == null)
    		loans = new LinkedList<Loan>();
    	loans.add(l);
    	u.setLoans(loans);
    	em.persist(u);
    }
    
    public User getUser(Long id){
    	return em.find(User.class,id);
    }
    
    public void delete(User u){
    	em.remove(u);
    }
    
    public void delete(Long id){
    	delete(this.getUser(id));
    }
}
