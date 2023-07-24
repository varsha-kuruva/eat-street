package com.webtools.FinalProject.pojos;

import java.util.List;
import java.util.ArrayList;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.Table;


@Entity
@Table(name = "orders")
public class Orders {
	
	@Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "order_id", updatable = false, nullable = false)
    private long orderId;
	
	@Column(name = "order_status", nullable = false)
	private String orderStatus;
	
    @Column(name = "order_total", nullable = false)
    private double orderTotal;
    
    @Column(name = "order_date", nullable = false)
    private String orderDate;
    
    @ManyToOne
    @JoinColumn(name = "customer_id", nullable = false)
    private Customer customer;
    
    @ManyToMany
    private List<Item> itemsOrder;
    
    public Orders() {
        this.itemsOrder = new ArrayList<Item>();
    }

	public long getOrderId() {
		return orderId;
	}
	
	public String getOrderStatus() {
		return orderStatus;
	}

	public void setOrderStatus(String orderStatus) {
		this.orderStatus = orderStatus;
	}

	public double getOrderTotal() {
		return orderTotal;
	}

	public void setOrderTotal(double orderTotal) {
		this.orderTotal = orderTotal;
	}
	
	public String getOrderDate() {
		return orderDate;
	}

	public void setOrderDate(String orderDate) {
		this.orderDate = orderDate;
	}

	public Customer getCustomer() {
		return customer;
	}

	public void setCustomer(Customer customer) {
		this.customer = customer;
	}

	public List<Item> getItemsOrder() {
		return itemsOrder;
	}

	public void setItemsOrder(List<Item> itemsOrder) {
		this.itemsOrder = itemsOrder;
	}
    
    

}
