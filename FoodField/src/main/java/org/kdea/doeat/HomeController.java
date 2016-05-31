package org.kdea.doeat;

import java.util.Locale;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page.
 */
@Controller
@RequestMapping(value="/")
public class HomeController {
	
	@RequestMapping(value = "main", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		return "main";
	}
	
	@RequestMapping(value = "notice" ,method = RequestMethod.GET)
	public String notice(){
		return "redirect:notice/list";
	}
	
	@RequestMapping(value="free", method = RequestMethod.GET)
	public String free(){
		return "board/freeBoard";
	}
	
	@RequestMapping(value="review", method = RequestMethod.GET)
	public String review(){
		return "board/reviewBoard";
	}
	
	@RequestMapping(value = "select", method = RequestMethod.GET)
	public String select(){
		return "board/selectBoard";
	}
	
}
