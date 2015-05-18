package tk.comixloan.facade;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.LinkedList;
import java.util.List;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
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
    	em.persist(user);
    	return user;
    }
    
    public User findByEmailPassword(String email, String password) throws NoSuchAlgorithmException{
    	TypedQuery<User> q = em.createQuery("SELECT u FROM User u WHERE (userName = :user OR email = :email) AND password = : pwd", User.class);
    	q.setParameter("user", email);
    	q.setParameter("email", email);
    	q.setParameter("pwd", sha256(password));
    	
    	return q.getSingleResult();
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
