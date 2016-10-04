package com.niit.shoppingkart.DAO;

import java.util.List;

import com.niit.shoppingkart.model.Product;

public interface ProductDAO 
{

	public boolean saveOrUpdate(Product product);
	public boolean delete(Product product);
	public Product get(int id);
	public List<Product> list();


	
	
	

}
