package com.niit.shoppingkart.Controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.niit.shoppingkart.DAO.SupplierDAO;
import com.niit.shoppingkart.model.Supplier;

@Controller
public class SupplierController{
	
	@Autowired
	SupplierDAO supplierDAO;
	
	@RequestMapping(value="/Supplier",method = RequestMethod.GET)
	public ModelAndView landPage(@ModelAttribute("supplier")Supplier supplier,BindingResult result,Model model)
	{
		
		ModelAndView mv= new ModelAndView("/Admin");
		mv.addObject("userclickedSupplier", "true");
		mv.addObject("allSupplier",supplierDAO.list());
		return mv;
		

		/*model.addAttribute("allData",supplierDAO.list());
		return "Supplier";*/
		
		
	}
	 
	/*@RequestMapping(value="/Supplier")
	public String getAllData(@ModelAttribute("supplier")Supplier supplier,BindingResult result,Model model)
	{
	
		model.addAttribute("allSupplier",supplierDAO.list());
		return "Supplier";
	}*/
	@RequestMapping(value="/addSupplier")
public String addItem(@ModelAttribute("supplier") Supplier s){
		
		this.supplierDAO.saveOrUpdate(s);
		return "redirect:/Supplier";
		
	}
	@RequestMapping(value="/SupplierById/{id}")
	public String editItem(@PathVariable("id") int id,RedirectAttributes redirectAttributes)
	{
		redirectAttributes.addFlashAttribute("supplier", this.supplierDAO.get(id));
		return "redirect:/Supplier";
		
}
	@RequestMapping(value="/deleteSupplierById/{id}")
	public String deleteItem(@PathVariable("id") int id,Supplier supplier)
	{
		supplierDAO.delete(supplier);
		return "redirect:/Supplier";
		
}	
}