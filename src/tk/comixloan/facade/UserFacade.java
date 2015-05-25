package tk.comixloan.facade;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.LinkedList;
import java.util.List;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;

import tk.comixloan.model.Community;
import tk.comixloan.model.HistoryLoan;
import tk.comixloan.model.Loan;
import tk.comixloan.model.User;
import tk.comixloan.model.Volume;


@Stateless
public class UserFacade {
	
    @PersistenceContext(unitName = "comixloan-database")
    private EntityManager em;
    
    public UserFacade(){}
    
    public UserFacade(EntityManager em){
    	this.em = em;
    }
    
    private String sha256(String pwd) throws NoSuchAlgorithmException{
    	MessageDigest md = MessageDigest.getInstance("SHA-256");
        md.update(pwd.getBytes());
 
        byte byteData[] = md.digest();
 
        //convert the byte to hex format method 1
        StringBuffer sb = new StringBuffer();
        for (int i = 0; i < byteData.length; i++) {
         sb.append(Integer.toString((byteData[i] & 0xff) + 0x100, 16).substring(1));
        }
        return sb.toString();
    }

    public User createUser(String name,String surName,String email, String password, String userName) throws NoSuchAlgorithmException{
    	password = sha256(password);
    	User user = new User(name, surName, email, password, userName);
    	try{
    		em.persist(user);
    	}catch(Exception ex){
    		ex.printStackTrace();
    		user = null;
    	}
    	return user;
    }
    
    public User findByEmailPassword(String email, String password) throws NoSuchAlgorithmException{
    	TypedQuery<User> q = em.createQuery("SELECT u FROM User u WHERE (u.userName = :user OR u.email = :email) AND u.password = :pwd", User.class);
    	q.setParameter("user", email);
    	q.setParameter("email", email);
    	q.setParameter("pwd", sha256(password));
    	
    	try{
    		return q.getSingleResult();
    	}catch(NoResultException ex){
    		return null; 
    	}	
    	
    }
    
    public User findByUsername(String username){
    	TypedQuery<User> q = em.createQuery("SELECT u FROM User u WHERE u.userName = :user", User.class);
    	q.setParameter("user", username);
    	
    	try{
    		return q.getSingleResult();
    	}catch(NoResultException ex){
    		return null; 
    	}
    }
    
    public boolean existsUser(String email, String username){
    	TypedQuery<User> q = em.createQuery("SELECT u FROM User u WHERE (u.userName = :user OR u.email = :email)", User.class);
    	q.setParameter("user", username);
    	q.setParameter("email", email);
    	try{
    		return q.getResultList().size() != 0;
    	}catch(Exception ex){
    		ex.printStackTrace();
    		return true;
    	}
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
