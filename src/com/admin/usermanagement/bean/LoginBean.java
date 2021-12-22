/*
 * package com.admin.usermanagement.bean;

 * 
 * import java.io.Serializable;
 * 
 * import javax.persistence.Entity; import javax.persistence.Id; import
 * javax.persistence.JoinColumn;
 * 
 * @Entity public class LoginBean implements Serializable {
 *//**
	* 
	*//*
		 * @Id
		 * 
		 * @JoinColumn(name="username_PK") private static final long serialVersionUID =
		 * 1L; private String username; private String password;
		 * 
		 * public LoginBean() { super(); }
		 * 
		 * public LoginBean(String username, String password) { super(); this.username =
		 * username; this.password = password; }
		 * 
		 * public String getUsername() { return username; }
		 * 
		 * public void setUsername(String username) { this.username = username; }
		 * 
		 * public String getPassword() { return password; }
		 * 
		 * public void setPassword(String password) { this.password = password; } }
		 * 
		 * 
		 * package com.javatpoint.mapping;
		 * 
		 * import javax.persistence.*;
		 * 
		 * @Entity public class Student {
		 * 
		 * @Id
		 * 
		 * @GeneratedValue(strategy=GenerationType.AUTO) private int s_id; private
		 * String s_name; public int getS_id() { return s_id; } public void setS_id(int
		 * s_id) { this.s_id = s_id; } public String getS_name() { return s_name; }
		 * public void setS_name(String s_name) { this.s_name = s_name; }
		 * 
		 * 
		 * 
		 * 
		 * }
		 */










package com.admin.usermanagement.bean;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;


@Entity
@Table(name = "user_table")
public class LoginBean implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String username;
	private String password;
	
	
	public LoginBean() {
		
	}

	public LoginBean(String username, String password) {
		super();
		this.username = username;
		this.password = password;
	}
@Id
@GeneratedValue
@Column(name = "USERNAME")
	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}
@Column(name = "PASSWORD")
	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}
}