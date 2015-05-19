package tk.comixloan.controller;

import java.security.NoSuchAlgorithmException;


import javax.ejb.EJB;
import javax.enterprise.context.SessionScoped;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.ManagedProperty;

import tk.comixloan.facade.*;
import tk.comixloan.model.User;

@ManagedBean(name = "comixloanController")
@SessionScoped
public class ComiXloanController{

	@EJB
	private CommunityFacade communityFacade;
	
	@EJB
	private HistoryLoanFacade historyFacade;
	
	@EJB
	private LoanFacade loanFacade;
	
	@EJB
	private SerieFacade serieFacade;
	
	@EJB
	private UserFacade userFacade;
	private String userName;
	private String passWord;
	private String name;
	private String surname;
	private String email;
	
	@ManagedProperty("#{currentUser}")
	private User currentUser = null;
	
	@EJB
	private VolumeFacade volumeFacade;

	public String logIn() throws NoSuchAlgorithmException{
		this.currentUser = userFacade.findByEmailPassword(email, passWord);
		if(this.currentUser==null){
			return "errorLogIn";	
		}
		else 
			return "home";
	}
	
	public String signIn() throws NoSuchAlgorithmException{
		if (this.userFacade.existsUser(email, userName))
			return "errorSignIn";
		else{
			this.currentUser = this.userFacade.createUser(name, surname, email, passWord, userName);
			return "home";
		}
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
	
	public User getCurrentUser() {
		return currentUser;
	}
	
	public void setCurrentUser(User currentUser) {
		this.currentUser = currentUser;
	}
}
