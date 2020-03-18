package shop.controller;

import java.util.*;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import shop.bean.*;
import shop.chart.*;

@Transactional
@Controller
@RequestMapping("/admin")
public class AdminController {

	@Autowired
	SessionFactory factory;
	
	
	
	@RequestMapping("/home")
	public ModelAndView homeAdmin(ModelMap modelMap) {
		ModelAndView mav = new ModelAndView("/admin/pages/home");
//		Session session = factory.getCurrentSession();
//		String hql = "FROM ProductLine";
//		Query query = session.createQuery(hql);
//		List<ProductLine> list = query.list();
//		mav.addObject("list", list);
//		List<List<Map<Object, Object>>> canvasjsDataList = canvasjsChartService.getCanvasjsChartData();
//		mav.addObject("dataPointsList", canvasjsDataList);
		return mav;
	}
	/* 
	 * START PRODUCT 
	 * */
	@RequestMapping("/producttable")
	public ModelAndView productAdmin() {
		ModelAndView mav = new ModelAndView("/admin/pages/productTable");
		Session session = factory.getCurrentSession();
		String hql = "FROM Product";
		Query query = session.createQuery(hql);
		List<Product> list = query.list();
		hql = "FROM ProductLine";
		Query query1 = session.createQuery(hql);
		List<ProductLine> listProductLine = query1.list();
		mav.addObject("Product", list);
		mav.addObject("ProductLine", listProductLine);
		return mav;
	}
	
	@ModelAttribute("product")
	public Product productModel(Product pro) {
		Product p = new Product();
		p.setProductName(pro.getProductName());
		p.setProductDescription(pro.getProductDescription());
		p.setProductLine(pro.getProductLine());
		p.setQuantityInStock(pro.getQuantityInStock());
		p.setBuyPrice(pro.getBuyPrice());
		return p;
	}
	
	@RequestMapping(value = "/addProduct", method = RequestMethod.POST)
	public String creatrProduct(@ModelAttribute("product") Product product) {
		Session session = factory.openSession();
		Transaction tx = session.beginTransaction();
		session.save(product);
		session.flush();
		session.clear();
		tx.commit();
		return "redirect:producttable.htm";
	}
	
	@RequestMapping(value = "/removeProduct-{id}", method = RequestMethod.GET)
	public String removeProduct(@PathVariable("id") int id) {
		Session session = factory.openSession();
		Transaction tx = session.beginTransaction();
		String hql = "DELETE FROM Product p WHERE p.productId= :id";
		try {
			Query query = session.createQuery(hql);
			query.setInteger("id", id);
			int row = query.executeUpdate();
			tx.commit();
		} catch (Throwable t) {
			  tx.rollback();
			  throw t;
		}
		return "redirect:producttable.htm";
	}
	
	@RequestMapping(value = "/editProduct-{id}", method = RequestMethod.POST)
	public String editProduct(@ModelAttribute("product") Product product,
									@PathVariable("id") int id) {
		
		Session session = factory.openSession();
		Transaction tx = session.beginTransaction();
		Object o = session.load(Product.class, id);
		Product p = (Product)o;
		p.setProductName(product.getProductName());
		p.setProductLine(product.getProductLine());
		p.setProductDescription(product.getProductDescription());
		p.setQuantityInStock(product.getQuantityInStock());
		p.setBuyPrice(product.getBuyPrice());
		try {
			tx.commit();
		} catch (Throwable t) {
			tx.rollback();
			throw t;
		}
		return "redirect:producttable.htm";
	}
	/* 
	 * END PRODUCT 
	 * */
	
	
	
	/* 
	 * START PRODUCT LINE
	 * */
	@RequestMapping("/productlinetable")
	public ModelAndView productLineAdmin() {
		ModelAndView mav = new ModelAndView("/admin/pages/productLineTable");
		Session session = factory.getCurrentSession();
		String hql = "FROM ProductLine";
		Query query = session.createQuery(hql);
		List<ProductLine> list = query.list();
		mav.addObject("ProductLine", list);
		return mav;
	}
	
	@RequestMapping(value = "/remove-{id}", method = RequestMethod.GET)
	public String removeProductLine(@PathVariable("id") int id) {
		Session session = factory.openSession();
		Transaction tx = session.beginTransaction();
		String hql = "DELETE FROM ProductLine p WHERE p.productLineId= :id";
		try {
			Query query = session.createQuery(hql);
			query.setInteger("id", id);
			int row = query.executeUpdate();
			tx.commit();
		} catch (Throwable t) {
			  tx.rollback();
			  throw t;
		}
		return "redirect:productlinetable.htm";
	}
	
	@RequestMapping(value = "/addProductLine", method = RequestMethod.POST)
	public String creatrProductLine(@ModelAttribute("productLine") ProductLine productLine) {
		Session session = factory.openSession();
		Transaction tx = session.beginTransaction();
		session.save(productLine);
		session.flush();
		session.clear();
		tx.commit();
		return "redirect:productlinetable.htm";
	}
	
	@RequestMapping(value = "/editProductLine-{id}", method = RequestMethod.POST)
	public String editProductLine(@ModelAttribute("productLine") ProductLine productLine,
									@PathVariable("id") int id) {
		
		Session session = factory.openSession();
		Transaction tx = session.beginTransaction();
		Object o = session.load(ProductLine.class, id);
		ProductLine p = (ProductLine)o;
		p.setProductLine(productLine.getProductLine());
		p.setTextDescription(productLine.getTextDescription());
		try {
			tx.commit();
		} catch (Throwable t) {
			tx.rollback();
			throw t;
		}
		return "redirect:productlinetable.htm";
	}
	
	// test 
	@RequestMapping(value = "/formCreateProductLine")
	public ModelAndView test1() {
		ModelAndView m = new ModelAndView("/admin/pages/formCreateProductLine");
		return m;
	}
	
	// test
	@RequestMapping(value = "/add", method = RequestMethod.POST)
	public String test(@ModelAttribute("productLine") ProductLine productLine) {
		Session session = factory.openSession();
		Transaction tx = session.beginTransaction();
		session.save(productLine);
		session.flush();
		session.clear();
		tx.commit();
		return "redirect:productlinetable.htm";
	}
	
	@ModelAttribute("productLine")
	public ProductLine productLine(String name, String desc) {
		ProductLine p = new ProductLine();
		p.setProductLine(name);
		p.setTextDescription(desc);
		return p;
	}
	/* 
	 * END PRODUCT LINE
	 * */
}
