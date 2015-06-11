package tk.comixloan.controller;

import java.util.List;

import tk.comixloan.model.*;

import javax.ejb.EJB;
import javax.faces.bean.ManagedBean;

import tk.comixloan.facade.HistoryLoanFacade;

@ManagedBean(name = "historyLoanController")
public class HistoryLoanController extends AbstractSessionController {
	@EJB
	private HistoryLoanFacade historyLoanFacade;
	private Long idHistoryLoan;
	private List<HistoryLoan> listHistoryLoans;
	
	
	public String historyLoan(){
		Long idUser = this.getCurrentUser().getId();
		this.listHistoryLoans= historyLoanFacade.listHistoryLoanUser(idUser);
		return "/loan/historyLoan.jsp";
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

}
