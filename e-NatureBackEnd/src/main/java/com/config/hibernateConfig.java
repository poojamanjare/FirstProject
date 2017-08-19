package com.config;

import java.util.Properties;

import javax.sql.DataSource;

import org.hibernate.SessionFactory;						//To create object of hibernate session
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.jdbc.datasource.DriverManagerDataSource;
import org.springframework.orm.hibernate5.HibernateTransactionManager;
import org.springframework.orm.hibernate5.LocalSessionFactoryBuilder;
import org.springframework.transaction.annotation.EnableTransactionManagement;

import com.daoImpl.CartDaoImpl;
import com.daoImpl.CategoryDaoImpl;
import com.daoImpl.OrderDaoImpl;
import com.daoImpl.ProductDaoImpl;
import com.daoImpl.SupplierDaoImpl;
import com.daoImpl.UserDaoImpl;
import com.model.Cart;
import com.model.Category;
import com.model.Order;
import com.model.Product;
import com.model.Supplier;
/*import com.daoImpl.UserDaoImpl;*/
import com.model.User;


@Configuration				//Used to configure hibernate properties
							//indicates that this class contains one or more bean methods annotated 
							//with @Bean producing beans manageable by spring container.
@ComponentScan("com.*")			//Used to scan model class   
								//(com.*)=under com package,scan all folder and classes & perform transaction
@EnableTransactionManagement	//it is equivalent to Spring’s tx:* XML namespace, 
								//enabling Spring’s annotation-driven transaction management capability
public class hibernateConfig{

@Autowired						//(Bean id has to be included in dispatcher-servlet)					
								//@Autowired is used for automatically added to dispatcher servlet.
								
@Bean(name="dataSource")	//"dataSource"=bean name
public DataSource getH2DataSource()
{
System.out.println("Data Source Method");
DriverManagerDataSource dataSource = new DriverManagerDataSource();
dataSource.setDriverClassName("org.h2.Driver");			//driver class
dataSource.setUrl("jdbc:h2:tcp://localhost/~/test");	//JDBC URL
dataSource.setUsername("sa");							//username
dataSource.setPassword("");								//password

System.out.println("Data Source Created");
return dataSource;
}
private Properties getHibernateProperties() 
{
System.out.println("************************Database h2 is connected******************************");
Properties properties = new Properties();
properties.put("hibernate.dialect", "org.hibernate.dialect.H2Dialect");
properties.put("hibernate.hbm2ddl.auto", "update");		//update=it create table if is not present and update the table
														//we can also used create but it only create table not update it
//You can enable many hibernate properties like automatic table creation by hbm2ddl.auto etc. in applicationContext.xml file.
properties.put("hibernate.show_sql", "true");	//show_sql=will show sql query on console
return properties;
}

@Autowired
@Bean(name = "sessionFactory")
public SessionFactory getSessionFactory(DataSource dataSource) {
LocalSessionFactoryBuilder sessionBuilder = new LocalSessionFactoryBuilder(dataSource);
sessionBuilder.addProperties(getHibernateProperties());
sessionBuilder.addAnnotatedClass(User.class); 
sessionBuilder.addAnnotatedClass(Category.class); 
sessionBuilder.addAnnotatedClass(Product.class); 
sessionBuilder.addAnnotatedClass(Supplier.class); 
sessionBuilder.addAnnotatedClass(Cart.class); 
sessionBuilder.addAnnotatedClass(Order.class); 



//sessionBuilder.scanPackages("com.model");
return sessionBuilder.buildSessionFactory();
}

@Autowired
@Bean(name="UserDaoImpl")
public UserDaoImpl getUserDAO(SessionFactory sessionFactory)
{
return new UserDaoImpl(sessionFactory);
}

@Autowired
@Bean(name="CategoryDaoImpl")
public CategoryDaoImpl getCategoryDAO(SessionFactory sessionFactory)
{
return new CategoryDaoImpl(sessionFactory);
}

@Autowired
@Bean(name="ProductDaoImpl")
public ProductDaoImpl getProductDAO(SessionFactory sessionFactory)
{
return new ProductDaoImpl(sessionFactory);
}

@Autowired
@Bean(name="SupplierDaoImpl")
public SupplierDaoImpl getSupplierDAO(SessionFactory sessionFactory)
{
return new SupplierDaoImpl(sessionFactory);
}

@Autowired
@Bean(name="CartDaoImpl")
public CartDaoImpl getCartDAO(SessionFactory sessionFactory)
{
return new CartDaoImpl(sessionFactory);
}

@Autowired
@Bean(name="OrderDaoImpl")
public OrderDaoImpl getOrderDAO(SessionFactory sessionFactory)
{
return new OrderDaoImpl(sessionFactory);
}



@Autowired
@Bean(name = "transactionManager")
public HibernateTransactionManager getTransactionManager(SessionFactory sessionFactory) 
{
System.out.println("Transaction.....");
HibernateTransactionManager transactionManager = new HibernateTransactionManager(sessionFactory);
return transactionManager;
}
}