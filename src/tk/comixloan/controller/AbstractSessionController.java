package tk.comixloan.controller;

import java.util.LinkedList;
import java.util.List;

import javax.annotation.PostConstruct;
import javax.ejb.EJB;
import javax.faces.context.FacesContext;
import javax.servlet.http.HttpSession;

import tk.comixloan.facade.UserFacade;
import tk.comixloan.model.User;

public abstract class AbstractSessionController {
	
	private User currentUser = null;
	
	@EJB
	private UserFacade userFacade;
	
	public void initErrors(){
		List<String> lista = new LinkedList<String>();
		this.putSessionVariable("errors", lista);
	}
	
	@PostConstruct
	public void init(){
		Long idUser = (Long) getSessionVariable("userCorrent");
		if (idUser != null){
			this.currentUser = this.userFacade.getUser(idUser);
		}
		
		if (this.getSessionVariable("errors") == null){
			this.initErrors();
		}
	}
	
	public Object getSessionVariable(String value){
		FacesContext context = FacesContext.getCurrentInstance();
		HttpSession session = (HttpSession) context.getExternalContext().getSession(true);
		return session.getAttribute(value);
	}
	
	public void putSessionVariable(String value, Object o){
		FacesContext context = FacesContext.getCurrentInstance();
		HttpSession session = (HttpSession) context.getExternalContext().getSession(true);
		session.setAttribute(value, o);
	}
	
	public String[] getValuesParamiter(String name){
		return FacesContext.getCurrentInstance().getExternalContext().getRequestParameterValuesMap().get(name);
	}
	
	public User getCurrentUser() {
		return currentUser;
	}
	
	public void setCurrentUser(User currentUser) {
		if (currentUser != null)
			this.putSessionVariable("userCorrent", currentUser.getId());
		else
			this.putSessionVariable("userCorrent", null);
		this.currentUser = currentUser;
	}
	
	public UserFacade getUserFacade() {
		return userFacade;
	}
	
	public boolean isLogged(){
		return this.currentUser != null;
	}
	
	public boolean canLogin(){
		return !this.isLogged();
	}
	
	@SuppressWarnings("unchecked")
	public List<String> getErrors() {
		return (List<String>) this.getSessionVariable("errors");
	}
	
	@SuppressWarnings("unchecked")
	public String getSingleError(){
		return ((List<String>) this.getSessionVariable("errors")).get(0);
	}
	
	@SuppressWarnings("unchecked")
	public boolean isSingleError(){
		return ((List<String>) this.getSessionVariable("errors")).size() == 1;
	}
	
	@SuppressWarnings("unchecked")
	public boolean isMultiError(){
		return ((List<String>) this.getSessionVariable("errors")).size() > 1;
	}
	
	@SuppressWarnings("unchecked")
	public boolean isError(){
		return ((List<String>) this.getSessionVariable("errors")).size() >= 1;
	}
	
	@SuppressWarnings("unchecked")
	public void addErrors(String error){
		((List<String>) this.getSessionVariable("errors")).add(error);
	}
	
	public String emptyErrors(){
		this.initErrors();
		return "";
	}
	
}
