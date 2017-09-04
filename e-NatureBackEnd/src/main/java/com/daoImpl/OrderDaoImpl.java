package com.daoImpl;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import com.model.Order;


@SuppressWarnings("deprecation")

@Repository("OrderDaoImpl")

public class OrderDaoImpl 
{
	@Autowired
	SessionFactory sessionFactory;
	
	public OrderDaoImpl(SessionFactory sessionFactory)
	{
		this.sessionFactory=sessionFactory;
	}
	//=================insert order into order table==================================
	public void insert(Order order)
	{
		Session session=sessionFactory.openSession();
		session.beginTransaction();
		session.saveOrUpdate(order);
		session.getTransaction().commit();
	}

}