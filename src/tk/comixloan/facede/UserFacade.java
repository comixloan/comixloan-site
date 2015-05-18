package tk.comixloan.facede;

import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.Column;
import javax.persistence.EntityManager;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
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
    
    
    public User getUser(Long id){
    	return em.find(User.class,id);
    }

}
