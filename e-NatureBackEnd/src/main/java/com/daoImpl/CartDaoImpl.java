package com.daoImpl;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import com.dao.ProductDao;
import com.model.Cart;
import com.model.Category;
import com.model.Product;

@SuppressWarnings("deprecation")		//supress the complie time warning

@Repository("CartDaoImpl")
public class CartDaoImpl 
{
	@Autowired
	SessionFactory sessionFactory;
	
	public CartDaoImpl(SessionFactory sessionFactory)
	{
		this.sessionFactory=sessionFactory;
	}
	//=================insert into cart==================================
	public void insert(Cart cart)
	{
		Session session=sessionFactory.openSession();
		session.beginTransaction();
		session.saveOrUpdate(cart);
		session.getTransaction().commit();
	}
	
	//===============find Mycart by Id===========================================
	@SuppressWarnings("unused")
	public List<Cart> findCartById(String userId)
	{
		Session session=sessionFactory.openSession();
		List<Cart> cr=null;
		try
		{
			session.beginTransaction();
			cr=(List<Cart>)session.createQuery("from Cart where userMailId=:email").setString("email",userId).list();
			session.getTransaction().commit();
		}
		catch(HibernateException ex)
		{
			ex.printStackTrace();
			session.getTransaction().rollback();
		}
		return cr;
		
	}
	//==============================get Mycart by id==========================================================
	public Cart getCartById(int cartId,String userEmail)
	{
		Session session=sessionFactory.openSession();
		Cart cr=null;
		session.beginTransaction();
		cr=(Cart)session.createQuery("from Cart where userMailId=:email and cartProductId=:id").setString("email",userEmail).setInteger("id", cartId).uniqueResult();
		session.getTransaction().commit();
		return cr;		
	}
	//=====================delete cart===============================================================
	public void deleteCart(int cartId)
	{
		Session session=sessionFactory.openSession();
		session.beginTransaction();
		Cart cr=(Cart)session.get(Cart.class, cartId);
		session.delete(cr);
		session.getTransaction().commit();
	}
	//====================update cart====================================================
	public void update(Cart cr)
	{
		Session session=sessionFactory.openSession();
		session.beginTransaction();
		session.update(cr);
		session.getTransaction().commit();
	}

}
