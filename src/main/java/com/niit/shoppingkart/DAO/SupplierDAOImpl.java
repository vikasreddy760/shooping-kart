package com.niit.shoppingkart.DAO;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.niit.shoppingkart.model.Supplier;



@SuppressWarnings("deprecation")
@Repository

public class SupplierDAOImpl implements SupplierDAO
{

	@Autowired
	private SessionFactory sessionFactory;


	public  SupplierDAOImpl(SessionFactory sessionFactory){
		
		this.sessionFactory = sessionFactory;
		
	
	}

	@Transactional
	
	public boolean saveOrUpdate(Supplier supplier)
	
	{
		
		try 
		{
			
			sessionFactory.getCurrentSession().saveOrUpdate(supplier);			
			return true;
		} 
		
		catch (Exception e) 
		
		{
			
			e.printStackTrace();
			
			return false;
		}
	
	} 

	@Transactional
	
	
	public boolean delete(Supplier supplier)
	
	{     
		
		try
		{
			
			sessionFactory.getCurrentSession().delete(supplier);
			
			return true;
		
		}
		 
		catch (Exception e)
		
		{
			e.printStackTrace();
		
			return false;
		}
		
	}

	
	@Transactional
	
	public Supplier get(int id) 
	
	{
		
		String hql = "from"+" Supplier"+" where id=" +id;
		
		@SuppressWarnings("rawtypes")
		
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		
		@SuppressWarnings("unchecked")
		
		List<Supplier> listSupplier = (List<Supplier>) query.list();
		
		if (listSupplier != null && !listSupplier.isEmpty()) {
			
			return listSupplier.get(0);
		}
		
		return null;
	}
	
	@SuppressWarnings("deprecation")

	@Transactional
	
  
	public List<Supplier> list(){
		
		@SuppressWarnings("unchecked")
		
		List<Supplier> listSupplier = (List<Supplier>)
		
		sessionFactory.getCurrentSession()
		
		.createCriteria(Supplier.class)
		
		.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY).list();
		
		return listSupplier;
	}
}


