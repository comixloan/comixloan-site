package tk.comixloan.controller;

import java.util.Date;
import java.util.List;
import java.util.Map;

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
	
	private String nameSerie;
	
	@ManagedProperty(value = "#{param.idVolume}")
	private String idVolume;
	
	private Map<String, List<Volume>> series2Volumes;
	private String[] checkBoxVolumes;

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
		return "loan/insertVolume";
	}
	
	public String removeVolume(){
		this.loanFacade.removeVolume(this.currentLoan, new Long(idVolume));
		return "loan/insertVolme";
	}
	
	public String addVolume(){
		if (this.checkBoxVolumes != null){
			for(String id: this.checkBoxVolumes){
				this.loanFacade.addVolume(this.currentLoan, new Long(id));
			}
		}
		return "loan/insertVolume";
	}
	
	public String searchSeries(){
		
		return "loan/inserVolume";
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

	public String getNameSerie() {
		return nameSerie;
	}

	public void setNameSerie(String nameSerie) {
		this.nameSerie = nameSerie;
	}

	public String getIdVolume() {
		return idVolume;
	}

	public void setIdVolume(String idVolume) {
		this.idVolume = idVolume;
	}

	public Map<String, List<Volume>> getSeries2Volumes() {
		return series2Volumes;
	}

	public void setSeries2Volumes(Map<String, List<Volume>> series2Volumes) {
		this.series2Volumes = series2Volumes;
	}
	
	public String[] getCheckBoxVolumes() {
		return checkBoxVolumes;
	}
	
	public void setCheckBoxVolumes(String[] checkBoxVolumes) {
		this.checkBoxVolumes = checkBoxVolumes;
	}
}
