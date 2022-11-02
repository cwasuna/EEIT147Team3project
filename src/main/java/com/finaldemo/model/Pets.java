package com.finaldemo.model;

import java.util.Date;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;

@Entity
@Table(name="Pets")
public class Pets {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer petId;
	
	private String petName;
	
	private String petPhotoPath;
	
	private Integer petType;
	
	@JsonFormat(pattern = "yyyy/MM/dd", timezone = "Asia/Taipei") // JSON
	@DateTimeFormat(pattern = "yyyy/MM/dd") // SpringMVC
	@Temporal(TemporalType.TIMESTAMP)
	private Date petBirthday;
	
	private Integer petGender;
	
	private String petDescription;
	
	@ManyToOne(fetch = FetchType.EAGER, targetEntity = Users.class)
	@JoinColumn(name = "fk_user_id", referencedColumnName = "userId")
	private Users petUser;
	
	public Pets() {
	}
	
	public Pets(String petName, Integer petType, Date petBirthday,
			Integer petGender, String petDescription, Users petUser) {
		super();
		this.petName = petName;
		this.petType = petType;
		this.petBirthday = petBirthday;
		this.petGender = petGender;
		this.petDescription = petDescription;
		this.petUser = petUser;
	}

	public Integer getPetId() {
		return petId;
	}

	public void setPetId(Integer petId) {
		this.petId = petId;
	}

	public String getPetName() {
		return petName;
	}

	public void setPetName(String petName) {
		this.petName = petName;
	}

	public String getPetPhotoPath() {
		return petPhotoPath;
	}

	public void setPetPhotoPath(String petPhotoPath) {
		this.petPhotoPath = petPhotoPath;
	}

	public Integer getPetType() {
		return petType;
	}

	public void setPetType(Integer petType) {
		this.petType = petType;
	}

	public Date getPetBirthday() {
		return petBirthday;
	}

	public void setPetBirthday(Date petBirthday) {
		this.petBirthday = petBirthday;
	}

	public Integer getPetGender() {
		return petGender;
	}

	public void setPetGender(Integer petGender) {
		this.petGender = petGender;
	}

	public String getPetDescription() {
		return petDescription;
	}

	public void setPetDescription(String petDescription) {
		this.petDescription = petDescription;
	}

	public Users getPetUser() {
		return petUser;
	}

	public void setPetUser(Users petUser) {
		this.petUser = petUser;
	}
	
	
}
