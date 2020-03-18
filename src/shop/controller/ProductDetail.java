package shop.controller;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import shop.bean.ProductLine;

@Transactional
@Controller
//@RequestMapping("/product/")
public class ProductDetail {

	@Autowired
	SessionFactory factory;
	
	@RequestMapping("/productdetail{id}")
	public ModelAndView productDetailPage(@PathVariable("id") String id, Model model) {
		ModelAndView mav = new ModelAndView("/webpage/productDetailPage");
		Session session = factory.getCurrentSession();
		String hql = "FROM Product p WHERE p.productId = " + id ;
		model.addAttribute("id", id);
		Query query = session.createQuery(hql);
		List<ProductLine> list = query.list();
		
		mav.addObject("list", list);
		return mav;
	}
}
