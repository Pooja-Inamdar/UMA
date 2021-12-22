package com.admin.usermanagement.bean;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name = "users")
public class User {

	private int id;
	private String name;
	private String email;
	private String country;
	private String role;

	public User() {
		super();
	}

	private LoginBean log;

	@OneToOne(cascade = CascadeType.ALL, fetch = FetchType.EAGER)
	@JoinColumn(name = "username")
	public LoginBean getLog() {
		return log;
	}

	public void setLog(LoginBean log) {
		this.log = log;
	}

	public User(String name, String email, String country, String role) {
		super();
		this.name = name;
		this.email = email;
		this.country = country;
		this.role = role;

	}

	public User(int id, String name, String email, String country, String role) {
		super();
		this.id = id;
		this.name = name;
		this.email = email;
		this.country = country;
		this.role = role;

	}

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "ID")
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}
@Column(name="NAME")
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
@Column(name = "EMAIL")
	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}
@Column(name="COUNTRY")
	public String getCountry() {
		return country;
	}

	public void setCountry(String country) {
		this.country = country;
	}
@Column(name="ROLE")
	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}
}
