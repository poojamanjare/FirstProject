package com.model;

import java.io.Serializable;
import java.util.*;

import javassist.SerialVersionUID;

import javax.persistence.*;
import javax.validation.*;

import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

@SuppressWarnings("unused")
@Entity
@Component
@Table(name="CartDetails")

public class Cart implements Serializable 
{
	@Id
	@GeneratedValue
	private int cartId;
	
	private int cartProductId;
	
	@OneToOne(fetch=FetchType.LAZY)
	@JoinColumn(name="userMailId")
	private User cartUserDetails;
	private Double cartPrice;
	
	private int cartQuantity;
	private String cartImage;
	private String cartProductName;
	
	public Cart(int cartId,int cartProductId,User cartUserDetails,Double cartPrice,int cartQuantity)
	{
		this.cartId=cartId;
		this.cartProductId=cartProductId;
		this.cartUserDetails=cartUserDetails;
		this.cartPrice=cartPrice;
		this.cartQuantity=cartQuantity;
		
	}
	public Cart()
	{
		
	}
	
	public int getCartId() {
		return cartId;
	}
	public void setCartId(int cartId) {
		this.cartId = cartId;
	}
	public int getCartProductId() {
		return cartProductId;
	}
	public void setCartProductId(int cartProductId) {
		this.cartProductId = cartProductId;
	}
	public User getCartUserDetails() {
		return cartUserDetails;
	}
	public void setCartUserDetails(User cartUserDetails) {
		this.cartUserDetails = cartUserDetails;
	}
	public Double getCartPrice() {
		return cartPrice;
	}
	public void setCartPrice(Double cartPrice) {
		this.cartPrice = cartPrice;
	}
	public int getCartQuantity() {
		return cartQuantity;
	}
	public void setCartQuantity(int cartQuantity) {
		this.cartQuantity = cartQuantity;
	}
	public String getCartImage() {
		return cartImage;
	}
	public void setCartImage(String cartImage) {
		this.cartImage = cartImage;
	}
	public String getCartProductName() {
		return cartProductName;
	}
	public void setCartProductName(String cartProductName) {
		this.cartProductName = cartProductName;
	}
	
}
