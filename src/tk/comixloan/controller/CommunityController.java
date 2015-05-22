package tk.comixloan.controller;

import javax.annotation.PostConstruct;
import javax.ejb.EJB;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.SessionScoped;

import tk.comixloan.facade.CommunityFacade;
import tk.comixloan.model.Community;

@ManagedBean(name = "communityController")
@SessionScoped
public class CommunityController extends AbstractSessionController {
	@EJB
	private CommunityFacade communityFacade;
	private String name;
	private String description;
	private String username;
	private Community community;
	
	@PostConstruct
	public void initCommunity(){
		this.init();
		Long idCommunity = (Long) this.getSessionVariable("communityCorrent");
		if (idCommunity != null){
			this.community = this.communityFacade.get(idCommunity);
		}
	}
	
	public String createCommunity(){
		this.community = this.communityFacade.create(this.getCurrentUser().getId(), name, description);
		
		if (this.community == null){
			return "error/community";
		}else{
			return "community";
		}
	}
	
	public String addUser(){
		return null;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public Community getCommunity() {
		return community;
	}

	public void setCommunity(Community community) {
		this.putSessionVariable("communityCorrent", community.getId());
		this.community = community;
	}
	
}
