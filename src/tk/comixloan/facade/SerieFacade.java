package tk.comixloan.facade;

import java.util.ArrayList;
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
import tk.comixloan.model.Volume;

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
		TypedQuery<Serie> q= em.createQuery("SELECT s FROM Serie s WHERE s.name LIKE ?1",Serie.class);
		q.setParameter(1, "%"+name+"%");
		return q.getResultList();
	}
	
	public Serie getSerie(Long id){
		Serie s=em.find(Serie.class, id);
		return s;
	}
	
	public List<Serie> findByUser(Long idUser, String name){
		@SuppressWarnings("unchecked")
		TypedQuery<Serie> q = (TypedQuery<Serie>) this.em.createNativeQuery("SELECT DISTINCT s.* "
				+ "FROM volume v, serie s "
				+ "WHERE v.user_id = ?1 "
				+ "AND v.serie_id = s.id "
				+ "AND s.name LIKE ?2", Serie.class);
		q.setParameter(1, idUser);
		q.setParameter(2, "%"+name+"%");
		
		try{
			return q.getResultList();
		}catch(Exception ex){
			ex.printStackTrace();
			return new ArrayList<Serie>();
		}
	}
	
	public List<Volume> getVolumes(Long idSerie, Long idUser){
		@SuppressWarnings("unchecked")
		TypedQuery<Volume> q = (TypedQuery<Volume>) this.em.createNativeQuery("SELECT * "
				+ "FROM volume v "
				+ "WHERE serie_id = ?1 "
				+ "AND user_id = ?2 "
				+ "AND loan_id IS NULL", Volume.class);
		q.setParameter(1, idSerie);
		q.setParameter(2, idUser);
		
		try{
			return q.getResultList();
		}catch(Exception ex){
			ex.printStackTrace();
			return new ArrayList<Volume>();
		}
	}

}
