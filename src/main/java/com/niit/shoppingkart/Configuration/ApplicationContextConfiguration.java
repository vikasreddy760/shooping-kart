package com.niit.shoppingkart.Configuration;

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

import com.niit.shoppingkart.DAO.*;
import com.niit.shoppingkart.model.*;


@Configuration
@ComponentScan("com.niit.shoppingcart")
@EnableTransactionManagement
public class ApplicationContextConfiguration{
	
	@Bean(name = "dataSource")
	public DataSource getDataSource() {
		DriverManagerDataSource dataSource = new DriverManagerDataSource();
		dataSource.setDriverClassName("org.h2.Driver");
		dataSource.setUrl("jdbc:h2:tcp://localhost/~/test");
		dataSource.setUsername("sa");
		dataSource.setPassword("");
		System.out.println("dataSource");
		return dataSource;

	}

	private Properties getHibernateProperties() {
		Properties properties = new Properties();
		properties.put("hibernate.show_sql", "true");
		properties.put("hibernate.dialect", "org.hibernate.dialect.H2Dialect");
		/*properties.put("hbm2ddl.auto", "create");
		properties.put("hbm2ddl.auto", "update");*/
		System.out.println("Hibernate Properties");
		return properties;

	}

	@Autowired
	@Bean(name = "sessionFactory")
	public SessionFactory getSessionFactory(DataSource dataSource) {
		LocalSessionFactoryBuilder sessionBuilder = new LocalSessionFactoryBuilder(dataSource);
		sessionBuilder.addProperties(getHibernateProperties());
		sessionBuilder.addAnnotatedClasses(Category.class);
		sessionBuilder.addAnnotatedClasses(Product.class);
		sessionBuilder.addAnnotatedClasses(Supplier.class);
		System.out.println("Session");
		
		return sessionBuilder.buildSessionFactory();
		
	}

	@Autowired
	@Bean(name = "transactionManager")
	public HibernateTransactionManager getTransactionManager(SessionFactory sessionFactory) {
		HibernateTransactionManager transactionManager = new HibernateTransactionManager(sessionFactory);
		System.out.println("Transaction");
		return transactionManager;
	}

	@Autowired
	@Bean(name = "categoryDAO")
	public CategoryDAO getCategoryDao(SessionFactory sessionFactory) {
		return new CategoryDAOImpl(sessionFactory);
	}
	
	@Autowired
	@Bean(name = "productDAO")
	public ProductDAO getProductDao(SessionFactory sessionFactory) 
	{
		System.out.println("Product");	
		return new ProductDAOImpl(sessionFactory);
	}
	
	@Autowired
	@Bean(name = "supplierDAO")
	public SupplierDAO getSupplierDao(SessionFactory sessionFactory) {
			return new SupplierDAOImpl(sessionFactory);
	}
	/*@Autowired
	@Bean(name = "userDetailsDAO")
	public UserDetailsDAO getUserDetailsDAO(SessionFactory sessionFactory) {
			return new UserDetailsDAOImpl(sessionFactory);
	}
	@Autowired
	@Bean(name = "cartDAO")
	public CartDAO getCartDAO(SessionFactory sessionFactory) {
			return new CartDAOImpl(sessionFactory);
	}*/
	
	   }	

