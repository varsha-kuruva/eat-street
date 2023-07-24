package com.webtools.FinalProject.pojos;

import java.util.List;
import java.util.ArrayList;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.Table;


@Entity
@Table(name = "item")
public class Item {
	
	@Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "item_id", updatable = false, nullable = false)
    private long itemId;
	
    @Column(name = "item_name", nullable = false)
    private String itemName;
    
    @Column(name = "item_category", nullable = false)
    private String itemCategory;
    
    @Column(name = "item_description", nullable = false)
    private String itemDescription;
    
    @Column(name = "item_price", nullable = false)
    private double itemPrice;
    
    @ManyToMany
    private List<Cart> cartList;
    
    @ManyToMany
    private List<Orders> orderList;
    
    public Item() {
    	this.cartList = new ArrayList<Cart>();
        this.orderList = new ArrayList<Orders>();
    }

	public long getItemId() {
		return itemId;
	}

	public String getItemName() {
		return itemName;
	}

	public void setItemName(String itemName) {
		this.itemName = itemName;
	}
	
	public String getItemCategory() {
		return itemCategory;
	}

	public void setItemCategory(String itemCategory) {
		this.itemCategory = itemCategory;
	}

	public String getItemDescription() {
		return itemDescription;
	}

	public void setItemDescription(String itemDescription) {
		this.itemDescription = itemDescription;
	}

	public double getItemPrice() {
		return itemPrice;
	}

	public void setItemPrice(double itemPrice) {
		this.itemPrice = itemPrice;
	}
	
	public List<Cart> getCartList() {
		return cartList;
	}

	public void setCartList(List<Cart> cartList) {
		this.cartList = cartList;
	}

	public List<Orders> getOrderList() {
		return orderList;
	}

	public void setOrderList(List<Orders> orderList) {
		this.orderList = orderList;
	}
    

}
