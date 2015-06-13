package tk.comixloan.controller;

import java.security.NoSuchAlgorithmException;

import javax.ejb.EJB;
import javax.enterprise.context.SessionScoped;
import javax.faces.bean.ManagedBean;

import tk.comixloan.facade.*;

@ManagedBean(name = "comixloanController")
@SessionScoped
public class ComiXloanController extends AbstractSessionController{
	
	private String userName;
	private String passWord;
	private String name;
	private String surname;
	private String email; 
	
	
	public String home(){
		return "/home.xhtml";
	}

	public String logIn() throws NoSuchAlgorithmException{
		this.setCurrentUser(this.getUserFacade().findByEmailPassword(email, passWord));
		if(this.getCurrentUser() == null){
			return "/login.xhtml";	
		}
		else 
			return "/home.xhtml";
	}
	
	public String signIn() throws NoSuchAlgorithmException{
		if (this.getUserFacade().existsUser(email, userName))
			return "/signin.xhtml";
		else{
			this.setCurrentUser(this.getUserFacade().createUser(name, surname, email, passWord, userName));
			return "/home.xhtml";
		}
	}
	
	public String logout(){
		this.setCurrentUser(null);
		return "/index.xhtml";
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
