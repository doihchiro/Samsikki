package com.ezen.samsikki.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.ezen.samsikki.service.BoardService;
import com.ezen.samsikki.vo.BoardVO;
import com.ezen.samsikki.vo.MemberVO;
import com.ezen.samsikki.vo.PageMaker;
import com.ezen.samsikki.vo.SearchCriteria;

@Controller
@RequestMapping("/board/*")
public class BoardController {

	private static final Logger logger = LoggerFactory.getLogger(AdminController.class);

	@Inject
	BoardService boardService;

	// 공지사항 (paging)
	@RequestMapping(value = "/notice", method = RequestMethod.GET)
	public String noticeList(Model model, @ModelAttribute("scri") SearchCriteria scri) throws Exception {
		logger.info("list");
		
		model.addAttribute("list", boardService.list(scri));
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(scri);
		pageMaker.setTotalCount(boardService.listCount(scri));
		
		model.addAttribute("pageMaker", pageMaker);
		
		return "board/notice";
	}

	// 공지사항 상세보기
	@RequestMapping(value = "/noticeDetail", method = RequestMethod.GET)
	public String noticeView(BoardVO boardVO, Model model) throws Exception {
		logger.info("view");
		
		model.addAttribute("view", boardService.noticeView(boardVO.getBrdNum()));
		
		return "board/noticeDetail";
	}

	// QnA 작성
	@RequestMapping(value = "/QnAInsert", method = RequestMethod.GET)
	public String notice() throws Exception {
		
		return "board/QnAInsert";
	}

	// QnA 작성 : POST
	@RequestMapping(value = "/QnAInsert", method = RequestMethod.POST)
	public String noticeWrite(HttpSession session, BoardVO boardVO, @RequestParam("n") int gdsNum, Model model)
			throws Exception {
		
		MemberVO member = (MemberVO) session.getAttribute("member");
		String userId = member.getUserId();
		
		boardVO.setUserId(userId);
		
		boardVO.setGdsNum(gdsNum);
		
		boardService.QnAWrite(boardVO);
		
		model.addAttribute("n", gdsNum);
		
		return "redirect:/shop/view";
	}

	// QnA 리스트 (paging)
	@RequestMapping(value = "/QnAList", method = { RequestMethod.GET, RequestMethod.POST })
	public String QnAList(Model model, @ModelAttribute("scri") SearchCriteria scri) throws Exception {
		logger.info("list");
		
		model.addAttribute("QnA", boardService.QnAlist(scri));
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(scri);
		pageMaker.setTotalCount(boardService.listCount(scri));
		
		model.addAttribute("pageMaker", pageMaker);
		
		return "board/QnAList";
	}

} // end public class BoardController
