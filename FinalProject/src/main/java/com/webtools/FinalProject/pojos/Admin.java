package com.webtools.FinalProject.pojos;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;


@Entity
@Table(name = "admin")
public class Admin {
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "admin_id", updatable = false, nullable = false)
    private long adminId;
	
	@Column(name = "admin_email", nullable = false)
    private String adminEmail;
	
    @Column(name = "admin_name", nullable = false)
    private String adminName; 
    
    @Column(name = "admin_phone", nullable = false)
    private long adminPhone;
    
    @Column(name = "admin_password", nullable = false)
    private String adminPassword;
   

	public long getAdminId() {
		return adminId;
	}

	public String getAdminEmail() {
		return adminEmail;
	}

	public void setAdminEmail(String adminEmail) {
		this.adminEmail = adminEmail;
	}
	
	public String getAdminName() {
		return adminName;
	}

	public void setAdminName(String adminName) {
		this.adminName = adminName;
	}
	
	public long getAdminPhone() {
		return adminPhone;
	}

	public void setAdminPhone(long adminPhone) {
		this.adminPhone = adminPhone;
	}

	public String getAdminPassword() {
		return adminPassword;
	}

	public void setAdminPassword(String adminPassword) {
		this.adminPassword = adminPassword;
	}
    
    

}
