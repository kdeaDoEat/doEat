package org.kdea.reviewboard;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping(value="/reviews/")
public class ReviewController {
	
	@RequestMapping(value="write")
	public String write(){
		return "review/write";
	}
	
	@RequestMapping(value="searchMap")
	public ModelAndView map(HttpServletRequest request){
		return new ModelAndView("review/reviewmap","type",request.getParameter("search"));
	}

}
