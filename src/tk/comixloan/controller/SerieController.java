package tk.comixloan.controller;

import java.util.Date;
import java.util.LinkedList;
import java.util.List;

import javax.ejb.EJB;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.ManagedProperty;
import javax.persistence.EntityManager;

import tk.comixloan.facade.SerieFacade;
import tk.comixloan.model.Serie;

@ManagedBean(name = "serieController")
public class SerieController extends AbstractSessionController{
	@EJB
	private SerieFacade serieFacade;
	private String querySerie;
	private List<Serie> listSeries = new LinkedList<Serie>();
	private String name;
	private String description;
	private String editor;
	private String author;
	
	@ManagedProperty(value="#{param.id}")
	private String serieCorrente;
	
	public String searchSerie(){
		listSeries = serieFacade.find(querySerie);
		return "/volume/searchedSeries";
	}
	public String selectSerie(){
		this.putSessionVariable("serieID", new Long(this.serieCorrente));
		return "/volume/insertVolume";
	}
	
	public String createSerie(){
		Serie s = this.serieFacade.createSerie(name, description, new Date(), editor, author);
		
		if (s == null)
			return "/volume/insertSerie";
		else{
			this.putSessionVariable("serieID", s.getId());
			return "/volume/insertVolume";
		}
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

	public String getAuthor() {
		return author;
	}

	public void setAuthor(String autore) {
		this.author = autore;
	}
	
	public String getSerieCorrente() {
		return serieCorrente;
	}
	
	public void setSerieCorrente(String serieCorrente) {
		this.serieCorrente = serieCorrente;
	}

}
