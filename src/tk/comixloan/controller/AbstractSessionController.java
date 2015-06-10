package tk.comixloan.controller;

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
	
	@PostConstruct
	public void init(){
		Long idUser = (Long) getSessionVariable("userCorrent");
		if (idUser != null){
			this.currentUser = this.userFacade.getUser(idUser);
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
		this.putSessionVariable("userCorrent", currentUser.getId());
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
}
