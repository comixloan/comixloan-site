package tk.comixloan.facede;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

@Stateless
public class CommunityFacade {
	
	@PersistenceContext(unitName = "comixloan-database")
    private EntityManager em;
}
