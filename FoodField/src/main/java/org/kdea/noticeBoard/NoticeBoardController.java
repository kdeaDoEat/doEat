package org.kdea.noticeBoard;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.kdea.service.NoticeService;
import org.kdea.service.NoticeValidator;
import org.kdea.vo.BoardVO;
import org.kdea.vo.PageVO;
import org.kdea.vo.SearchVO;
import org.kdea.vo.DelConfirmVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping(value="notice")
public class NoticeBoardController {
	
	@Autowired
	NoticeService service;
	
	@ModelAttribute("board")
	public BoardVO rangeModel(HttpServletRequest request){
		
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return new BoardVO();
		
	}
	
	@RequestMapping(value="/write",method=RequestMethod.GET)
	public String goWriteForm(){
				
		return "noticeboard/writeForm";
		
	}
	
	@RequestMapping(value="/modform",method=RequestMethod.GET)
	public ModelAndView goWriteForm(@ModelAttribute("board") BoardVO board){
                                    /*모델에 자동 저장이미 됬나~*/				
		return new ModelAndView("noticeboard/modForm");
		
	}
	
	@RequestMapping(value={"/list"},method=RequestMethod.GET)
	public ModelAndView goList(@ModelAttribute("search") SearchVO search, @ModelAttribute("board") BoardVO board, @ModelAttribute("page") PageVO page, Model model){
		
		List<BoardVO> boardlist = new ArrayList<BoardVO>();
		  /*search객체 자체는 null이 아님*/
		if(search.getType()==null&&page.getCurrpage()==0){
			
			page.setCurrpage(1);
			
		}
		if(board.getNum()>0){
			
			boardlist = service.getBoardCurrListbyBno(board,model,search.getType(),search.getWord());
			
		}
		if(page.getCurrpage()>0){
			
			boardlist = service.getBoardListbyPage(page.getCurrpage(),model,search.getType(),search.getWord());
			
		}
		
		ModelAndView dest = new ModelAndView("noticeboard/boardList","boardlist",boardlist);
		return dest;
						
	}
	
	
	@RequestMapping(value="/view",method=RequestMethod.GET)
	public ModelAndView goView(@ModelAttribute("board") BoardVO board, Model model){
		
		BoardVO boardinfo = service.selectBoard(board);
		ModelAndView dest = new ModelAndView("noticeboard/boardView","board",boardinfo);
		return dest;
						
	}
	
	@RequestMapping(value="/insert",method=RequestMethod.POST)
	public ModelAndView goInsert(@ModelAttribute("board") BoardVO board,BindingResult result, HttpServletRequest request, Model model){
		
		new NoticeValidator().validate(board,result);
		if (result.hasErrors()) {			
			return new ModelAndView("noticeboard/writeForm");			
		}
		board = service.insertBoard(board, request);
		BoardVO boardinfo = service.selectBoard(board);
		ModelAndView dest = new ModelAndView("noticeboard/boardView","board",boardinfo);
		return dest;
						
	}
	
	@RequestMapping(value="/reply",method=RequestMethod.POST)
	public ModelAndView goReply(@ModelAttribute("board") BoardVO board,BindingResult result, HttpServletRequest request, Model model){
		
		new NoticeValidator().validate(board,result);
		if (result.hasErrors()) {
			board = service.selectBoard(board);
			return new ModelAndView("noticeboard/boardView","board",board);			
		}
		board = service.replyBoard(board, request);
		BoardVO boardinfo = service.selectBoard(board);
		ModelAndView dest = new ModelAndView("noticeboard/boardView","board",boardinfo);
		return dest;
						
	}
	
	@RequestMapping(value="/modify",method=RequestMethod.POST)
	public ModelAndView goModify(@ModelAttribute("board") BoardVO board,BindingResult result, HttpServletRequest request, Model model){
		
		new NoticeValidator().validate(board,result);
		if (result.hasErrors()) {			
			return new ModelAndView("noticeboard/modForm");			
		}
		//나중에 시간나면 true로 바꾸자~
		board = service.updateBoard(board, request);
		
		BoardVO boardinfo = service.selectBoard(board);
		ModelAndView dest = new ModelAndView("noticeboard/boardView","board",boardinfo);
		return dest;
						
	}
	
	@RequestMapping(value="/delConfirm",method=RequestMethod.POST)
	@ResponseBody
	public Object godelConfirm(@ModelAttribute("board") BoardVO board,BindingResult result, HttpServletRequest request, Model model){
		
		//나중에 시간나면 true로 바꾸자~
		DelConfirmVO delconfirm = new DelConfirmVO();
		delconfirm.setParent(service.confirmParent(board));		
				
		return delconfirm;
						
	}
	
	@RequestMapping(value="/del",method=RequestMethod.GET)
	public String del(@ModelAttribute("board") BoardVO board,BindingResult result, HttpServletRequest request, Model model){
		
		//나중에 시간나면 true로 바꾸자~
		DelConfirmVO delconfirm = new DelConfirmVO();
		delconfirm.setParent(service.confirmParent(board));		
		
        board = service.deleteBoard(board);
        
		int boardno;
		if(board.getNum()-1<=0){
			
			boardno = 1;
		}else{
			
			boardno = board.getNum()-1;
		}
		return "redirect:list?boardno="+boardno;		
						
	}
	
}
