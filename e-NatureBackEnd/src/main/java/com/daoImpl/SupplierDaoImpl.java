package com.daoImpl;

import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import com.dao.SupplierDao;
import com.model.Category;
import com.model.Product;
import com.model.Supplier;


@SuppressWarnings("deprecation")

@Repository("supplierDaoImpl")
public class SupplierDaoImpl implements SupplierDao 
{
	@Autowired
	SessionFactory sessionFactory;
	
	public SupplierDaoImpl(SessionFactory sessionFactory)
	{
		this.sessionFactory=sessionFactory;
	}
	
	public void insertSupplier(Supplier supplier)
	{
		Session session=sessionFactory.openSession();
		session.beginTransaction();
		session.saveOrUpdate(supplier);
		session.getTransaction().commit();
	}

	
	public List<Supplier>retrieve()
	{
		Session session=sessionFactory.openSession();
		session.beginTransaction();
		List<Supplier>list=session.createQuery("from Supplier").list();
		session.getTransaction().commit();
		return list;
	}
	
	public Supplier findById(int sid)
	{
		Session session=sessionFactory.openSession();
		Supplier p=null;
		try
		{
			session.beginTransaction();
			p=session.get(Supplier.class, sid);
			session.getTransaction().commit();
		}
		catch(HibernateException ex)
		{
			ex.printStackTrace();
			session.getTransaction().rollback();
		}
		return p;
		
	}
	
	public void deleteSupplier(int sid)
	{
		Session session=sessionFactory.openSession();
		session.beginTransaction();
		Supplier supplier=(Supplier)session.get(Supplier.class, sid);
		session.delete(supplier);
		session.getTransaction().commit();
	}

	public void update(Supplier s)
	{
		Session session=sessionFactory.openSession();
		try
		{
			session.beginTransaction();
			session.update(s);
			session.getTransaction().commit();
		}
		catch(HibernateException ex)
		{
			ex.printStackTrace();
			session.getTransaction().rollback();
		}
		
	}
	
}
