package org.kdea.noticeBoard;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("noticeboard")
public class NoticeBoardController {

	@RequestMapping("/main")
	public String noticeMain(){
		
		return "board/noticeBoard";
		
	}
	
}
