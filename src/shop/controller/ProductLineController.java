package shop.controller;

import java.util.List;
import shop.bean.*;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Transactional
@Controller
public class ProductLineController {

	@Autowired
	SessionFactory factory;
	
	@RequestMapping("/home")
	public ModelAndView productLinePage() {
		ModelAndView mav = new ModelAndView("/webpage/home");
		Session session = factory.getCurrentSession();
		String hql = "FROM ProductLine";
		Query query = session.createQuery(hql);
		List<ProductLine> list = query.list();
		mav.addObject("list", list);
		return mav;
	}
}
