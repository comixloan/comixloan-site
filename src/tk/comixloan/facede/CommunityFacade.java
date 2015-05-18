package tk.comixloan.facede;

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

	public CommunityFacade(EntityManager em) {
		super();
		this.em = em;
	}
	
	public Community create(User user, String name, String description){
		Community c = new Community(name, description);
		c.setAdmin(user);
		em.persist(c);
		return c;
	} 
	
	public Community addUser(Long id, User user){
		Community c = em.find( Community.class, id);
		List<User> users = c.getUsers();
		if (users == null)
			users = new LinkedList<User>();
		users.add(user);
		
		List<Community> lc = user.getCommunities();
		if (lc == null)
			lc = new LinkedList<Community>();
		lc.add(c);
		
		user.setCommunities(lc);
		c.setUsers(users);
		em.persist(c);
		return c;
	}
	
	public Community addUser(Community c, User user){
		return this.addUser(c.getId(), user);
	}
	
	public Community get(Long id){
		return em.find(Community.class, id);
	}
}
