package tk.comixloan.facade;

import java.util.Date;
import java.util.LinkedList;
import java.util.List;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import tk.comixloan.model.Loan;
import tk.comixloan.model.Serie;
import tk.comixloan.model.User;
import tk.comixloan.model.Volume;

@Stateless
public class VolumeFacade {
	
	@PersistenceContext(unitName = "comixloan-database")
    private EntityManager em;
	
	public VolumeFacade(){}
	
	public VolumeFacade(EntityManager em){
		this.em=em;
	}
	
	public Volume createVolume(Long vol,Double price,String description,Long id,Long idUser){
		Serie s = new SerieFacade(em).getSerie(id);
		User user = new UserFacade(em).getUser(idUser);
		return this.createVolume(vol, price, description, s, user);
	}
	
	//da finire i collegamenti con utente e con serie 
	public Volume createVolume(Long vol,Double price,String description,Serie serie,User user){
		
		Volume v= new Volume(vol, price, serie,description,user);
		
		List<Volume> volumes=user.getVolumes();
    	if (volumes == null)
    		volumes = new LinkedList<Volume>();
    	volumes.add(v);
    	user.setVolumes(volumes);
    	try{
    		em.persist(user);
    		return v;
    	}catch(Exception ex){
    		ex.printStackTrace();
    		return null;
    	}
		
	}
	
	public boolean setCurrentLoan(Loan l, Volume v){
		v.setLoan(l);
		try{
			em.persist(v);
			return new LoanFacade(em).addVolume(l, v);
		}catch(Exception ex){
			ex.printStackTrace();
			return false;
		}		
	}
	
	public Loan setCurrentLoan(Volume v, User u){
		Loan l = new LoanFacade(em).create(new Date(), u);
		if (l == null || this.setCurrentLoan(l, v)){
			return null;
		}else{
			 return l;
		}
	}
	
	public List<Volume> getVolumes(Long id){
		return new UserFacade(em).getUser(id).getVolumes();
	}
	
	public Volume find(Long id){
		try{
			return this.em.find(Volume.class, id);
		}catch(Exception ex){
			return null;
		}
	}
}
