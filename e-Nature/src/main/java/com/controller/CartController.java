package com.controller;

import java.io.BufferedOutputStream;
import java.io.FileOutputStream;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.bytebuddy.asm.Advice.Return;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.daoImpl.CartDaoImpl;
import com.daoImpl.CategoryDaoImpl;
import com.daoImpl.OrderDaoImpl;
import com.daoImpl.ProductDaoImpl;
import com.daoImpl.SupplierDaoImpl;
import com.daoImpl.UserDaoImpl;
import com.model.Cart;
import com.model.Order;
import com.model.User;

import java.security.*;
import java.util.List;

import jdk.nashorn.internal.ir.RuntimeNode.Request;

@Controller
public class CartController 
{
	@Autowired
	CategoryDaoImpl categoryDaoImpl;
	
	@Autowired
	ProductDaoImpl productDaoImpl;
	
	@Autowired
	SupplierDaoImpl supplierDaoImpl;
	
	@Autowired
	CartDaoImpl cartDaoImpl;
	
	@Autowired
	OrderDaoImpl orderDaoImpl;
	
	@Autowired
	UserDaoImpl userDaoImpl;
	
	//======================MyCart=================================
		@RequestMapping(value="/goToCart",method=RequestMethod.GET)
		public ModelAndView goToCart(HttpServletRequest request)
		{
			ModelAndView mav=new ModelAndView();
			Principal principal=request.getUserPrincipal();
			String userEmail=principal.getName();
			mav.addObject("cartInfo", cartDaoImpl.findCartById(userEmail));
			mav.setViewName("Cart");
			return mav;
		}

	//=========================add to cart==============================================
	@RequestMapping(value="/addToCart",method=RequestMethod.POST)
	public ModelAndView addToCart(HttpServletRequest request)
	{

		ModelAndView mav=new ModelAndView();
		
		try
		{
			Principal principal=request.getUserPrincipal();
			String userEmail=principal.getName();
			int pid=Integer.parseInt(request.getParameter("pid"));
			Double price=Double.parseDouble(request.getParameter("pPrice"));
			int quantity=Integer.parseInt(request.getParameter("qty"));
			String productName=request.getParameter("pName");
			String imgName=request.getParameter("imgname");
			Cart exists=cartDaoImpl.getCartById(pid, userEmail);
			if(exists==null)
			{
				Cart c=new Cart();
				c.setCartPrice(price);
				c.setCartImage(imgName);
				c.setCartProductName(productName);
				c.setCartQuantity(quantity);
				c.setCartProductId(pid);
				User u=userDaoImpl.findById(userEmail);
				c.setCartUserDetails(u);
				cartDaoImpl.insert(c);
			}
			else if(exists!=null)
			{
				Cart c=new Cart();
				c.setCartId(exists.getCartId());
				c.setCartPrice(price);
				c.setCartImage(imgName);
				c.setCartProductName(productName);
				c.setCartQuantity(quantity);
				c.setCartProductId(pid);
				User u=userDaoImpl.findById(userEmail);
				c.setCartUserDetails(u);
				cartDaoImpl.update(c);
				
			}
			mav.addObject("cartInfo",cartDaoImpl.findCartById(userEmail));
			mav.setViewName("Cart");
			return mav;
		}
		catch(Exception e)
		{
			mav.setViewName("login");
			return mav;
		}
	}
	//===================================saving order(invoice process)=============================================
	@RequestMapping(value="/invoiceProcess",method=RequestMethod.POST)
	public ModelAndView orderSave(HttpServletRequest request)
	{
		ModelAndView mav=new ModelAndView("invoice");
		Order ord=new Order();
		Principal principal=request.getUserPrincipal();
		String userEmail=principal.getName();
		Double total=Double.parseDouble(request.getParameter("total"));
		/*int quantity=Integer.parseInt(request.getParameter("quant"));*/
		String payment=request.getParameter("payment");
		User user=userDaoImpl.findById(userEmail);
		ord.setTotal(total);
		ord.setUser(user);
		ord.setPayment(payment);
		orderDaoImpl.insert(ord);
		mav.addObject("orderDetails",user);
		return mav;
	}
	//============================CHECKOUT=====================================
	@RequestMapping(value="/checkout",method=RequestMethod.GET)
	public ModelAndView checkoutProcess(HttpServletRequest request)
	{
		ModelAndView mav=new ModelAndView("checkout");
		Principal principal=request.getUserPrincipal();
		String userEmail=principal.getName();
		User user=userDaoImpl.findById(userEmail);
		List<Cart>cart=(List<Cart>) cartDaoImpl.findCartById(userEmail);
		mav.addObject("user", user);
		mav.addObject("cart", cart);
		return mav;
	}
	//==================Delete from Cart===========================================
	@RequestMapping(value="/deleteCart/{cartId}")
	public ModelAndView deleteCartItem(@PathVariable("cartId")int cartId,HttpServletRequest request)
	{
		ModelAndView mav=new ModelAndView("checkout");
		Principal principal=request.getUserPrincipal();
		String userEmail=principal.getName();
		cartDaoImpl.deleteCart(cartId);
		mav.addObject("cartInfo", cartDaoImpl.findCartById(userEmail));
		mav.setViewName("Cart");
		return mav;
	}
	
	//================================================================
	/*@RequestMapping("/editItem")
	public String edit()
	{
		return "Cart";
	} 
	
	//=======================================================================
		@RequestMapping("/ack")
		public String acknowledgement()
		{
			return "acknowledge";
		}*/
	
}
