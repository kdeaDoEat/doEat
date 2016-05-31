package org.kdea.doeat;

import java.util.Locale;

import org.kdea.reviewboard.ReviewService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

/**
 * Handles requests for the application home page.
 */
@Controller
@RequestMapping(value="/")
public class HomeController {
	@Autowired
	private ReviewService rsvc;
	
	@RequestMapping(value = "main", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		return "main";
	}
	
	@RequestMapping(value = "notice" ,method = RequestMethod.GET)
	public String notice(){
		return "board/noticeBoard";
	}
	
	@RequestMapping(value="free", method = RequestMethod.GET)
	public String free(){
		return "board/freeBoard";
	}
	
	@RequestMapping(value="review", method = RequestMethod.GET)
	public ModelAndView review(){
		
		return new ModelAndView("board/reviewBoard","list",rsvc.getList());
	}
	
	@RequestMapping(value = "select", method = RequestMethod.GET)
	public String select(){
		return "board/selectBoard";
	}
	
}
