package tk.comixloan.facade;

import java.util.LinkedList;
import java.util.List;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import tk.comixloan.model.*;

@Stateless
public class CommunityFacade {
	
	@PersistenceContext(unitName = "comixloan-database")
    private EntityManager em;

	public CommunityFacade(){}
	
	public CommunityFacade(EntityManager em) {
		super();
		this.em = em;
	}
	
	public Community create(Long idUser, String name, String description){
		User user = em.find(User.class, idUser);
		Community c = new Community(name, description);
		c.setAdmin(user);
		this.addUser(c, user);
		return c;
	} 
	
	public Community addUser(Long idCommunity, Long idUser){
		UserFacade userFacade = new UserFacade(this.em);
		
		return this.addUser(this.get(idCommunity), userFacade.getUser(idUser));
	}
	
	public Community addUser(Community c, User user){
		List<User> users = c.getUsers();
		if (users == null)
			users = new LinkedList<User>();
		users.add(user);
		c.setUsers(users);
		
		new UserFacade(em).addCommunity(user, c);		
		em.persist(c);
		return c;
	}
	
	public Community get(Long id){
		return em.find(Community.class, id);
	}
	
	public void delete(Community c){
		for(User u: c.getUsers()){
			deleteUser(c, u);
		}
	}
	
	public void deleteUser(Community c, User u){
		List<User> l = c.getUsers();
		l.remove(u);
		em.persist(c);
	}
}