package tk.comixloan.controller;

import java.util.List;

import tk.comixloan.model.*;

import javax.ejb.EJB;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.ManagedProperty;

import tk.comixloan.facade.HistoryLoanFacade;

@ManagedBean(name = "historyLoanController")
public class HistoryLoanController extends AbstractSessionController {
	@EJB
	private HistoryLoanFacade historyLoanFacade;
	
	@ManagedProperty(value = "#{param.id}")
	private Long idHistoryLoan;
	private HistoryLoan currentHistoryLoan;
	
	private List<HistoryLoan> listHistoryLoans;
	
	
	public String historyLoan(){
		Long idUser = this.getCurrentUser().getId();
		this.listHistoryLoans= historyLoanFacade.listHistoryLoanUser(idUser);
		return "/loan/historyLoan";
	}

	public String info(){
		this.currentHistoryLoan = this.historyLoanFacade.find(new Long(this.idHistoryLoan));
		return "/loan/infoHistoryLoan";
	}
	
	
	/*
	 * QUI iniziano i getter ed i setter
	 *
	 */

	public Long getIdHistoryLoan() {
		return idHistoryLoan;
	}


	public void setIdHistoryLoan(Long idHistoryLoan) {
		this.idHistoryLoan = idHistoryLoan;
	}


	public List<HistoryLoan> getListHistoryLoans() {
		return listHistoryLoans;
	}


	public void setListHistoryLoans(List<HistoryLoan> listHistoryLoans) {
		this.listHistoryLoans = listHistoryLoans;
	}

	public HistoryLoan getCurrentHistoryLoan() {
		return currentHistoryLoan;
	}

	public void setCurrentHistoryLoan(HistoryLoan currentHistoryLoan) {
		this.currentHistoryLoan = currentHistoryLoan;
	}
	
	

}
