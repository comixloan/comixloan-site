package tk.comixloan.controller;

import java.util.List;

import javax.annotation.PostConstruct;
import javax.ejb.EJB;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.ManagedProperty;
import javax.faces.bean.SessionScoped;

import tk.comixloan.facade.CommunityFacade;
import tk.comixloan.model.Community;

@ManagedBean(name = "communityController")
public class CommunityController extends AbstractSessionController {
	@EJB
	private CommunityFacade communityFacade;
	private String name;
	private String description;
	private String username;
	private Community community;
	private List<Community> communities;
	
	@ManagedProperty(value="#{param.id}")
	private String community_id;
	
	@PostConstruct
	public void initCommunity(){
		this.init();
		Long idCommunity = (Long) this.getSessionVariable("communityCorrent");
		if (idCommunity != null){
			this.community = this.communityFacade.get(idCommunity);
		}
	}
	
	public String listCommunity(){
		this.communities = this.getCurrentUser().getCommunities();
		return "/listCommunity";
	}
	
	public String viewCommunity(){
		this.setCommunity(this.communityFacade.get(new Long(this.community_id)));
		
		if (this.community == null)
			return "/home";
		else
			return "/community";
	}
	
	public String createCommunity(){
		this.setCommunity(this.communityFacade.create(this.getCurrentUser().getId(), name, description));
		
		if (this.community == null){
			return "/home";
		}else{
			return "/community";
		}
	}
	
	public String addUser(){
		if(this.communityFacade.addUser(this.community.getId(),this.username )){
			this.initCommunity();
			return "community";
		}else
			return "addUserCommunity";		
		
	}
	
	/*
	 * --------------------------------------
	 * QUI INIZIANO I GETTTER E I SETTER
	 * --------------------------------------
	 * 
	 */

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
	
	public List<Community> getCommunities() {
		return communities;
	}
	
	public void setComunities(List<Community> communities) {
		this.communities = communities;
	}
	
	public String getCommunity_id() {
		return community_id;
	}
	
	public void setCommunity_id(String community_id) {
		this.community_id = community_id;
	}
}
