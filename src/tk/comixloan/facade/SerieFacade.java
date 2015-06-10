package tk.comixloan.facade;

import java.util.Date;
import java.util.List;

import javax.ejb.Stateless;
import javax.persistence.Column;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.TypedQuery;

import tk.comixloan.model.Serie;

@Stateless
public class SerieFacade {

	@PersistenceContext(unitName = "comixloan-database")
	private EntityManager em;
	
	public SerieFacade(){}
	
	public SerieFacade(EntityManager em){this.em=em;}

	public Serie createSerie(String name,String description, Date date,String editor, String author){
		Serie s=new Serie(name, description, date, editor, author);
		
		try{
			em.persist(s);
			
		}catch(Exception ex){
			ex.printStackTrace();
			s = null;
		}
		return s;
	}
	
	public List<Serie> find(String name){
		TypedQuery<Serie> q= em.createQuery("SELECT s FROM Serie s WHERE s.name LIKE :name",Serie.class);
		q.setParameter("name", "%"+name+"%");
		return q.getResultList();
	}
	
	public Serie getSerie(Long id){
		Serie s=em.find(Serie.class, id);
		return s;
	}
	
	public List<Serie> findByUser(String name){
		
		return null;
	}

}
