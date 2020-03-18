package shop.controller;

import shop.bean.*;

import java.util.ArrayList;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ProductController {
	@Autowired
	SessionFactory factory;
	
	@Transactional
	@RequestMapping("/products-{productline}")
	public ModelAndView productPage(@PathVariable("productline") String productline, Model model) {
		ModelAndView mav = new ModelAndView("/webpage/productPage");
		Session session = factory.getCurrentSession();
		String hql = "FROM Product p WHERE p.productLine = '" + productline +"'";
		model.addAttribute("productline", productline);
		Query q = session.createQuery(hql);
		List<Product> list = q.list();
		mav.addObject("product", list);
		return mav;
	}
	
	@RequestMapping("/listproduct-page{id}")
	public ModelAndView getListProduct(@PathVariable("id") int id) {
		ModelAndView mav = new ModelAndView("/webpage/listProductPage");
		Session session = factory.openSession();
		String hql = "FROM Product";
		Query query = session.createQuery(hql);
		query.setFirstResult(6*id-5);
		query.setMaxResults(6*id);
		List<Product> list = query.list();
		
		Query q = session.createQuery(hql);
		List<Product> list1 = q.list();
		int quantityPage = list1.size()/6;
		if (quantityPage != 0) {
			if(quantityPage % 6 != 0) quantityPage++;
		}
		else {
			quantityPage++;
		}
		List<Integer> listPage = new ArrayList<Integer>();
		for (int i = 1; i <= quantityPage; i++) {
			listPage.add(i);
		}
		mav.addObject("listproduct", list);
		mav.addObject("quantityPage", listPage);
		return mav;
	}
	
	@RequestMapping("/search?word={word}")
	public ModelAndView searchKeyword(@PathVariable("word") String word) {
		ModelAndView mav = new ModelAndView("/webpage/resultSearchPage");
		Session session = factory.openSession();
		String hql = "FROM Product p WHERE p.productName LIKE '%' || " + word +"|| '%'" ;
		Query query = session.createQuery(hql);
		List<Product> list = query.list();
		mav.addObject("listproduct", list);
		return mav;
	}
	
//	@ModelAttribute("productSearch")
//	public Product modelProduct(Product product) {
//		Product p = new Product();
//		p.setProductName(product.getProductName());
//		return p;
//	}
	
	@RequestMapping("/layout")
	public ModelAndView layoutPage() {
		ModelAndView mav = new ModelAndView("/layouts/footer");
		
		return mav;
	}
	
	
}
