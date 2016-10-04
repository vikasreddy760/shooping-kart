package com.niit.shoppingkart.DAO;

import java.util.List;

import com.niit.shoppingkart.model.Category;



public interface CategoryDAO 
{

	public boolean saveOrUpdate (Category category);
	
	
	
	public  boolean delete(Category category);
	
	public Category get (int id);
	
	public List<Category> list();
	
	
	
	
	
	
}