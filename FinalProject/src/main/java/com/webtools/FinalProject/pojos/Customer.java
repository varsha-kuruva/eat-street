package com.webtools.FinalProject.pojos;

import java.util.List;
import java.util.ArrayList;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import org.hibernate.annotations.FetchMode;
import org.hibernate.annotations.Fetch;

@Entity
@Table(name = "customer")
public class Customer {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "customer_id", updatable = false, nullable = false)
    private long customerId;
	
	@Column(name = "customer_name", nullable = false)
    private String customerName;
	
    
    @Column(name = "customer_email", unique = true, nullable = false)
    private String customerEmail;
    
    @Column(name = "customer_password", nullable = false)
    private String customerPassword;
    
    @Column(name = "customer_phone", nullable = false)
    private long customerPhone;
    
    @Column(name = "customer_reg_date", nullable = false)
    private String customerRegDate;
    
    @Fetch(FetchMode.SELECT)
    @OneToMany(fetch = FetchType.EAGER, mappedBy = "customer", cascade = { CascadeType.ALL }, orphanRemoval = true)
    private List<Orders> customerOrders;
    
    @OneToOne(cascade = { CascadeType.ALL })
    @JoinColumn(name = "cart_id")
    private Cart cart;
    
    public Customer() {
        this.customerOrders = new ArrayList<Orders>();
    }

	public long getCustomerId() {
		return customerId;
	}

	public String getCustomerName() {
		return customerName;
	}

	public void setCustomerName(String customerName) {
		this.customerName = customerName;
	}

	public String getCustomerEmail() {
		return customerEmail;
	}

	public void setCustomerEmail(String customerEmail) {
		this.customerEmail = customerEmail;
	}

	public String getCustomerPassword() {
		return customerPassword;
	}

	public void setCustomerPassword(String customerPassword) {
		this.customerPassword = customerPassword;
	}

	public long getCustomerPhone() {
		return customerPhone;
	}

	public void setCustomerPhone(long customerPhone) {
		this.customerPhone = customerPhone;
	}

	public String getCustomerRegDate() {
		return customerRegDate;
	}

	public void setCustomerRegDate(String customerRegDate) {
		this.customerRegDate = customerRegDate;
	}

	public List<Orders> getCustomerOrders() {
		return customerOrders;
	}

	public void setCustomerOrders(List<Orders> customerOrders) {
		this.customerOrders = customerOrders;
	}

	public Cart getCart() {
		return cart;
	}

	public void setCart(Cart cart) {
		this.cart = cart;
	}
    
	
}
