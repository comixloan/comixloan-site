package tk.comixloan.controller;

import java.security.NoSuchAlgorithmException;

import javax.ejb.EJB;
import javax.enterprise.context.SessionScoped;
import javax.faces.bean.ManagedBean;

import tk.comixloan.facade.*;

@ManagedBean(name = "comixloanController")
@SessionScoped
public class ComiXloanController extends AbstractSessionController{

	
	
	@EJB
	private HistoryLoanFacade historyFacade;
	
	@EJB
	private LoanFacade loanFacade;
	
	@EJB
	private SerieFacade serieFacade;
	
	
	private String userName;
	private String passWord;
	private String name;
	private String surname;
	private String email;
	
	@EJB
	private VolumeFacade volumeFacade;
	
	
	public String home(){
		return "home";
	}

	public String logIn() throws NoSuchAlgorithmException{
		this.setCurrentUser(this.getUserFacade().findByEmailPassword(email, passWord));
		if(this.getCurrentUser() == null){
			return "login";	
		}
		else 
			return "home";
	}
	
	public String signIn() throws NoSuchAlgorithmException{
		if (this.getUserFacade().existsUser(email, userName))
			return "signin";
		else{
			this.setCurrentUser(this.getUserFacade().createUser(name, surname, email, passWord, userName));
			return "home";
		}
	}
	
	public String createCommunity(){
		
		
		return null;
	}
	
	
	/*
	 * --------------------------------------
	 * QUI INIZIANO I GETTTER E I SETTER
	 * --------------------------------------
	 * 
	 */
	
	
	
	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getPassWord() {
		return passWord;
	}

	public void setPassWord(String passWord) {
		this.passWord = passWord;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getSurname() {
		return surname;
	}

	public void setSurname(String surname) {
		this.surname = surname;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}
	

}
