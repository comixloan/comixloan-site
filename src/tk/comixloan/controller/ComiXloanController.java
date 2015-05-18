package tk.comixloan.controller;

import java.security.NoSuchAlgorithmException;

import javax.ejb.EJB;
import javax.enterprise.context.SessionScoped;
import javax.faces.bean.ManagedBean;

import tk.comixloan.facade.*;
import tk.comixloan.model.User;

@ManagedBean
@SessionScoped
public class ComiXloanController {
	
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
	
	
	

}
