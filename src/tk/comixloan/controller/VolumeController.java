package tk.comixloan.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import javax.ejb.EJB;
import javax.faces.bean.ManagedBean;

import tk.comixloan.facade.VolumeFacade;
import tk.comixloan.model.*;

@ManagedBean(name = "volumeController")
public class VolumeController extends AbstractSessionController {
	@EJB
	private VolumeFacade volumeFacade;
	private long number;
	private double price;
	private String description;
	private long idSerieCorrente;
	private String numberOfVolume;
	private List<Volume> listVolumeToAdd;
	private Map<Serie, List<Volume>> serie2volume;
	private Long numberOfComix;
	private Double valueOfComix;

	public void refreshSerieVolume(){
		this.serie2volume = new HashMap<Serie, List<Volume>>();
		List<Volume> listVolumes = this.volumeFacade.getVolumes(this.getCurrentUser().getId());
		numberOfComix=new Long(listVolumes.size());
		valueOfComix=0.0;
		if (listVolumes != null){
			for(Volume v: listVolumes){
				Serie s = v.getSerie();
				valueOfComix+=v.getPrice();
				List<Volume> lv = this.serie2volume.get(s);
				if (lv == null){
					lv = new LinkedList<Volume>();
				}
				lv.add(v);
				this.serie2volume.put(s, lv);
			}
		}
	}
	
	public String listVolume(){
		this.refreshSerieVolume();
		
		return "/volume/list";
	}

	public String addVolume(){
		Long idSerie = (Long) this.getSessionVariable("serieID");

		Volume v = this.volumeFacade.createVolume(number, price, description, idSerie, this.getCurrentUser().getId());

		if (v == null)
			return "/volume/insertVolume";
		else{
			this.refreshSerieVolume();
			return "/volume/list";
		}
	}


	public String addVolumeList(){
		Long idSerie = (Long) this.getSessionVariable("serieID");

		int[] numberArray = this.toNumberArray(this.numberOfVolume);
		if(numberArray==null)
			return "/volume/insertListVolume"; 
		this.listVolumeToAdd= this.volumeFacade.createVolumesList(numberArray, price, description, idSerie,this.getCurrentUser().getId());

		if (listVolumeToAdd == null)
			return "/volume/insertListVolume";
		else{
			this.volumeFacade.addListVolumes(this.getCurrentUser().getId(), this.listVolumeToAdd);
			this.refreshSerieVolume();
			return "/volume/list";
		}

	}

	private int[] toNumberArray(String numberOfVolume2) {
		String[] numeri=numberOfVolume2.split("-");
		int min= new Integer(numeri[0]).intValue();
		int max=new Integer(numeri[1]).intValue();
		if(min>max){
			this.addErrors("intervallo senza senso!");
			return null;
		}
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
	
	public Map<Serie, List<Volume>> getSerie2volume() {
		return serie2volume;
	}
	
	public void setSerie2volume(Map<Serie, List<Volume>> serie2volume) {
		this.serie2volume = serie2volume;
	}

	public Long getNumberOfComix() {
		return numberOfComix;
	}

	public void setNumberOfComix(Long numberOfComix) {
		this.numberOfComix = numberOfComix;
	}

	public Double getValueOfComix() {
		return valueOfComix;
	}

	public void setValueOfComix(Double valueOfComix) {
		this.valueOfComix = valueOfComix;
	}
}
