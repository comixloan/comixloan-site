package tk.comixloan.model;

import javax.persistence.*;

@Entity
public class Volume {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	
	@Column(nullable = false)
	private Long vol;
	
	@Column(nullable = false)
	private Double price;
	
	@Column(nullable = false)
	@ManyToOne
	private Serie serie;
	
	@Column(nullable = true, length = 2000)
	private String description;
	
	public Volume() {}

	public Volume(Long vol, Double price, Serie serie) {
		super();
		this.vol = vol;
		this.price = price;
		this.serie = serie;
		this.description = null;
	}
	
	public Volume(Long vol, Double price, Serie serie, String description) {
		super();
		this.vol = vol;
		this.price = price;
		this.serie = serie;
		this.description = description;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Long getVol() {
		return vol;
	}

	public void setVol(Long vol) {
		this.vol = vol;
	}

	public Double getPrice() {
		return price;
	}

	public void setPrice(Double price) {
		this.price = price;
	}

	public Serie getSerie() {
		return serie;
	}

	public void setSerie(Serie serie) {
		this.serie = serie;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}
}
