package tk.comixloan.facede;

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

    public User createUser(String name,String surName,String email, String password, String userName){
    	User user = new User(name, surName, email, password, userName);
    	em.persist(user);
    	return user;
    }
    
    
    public void addCommunity(User u,Community c){
    	List<Community> communities= u.getCommunities();
    	communities.add(c);
    	em.persist(u);
    }
    
    
    public void addVolumes(User u,Volume v){
    	List<Volume> volumes=u.getVolumes();
    	volumes.add(v);
    	em.persist(u);
    }
    
    public void addHistoryLoan(User u,HistoryLoan hl){
    	List<HistoryLoan> historiesLoan = u.getHistoriesLoan();
		historiesLoan.add(hl);
		em.persist(u);
    }
    
    public void addLoan(User u,Loan l){
    	List<Loan> loans= u.getLoans();
    	loans.add(l);
    	em.persist(u);
    }
    
    
    
    public User getUser(Long id){
    	return em.find(User.class,id);
    }

}
