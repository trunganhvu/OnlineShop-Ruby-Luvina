package shop.controller;

import java.util.*;
import java.util.List;
import java.util.Map;

import shop.bean.*;

import javax.mail.Message;
import javax.mail.Multipart;
import javax.mail.PasswordAuthentication;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import javax.servlet.http.HttpSession;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Transactional
@Controller
public class ShoppingCartController {

	@Autowired
	SessionFactory factory;

	@Autowired
	JavaMailSender mailer;

	/*
	 * Show all item product in session
	 */
	@RequestMapping("/shoppingcart")
	public ModelAndView shoppingCart(HttpSession session) {
		ModelAndView mav = new ModelAndView("/webpage/shoppingCart");
		HashMap<Long, Cart> cartItems = (HashMap<Long, Cart>) session.getAttribute("myCartItems");
		if (cartItems == null) {
			cartItems = new HashMap<Long, Cart>();
		}
		session.setAttribute("myCartItems", cartItems);
		session.setAttribute("myCartTotal", totalPrice(cartItems));
		session.setAttribute("myCartNum", cartItems.size());
		return mav;
	}

	/*
	 * Add product to cart use session
	 */
	@RequestMapping(value = "/add-{id}", method = RequestMethod.GET)
	public String addItemToCart(@PathVariable("id") String id, HttpSession session) {
		HashMap<Long, Cart> cartItems = (HashMap<Long, Cart>) session.getAttribute("myCartItems");
		if (cartItems == null) {
			cartItems = new HashMap<Long, Cart>();
		}

		Session s = factory.getCurrentSession();
		String hql = "FROM Product p WHERE p.productId = " + id;
		Query query = s.createQuery(hql);
		List<Product> list = query.list();
		Product product = list.get(0);
		if (product != null) {
			if (cartItems.containsKey(Long.parseLong(id))) {
				Cart item = cartItems.get(Long.parseLong(id));
				item.setProduct(product);
				item.setQuantity(item.getQuantity() + 1);
				cartItems.put(Long.parseLong(id), item);
			} else {
				Cart item = new Cart();
				item.setProduct(product);
				item.setQuantity(1);
				cartItems.put(Long.parseLong(id), item);
			}
		}
		session.setAttribute("myCartItems", cartItems);
		session.setAttribute("myCartTotal", totalPrice(cartItems));
		session.setAttribute("myCartNum", cartItems.size());

		return "redirect:shoppingcart.htm";
	}

	/*
	 * Update new value to quantity of product
	 */
	@RequestMapping(value = "/update-{id}", method = RequestMethod.GET)
	public String updateCart(@PathVariable("id") String id, HttpSession session) {
		HashMap<Long, Cart> cartItems = (HashMap<Long, Cart>) session.getAttribute("myCartItems");
		if (cartItems == null) {
			cartItems = new HashMap<Long, Cart>();
		}

		session.setAttribute("myCartItems", cartItems);

		return "redirect:shoppingcart.htm";
	}

	/* 
	 * 
	 * */
	@RequestMapping(value = "/remove-{id}", method = RequestMethod.GET)
	public String removeCart(@PathVariable("id") String id, HttpSession session) {
		HashMap<Long, Cart> cartItems = (HashMap<Long, Cart>) session.getAttribute("myCartItems");
		if (cartItems == null) {
			cartItems = new HashMap<Long, Cart>();
		}
		// if(cartItems.containsKey(id)) {
		cartItems.remove(Long.parseLong(id));
		// }

		session.setAttribute("myCartItems", cartItems);
		session.setAttribute("myCartTotal", totalPrice(cartItems));
		session.setAttribute("myCartNum", cartItems.size());
		return "redirect:shoppingcart.htm";
	}

	@RequestMapping("checkout")
	public ModelAndView getCheckOut(HttpSession session) {
		ModelAndView mav = new ModelAndView("/webpage/checkOut");
//		HashMap<Long, Cart> cartItems = (HashMap<Long, Cart>) session.getAttribute("myCartItems");
//		if (cartItems == null) {
//			cartItems = new HashMap<Long, Cart>();
//		}
//		session.setAttribute("myCartItems", cartItems);
//		session.setAttribute("myCartTotal", totalPrice(cartItems));
//		session.setAttribute("myCartNum", cartItems.size());
		return mav;
	}

	@RequestMapping("sendmail")
	public ModelAndView sendMail(ModelMap model, @RequestParam("email") String emailToEnd,
			@RequestParam("address") String addressToEnd, @RequestParam("phone") String phoneToEnd,
			@RequestParam("productName") String productName, @RequestParam("price") String price) {
		ModelAndView mav = new ModelAndView("/webpage/resultSendMail");
		try {

			Properties props = new Properties();
			props.put("mail.smtp.auth", "true");
			props.put("mail.smtp.starttls.enable", "true");
			props.put("mail.smtp.host", "smtp.gmail.com");
			props.put("mail.smtp.port", "587");
			mav.addObject("message", "Send mail successful");
			javax.mail.Session session = javax.mail.Session.getDefaultInstance(props,new javax.mail.Authenticator(){
				protected PasswordAuthentication getPasswordAuthentication() {
					return new PasswordAuthentication("daominh7070@gmail.com", "Trunganh98");
				}
			});
			Message msg = new MimeMessage(session);
			msg.setFrom(new InternetAddress("daominh7070@gmail.com", false));
			msg.setRecipients(Message.RecipientType.TO, InternetAddress.parse(emailToEnd));
			msg.setSubject("Confirm don mua hang cua ban");
			msg.setContent("<h1>Xac nhan don mua hang tu</h1> "
					+ "<p>tu tai khoan mai: " + emailToEnd + "</p>"
					+ "<p>Thong tin don hang: " + addressToEnd + "</p>"
					+ "<p>Don hang:" + productName + " 		gia: " + price +"</p>"
					+ "<p>So dien thoai khach hang: " + phoneToEnd + "</p>", "text/html");
			msg.setSentDate(new Date());
			
			MimeBodyPart messageBodyPart = new MimeBodyPart();
			messageBodyPart.setContent("Xac nhan don mua hang tu "
					+ "tu tai khoan mai: " + emailToEnd + "\n"
					+ "Thong tin don hang: " + addressToEnd + "\n"
					+ "So dien thoai khach hang: " + phoneToEnd + ".\n", "text/html");
			
			Multipart multipart = new MimeMultipart();
			multipart.addBodyPart(messageBodyPart);
			MimeBodyPart attachPart = new MimeBodyPart();
			
			Transport.send(msg);
			mav.addObject("message", "Booking successful, Pls check your email!!");
		} catch (Exception e) {
			mav.addObject("message", "Send mail fail");
		}

		return mav;
	}

	public double totalPrice(HashMap<Long, Cart> cartItems) {
		float count = 0;
		for (Map.Entry<Long, Cart> list : cartItems.entrySet()) {
			count += list.getValue().getQuantity() * list.getValue().getProduct().getBuyPrice();
		}
		return Math.round(count * 100.0) / 100.0;
	}
}
