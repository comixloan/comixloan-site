package tk.comixloan.controller;

import java.util.List;

import javax.ejb.EJB;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.ManagedProperty;

import tk.comixloan.model.*;
import tk.comixloan.facade.LoanFacade;

@ManagedBean(name = "loanController")
public class LoanController extends AbstractSessionController {
	@EJB
	private LoanFacade loanFacade;
	private String username;
	private String idVolumeSearched;
	@ManagedProperty(value="#{param.id}")
	private String idCurrentLoan;
	private List<Loan> userLoans;
	private Loan currentLoan;
	
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
	
	
	public String addLoan(){
		return "";
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
	
	
	

}
