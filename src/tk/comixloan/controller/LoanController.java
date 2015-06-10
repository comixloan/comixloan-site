package tk.comixloan.controller;

import java.util.Date;
import java.util.List;

import javax.annotation.PostConstruct;
import javax.ejb.EJB;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.ManagedProperty;

import tk.comixloan.model.*;
import tk.comixloan.facade.CommunityFacade;
import tk.comixloan.facade.LoanFacade;

@ManagedBean(name = "loanController")
public class LoanController extends AbstractSessionController {
	@EJB
	private LoanFacade loanFacade;
	@EJB
	private CommunityFacade communityFacade;
	private String username;
	private String idVolumeSearched;
	@ManagedProperty(value="#{param.id}")
	private String idCurrentLoan;
	private List<Loan> userLoans;
	private Loan currentLoan;
	private List<User> possibleUser;
	@ManagedProperty(value="#{param.idUser}")
	private String idUserToLoan;
	
	
	
	@PostConstruct
	public void initLoan(){
		this.init();
		Long idLoan = (Long) this.getSessionVariable("currentLoan");
		if (idLoan!= null){
			this.currentLoan = this.loanFacade.find(idLoan);
		}
	}
	
	
	public String listLoan(){
		long idUser=this.getCurrentUser().getId();
		userLoans=loanFacade.listLoanUser(idUser);
		return "loan/list.jsp";
	}
	
	
	public String giveBack(){
		return "";
	}
	
	public String getLoanInformation(){
		currentLoan=this.loanFacade.find(new Long(idCurrentLoan));
		return "loan/info";
	}
	
	
	public String showUser(){
		Long idCurrentUser=new Long(this.getCurrentUser().getId());
		possibleUser= communityFacade.findUserFromCommunities(idCurrentUser, username);
		return "loan/add";
	}
	
	public String selectUser(){
		this.setCurrentLoan(loanFacade.create(new Date(), new Long(idUserToLoan)));
		return "lona/insertVolume";
	}
	
	
	/*
	 * QUI INZIANO I GETTER ED I SETTER
	 */
	
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getIdVolumeSearched() {
		return idVolumeSearched;
	}
	public void setIdVolumeSearched(String idVolumeSearched) {
		this.idVolumeSearched = idVolumeSearched;
	}
	public String getIdCurrentLoan() {
		return idCurrentLoan;
	}
	public void setIdCurrentLoan(String idCurrentLoan) {
		this.idCurrentLoan = idCurrentLoan;
	}



	public List<Loan> getUserLoans() {
		return userLoans;
	}



	public void setUserLoans(List<Loan> userLoans) {
		this.userLoans = userLoans;
	}



	public Loan getCurrentLoan() {
		return currentLoan;
	}



	public void setCurrentLoan(Loan currentLoan) {
		this.currentLoan = currentLoan;
		this.putSessionVariable("currentLoan",this.currentLoan);
		
	}


	public List<User> getPossibleUser() {
		return possibleUser;
	}


	public void setPossibleUser(List<User> possibleUser) {
		this.possibleUser = possibleUser;
	}


	public String getIdUserToLoan() {
		return idUserToLoan;
	}


	public void setIdUserToLoan(String idUserToLoan) {
		this.idUserToLoan = idUserToLoan;
	}
	
	
	

}
