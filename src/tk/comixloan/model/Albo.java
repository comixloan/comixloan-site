package tk.comixloan.model;

import javax.persistence.*;

@Entity
public class Albo {
	
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

	public Albo(Long id, Long vol, Double price, Serie serie) {
		super();
		this.id = id;
		this.vol = vol;
		this.price = price;
		this.serie = serie;
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
}
