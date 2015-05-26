package tk.comixloan.controller;

import java.util.List;
import javax.ejb.EJB;
import javax.faces.bean.ManagedBean;
import tk.comixloan.facade.VolumeFacade;
import tk.comixloan.model.*;

@ManagedBean(name = "volumeController")
public class VolumeController extends AbstractSessionController {
	@EJB
	private VolumeFacade volumeFacade;
	private List<Volume> listVolume;
	private long number;
	private double price;
	private String description;
	private long idSerieCorrente;
	
	
	public String listVolume(){
		listVolume = getCurrentUser().getVolumes(); 
		return "volume/list";
	}
	
	
	

	/*
	 * QUI INIZIANO I GETTER ED I SETTER
	 * @param listVolume
	 */
	
	public List<Volume> getListVolume() {
		return listVolume;
	}
	public void setListVolume(List<Volume> listVolume) {
		this.listVolume = listVolume;
	}
	public long getNumber() {
		return number;
	}
	public void setNumber(long number) {
		this.number = number;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public long getIdSerieCorrente() {
		return idSerieCorrente;
	}
	public void setIdSerieCorrente(long idSerieCorrente) {
		this.idSerieCorrente = idSerieCorrente;
	}
	
	
	
}
