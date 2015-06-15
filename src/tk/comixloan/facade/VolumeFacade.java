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



	public void addListVolumes(Long idUser, List<Volume> listVolumeToAdd) {
		User user = new UserFacade(em).getUser(idUser);
		List<Volume> volumes=user.getVolumes();
		if (volumes == null)
			volumes = new LinkedList<Volume>();
		volumes.addAll(listVolumeToAdd);
		user.setVolumes(volumes);
		try{
			em.persist(user);
		}catch(Exception ex){
			ex.printStackTrace();
		}

	}

	public List<Volume> createVolumesList(int[] numberOfVolume, double price,
			String description, Long idSerie,Long idUser) {
		Serie serie = new SerieFacade(em).getSerie(idSerie);
		User user = new UserFacade(em).getUser(idUser);

		List<Volume> volumesToAdd= new LinkedList<Volume>();
		for(int numero : numberOfVolume){
			Volume v= new Volume(new Long(numero), price, serie, description, user);
			volumesToAdd.add(v);
		}

		return volumesToAdd;
	}
}
