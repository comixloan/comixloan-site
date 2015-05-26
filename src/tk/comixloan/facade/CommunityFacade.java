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
	
	public boolean addUser(Long idCommunity, String  username){
		UserFacade userFacade = new UserFacade(this.em);
		
		User user = userFacade.findByUsername(username);
		if(user != null && checkUserInCommunity(idCommunity,username))
			return this.addUser(this.get(idCommunity), user);
		else
			return false;
	}
	
	private boolean checkUserInCommunity(Long idCommunity, String username) {
		UserFacade userFacade = new UserFacade(this.em);
		User user = userFacade.findByUsername(username);
		List<Community> communityUser=user.getCommunities();
		
		return communityUser.contains(idCommunity);
	}

	public boolean addUser(Community c, User user){
		List<User> users = c.getUsers();
		if (users == null)
			users = new LinkedList<User>();
		users.add(user);
		c.setUsers(users);
		
		List<Community> communities= user.getCommunities();
    	if (communities == null)
    		communities = new LinkedList<Community>();
    		
    	communities.add(c);
    	user.setCommunities(communities);
    	try{
    		em.persist(user);
    		return true;
    	}catch(Exception ex){
    		ex.printStackTrace();
    		return false;
    	}
	}
	
	public Community get(Long id){
		return em.find(Community.class, id);
	}
	
	public boolean delete(Community c){
		try{
			for(User u: c.getUsers()){
				deleteUser(c, u);
			}
			this.em.remove(c);
			return true;
		}catch(Exception ex){
			ex.printStackTrace();
			return false;
		}
	}
	
	public boolean deleteUser(Community c, User u){
		List<Community> lc = u.getCommunities();
		lc.remove(c);
		
		try{
			em.persist(u);
			return true;
		}catch(Exception ex){
			return false;
		}
	}
}
