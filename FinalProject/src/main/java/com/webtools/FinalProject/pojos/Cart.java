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
@Table(name = "cart")
public class Cart {
	
	 @Id
	 @GeneratedValue(strategy = GenerationType.AUTO)
	 @Column(name = "cart_id", updatable = false, nullable = false)
	 private long cartId;
	 
	 @ManyToMany
	 private List<Item> itemsCart;
	    
	 public Cart() {
		 this.itemsCart = new ArrayList<Item>();
	 }

	public long getCartId() {
		return cartId;
	}

	public List<Item> getItemsCart() {
		return itemsCart;
	}

	public void setItemsCart(List<Item> itemsCart) {
		this.itemsCart = itemsCart;
	}

	
	 
	 
	 
}
