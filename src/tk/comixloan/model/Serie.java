package tk.comixloan.model;

import java.util.Date;

import javax.persistence.*;

@Entity
public class Serie {


	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Long id;
	
	@Column(nullable=false)
	private String name;

	@Column
	private String description;
	
	@Column
	@Temporal(TemporalType.TIMESTAMP)
	private Date date;
	
	@Column(nullable=false)
	private String editor;
	
	@Column(nullable = true) 
	private String author;

	public Serie() {}

	public Serie(String name, String description, Date date, String editor,
			String author) {
		super();
		this.name = name;
		this.description = description;
		this.date = date;
		this.editor = editor;
		this.author = author;
	}

	
	
	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
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

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public String getEditor() {
		return editor;
	}

	public void setEditor(String editor) {
		this.editor = editor;
	}

	public String getAuthor() {
		return author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}
	
	

}
