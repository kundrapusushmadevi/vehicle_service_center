package com.vsc.entity;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name = "users")
public class UserEntity {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	@Column(name = "name")
	private String name;
	
	@Column(name = "email")
	private String email;
	
	@Column(name = "phone")
	private String phone;
//    private String vehicleNumber;
//    private String vehicleType;
//    private String serviceType;
	 
	@Column(name = "vehicle")
	private String vehicle;
	
	@Column(name = "password")
	private String password;
	
	@Column(name = "created_date")
	private String created_date;

	public UserEntity() {
		super();
	}

	public UserEntity(String name, String email, String phone, String vehicle, String created_date) {
	    this.name = name;
	    this.email = email;
	    this.phone = phone;
	    this.vehicle = vehicle;
	    this.created_date = created_date;
	}

	public UserEntity(int id, String name, String email, String phone, String vehicle, String created_date) {
	    this.id = id;
	    this.name = name;
	    this.email = email;
	    this.phone = phone;
	    this.vehicle = vehicle;
	    this.created_date = created_date;
	}
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public void setVehicle(String vehicle) {
	    this.vehicle = vehicle;
	}
    
	public String getVehicle() {
	    return vehicle;
	}
	
	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getDate_created() {
		return created_date;
	}

	public void setDate_created(String date_created) {
		this.created_date = date_created;
	}

}