package tk.comixloan.controller;

import java.util.ArrayList;
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
	private String numberOfVolume;
	private List<Volume> listVolumeToAdd;


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


	public String addVolumeList(){
		Long idSerie = (Long) this.getSessionVariable("serieID");

		int[] numberArray = this.toNumberArray(this.numberOfVolume);
		this.listVolumeToAdd= this.volumeFacade.createVolumesList(numberArray, price, description, idSerie,this.getCurrentUser().getId());

		if (listVolumeToAdd == null)
			return "/volume/insertListVolume";
		else{
			this.volumeFacade.addListVolumes(this.getCurrentUser().getId(), this.listVolumeToAdd);
			listVolumes = this.volumeFacade.getVolumes(this.getCurrentUser().getId());
			return "/volume/list";
		}

	}

	private int[] toNumberArray(String numberOfVolume2) {
		String[] numeri=numberOfVolume2.split("-");
		int min= new Integer(numeri[0]).intValue();
		int max=new Integer(numeri[1]).intValue();
		int dimensione=max-min + 1;
		int[] numberArray = new int[dimensione];
		for(int i=0; i<dimensione; i++){
			numberArray[i]=min+i;
		}
		return numberArray;

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

	public String getNumberOfVolume() {
		return numberOfVolume;
	}

	public void setNumberOfVolume(String numberOfVolume) {
		this.numberOfVolume = numberOfVolume;
	}

	public List<Volume> getListVolumeToAdd() {
		return listVolumeToAdd;
	}

	public void setListVolumeToAdd(List<Volume> listVolumeToAdd) {
		this.listVolumeToAdd = listVolumeToAdd;
	}	
}
