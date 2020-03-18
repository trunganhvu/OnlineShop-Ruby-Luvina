package shop.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ErrorController {
	
	@RequestMapping(value = "errors", method = RequestMethod.GET)
	public ModelAndView renderErrorPage(HttpServletRequest httpRequest) {
		ModelAndView errorPage = new ModelAndView("/webpage/errorPage");
		String errorMessage = "";
		int httpErrorCode = getErrorCode(httpRequest);
		
		switch (httpErrorCode) {
		case 400:{
			errorMessage = "Http Error Code: 400. Bad request";
			break;
		}
		case 401:{
			errorMessage = "Http Error Code: 401. Bad request";
			break;
		}
		case 404:{
			errorMessage = "Http Error Code: 402. Bad request";
			break;
		}
		case 500:{
			errorMessage = "Http Error Code: 500. Bad request";
			break;
		}
		default:
			errorMessage = "Error!!!!!!!!! \n back pls";
			break;
		}
		errorPage.addObject("errorMessage", errorMessage);
		return errorPage;
	}
	
	private int getErrorCode(HttpServletRequest httpRequest) {
        return (Integer) httpRequest
          .getAttribute("javax.servlet.error.status_code");
    }
}
