package tk.comixloan.controller;

import java.util.LinkedList;
import java.util.List;
import javax.ejb.EJB;
import javax.faces.bean.ManagedBean;
import tk.comixloan.facade.VolumeFacade;
import tk.comixloan.model.*;

@ManagedBean(name = "volumeController")
public class VolumeController extends AbstractSessionController {
	@EJB
	private VolumeFacade volumeFacade;
	private List<Volume> listVolumes;
	private long number;
	private double price;
	private String description;
	private long idSerieCorrente;
	
	
	public String listVolume(){
		listVolumes = this.volumeFacade.getVolumes(this.getCurrentUser().getId());
		if (listVolumes == null) listVolumes = new LinkedList<Volume>();
		return "/volume/list";
	}
	
	public String addVolume(){
		Long idSerie = (Long) this.getSessionVariable("serieID");
		
		Volume v = this.volumeFacade.createVolume(number, price, description, idSerie, this.getCurrentUser().getId());
		
		if (v == null)
			return "/volume/insertVolume";
		else{
			listVolumes = this.volumeFacade.getVolumes(this.getCurrentUser().getId());
			return "/volume/list";
		}
	}
	
	/*
	 * QUI INIZIANO I GETTER ED I SETTER
	 * 
	 */
	
	public List<Volume> getListVolumes() {
		return listVolumes;
	}
	public void setListVolume(List<Volume> listVolume) {
		this.listVolumes = listVolume;
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
