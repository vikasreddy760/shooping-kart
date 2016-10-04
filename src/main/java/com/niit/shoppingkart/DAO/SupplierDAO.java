package com.niit.shoppingkart.DAO;

import java.util.List;

import com.niit.shoppingkart.model.Supplier;

public interface SupplierDAO 
{

	
		public boolean saveOrUpdate (Supplier supplier);
		
		
		
		public  boolean delete(Supplier supplier);
		
		public Supplier get (int id);
		
		public List<Supplier> list();
		
		
		
		
		
		
	}
	
	

