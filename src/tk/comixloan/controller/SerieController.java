package tk.comixloan.controller;

import java.util.List;

import javax.ejb.EJB;
import javax.faces.bean.ManagedBean;
import javax.persistence.EntityManager;

import tk.comixloan.facade.SerieFacade;
import tk.comixloan.model.Serie;

@ManagedBean(name = "serieController")
public class SerieController extends AbstractSessionController{
	@EJB
	private SerieFacade serieFacade;
	private String querySerie;
	private List<Serie> listSeries;
	private String name;
	private String description;
	private String editor;
	private String autore;
	
	public String searchSerie(){
		return "volume/searchedSeries";
	}
	
	public String createNotFoundSerie(){
		return "volume/searchedSeries";
	}
	
	
	
	/*
	 * QUI INZIANO I GETTER ED I SETTER
	 */

	public String getQuerySerie() {
		return querySerie;
	}

	public List<Serie> getListSeries() {
		return listSeries;
	}

	public void setListSeries(List<Serie> listSeries) {
		this.listSeries = listSeries;
	}

	public void setQuerySerie(String querySerie) {
		this.querySerie = querySerie;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getEditor() {
		return editor;
	}

	public void setEditor(String editor) {
		this.editor = editor;
	}

	public String getAutore() {
		return autore;
	}

	public void setAutore(String autore) {
		this.autore = autore;
	}
	
	
	

}
