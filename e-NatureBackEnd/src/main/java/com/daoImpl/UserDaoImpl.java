package com.daoImpl;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dao.UserDao;
import com.model.Product;
import com.model.User;

@SuppressWarnings("deprecation")
	@Repository("UserDaoImpl")
	public class UserDaoImpl implements UserDao
	{
		@Autowired							//It is a process which is used to create a single instance of the class 
											//and bind it to dispatcher servlet
		SessionFactory sessionFactory;		//SessionFactory is class(one client request required one session factory )
		
		public UserDaoImpl(SessionFactory sessionFactory)
		{
			super();
			this.sessionFactory=sessionFactory;
		}
		
		public void insertUser(User user)
		{
			Session session=sessionFactory.openSession();	//creating session object
			session.beginTransaction();						//creating transaction object
			session.saveOrUpdate(user);				//saveOrUpdate=persists or updates the given object. 
													//If id is found, it updates the record otherwise saves the record.
			session.getTransaction().commit();		//transaction is commited.commit=permanantly save transaction into db
			
		}
		public User findById(String email)
		{
			Session session=sessionFactory.openSession();
			session.beginTransaction();
			User u=null;
			try
			{
				session.getTransaction();
				u=session.get(User.class, email);
				session.getTransaction().commit();
			}
			catch(HibernateException ex)
			{
				ex.printStackTrace();
				session.getTransaction().rollback();//rollback=restore db to last commited state
			}
			return u;
			
		}

}
