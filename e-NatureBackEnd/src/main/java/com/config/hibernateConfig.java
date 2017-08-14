package com.config;

import java.util.Properties;

import javax.sql.DataSource;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.jdbc.datasource.DriverManagerDataSource;
import org.springframework.orm.hibernate5.HibernateTransactionManager;
import org.springframework.orm.hibernate5.LocalSessionFactoryBuilder;
import org.springframework.transaction.annotation.EnableTransactionManagement;

import com.daoImpl.CategoryDaoImpl;
import com.daoImpl.ProductDaoImpl;
import com.daoImpl.SupplierDaoImpl;
import com.daoImpl.UserDaoImpl;
/*import com.model.Cart;*/
import com.model.Category;
/*import com.model.Order;*/
import com.model.Product;
import com.model.Supplier;
/*import com.daoImpl.UserDaoImpl;*/
import com.model.User;


@Configuration
@ComponentScan("com")
@EnableTransactionManagement
public class hibernateConfig{

@Autowired
@Bean(name="dataSource")
public DataSource getH2DataSource()
{
System.out.println("Data Source Method");
DriverManagerDataSource dataSource = new DriverManagerDataSource();
dataSource.setDriverClassName("org.h2.Driver");
dataSource.setUrl("jdbc:h2:tcp://localhost/~/test");
dataSource.setUsername("sa");
dataSource.setPassword("");

System.out.println("Data Source Created");
return dataSource;
}
private Properties getHibernateProperties() 
{
System.out.println("after h2 connection................");
Properties properties = new Properties();
properties.put("hibernate.dialect", "org.hibernate.dialect.H2Dialect");
properties.put("hibernate.hbm2ddl.auto", "update");
properties.put("hibernate.show_sql", "true");
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
/*sessionBuilder.addAnnotatedClass(Cart.class); 
sessionBuilder.addAnnotatedClass(Order.class); */



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

/*@Autowired
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
}*/



@Autowired
@Bean(name = "transactionManager")
public HibernateTransactionManager getTransactionManager(SessionFactory sessionFactory) 
{
System.out.println("Transaction.....");
HibernateTransactionManager transactionManager = new HibernateTransactionManager(sessionFactory);
return transactionManager;
}
}