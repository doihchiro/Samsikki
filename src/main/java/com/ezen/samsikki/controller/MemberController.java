package com.ezen.samsikki.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ezen.samsikki.service.MemberService;
import com.ezen.samsikki.vo.BoardVO;
import com.ezen.samsikki.vo.GoodsVO;
import com.ezen.samsikki.vo.MemberVO;
import com.ezen.samsikki.vo.OrderListVO;
import com.ezen.samsikki.vo.OrderVO;

@Controller
@RequestMapping("/member/*")
public class MemberController {

	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);

	@Inject
	MemberService service;

	@Autowired
	BCryptPasswordEncoder passEncoder;

	// 회원 가입 (GET)
	@RequestMapping(value = "/signup", method = RequestMethod.GET)
	public void getSignup() throws Exception {
		logger.info("get signup");
	}

	// 회원 가입 (POST)
	@RequestMapping(value = "/signup", method = RequestMethod.POST)
	public String postSignup(MemberVO vo) throws Exception {
		logger.info("post signup");

		String inputPass = vo.getUserPass();
		String pass = passEncoder.encode(inputPass);
		vo.setUserPass(pass);

		service.signup(vo);

		return "redirect:/";
	}

	// 로그인 (GET)
	@RequestMapping(value = "/signin", method = RequestMethod.GET)
	public void getSignin() throws Exception {
		logger.info("get signin");
	}

	// 로그인 (POST)
	@RequestMapping(value = "/signin", method = RequestMethod.POST)
	public String postSignin(MemberVO vo, HttpServletRequest req, RedirectAttributes rttr) throws Exception {
		logger.info("post signin");

		MemberVO login = service.signin(vo);

		if (login == null) {
			rttr.addFlashAttribute("msg", false);
			return "redirect:/member/signin";
		}
		HttpSession session = req.getSession();

		boolean passMatch = passEncoder.matches(vo.getUserPass(), login.getUserPass());

		if (login != null && passMatch) {
			session.setAttribute("member", login);
		} else {
			session.setAttribute("member", null);
			rttr.addFlashAttribute("msg", false);
			return "redirect:/member/signin";
		}
		return "redirect:/";
	}

	// 로그아웃
	@RequestMapping(value = "/signout", method = RequestMethod.GET)
	public String signout(HttpSession session) throws Exception {
		logger.info("get logout");

		service.signout(session);

		return "redirect:/";
	}

	// 프로필
	@RequestMapping(value = "/profile", method = RequestMethod.GET)
	public void myProfile(HttpSession session, OrderVO order, Model model, BoardVO board) throws Exception {
		logger.info("myPage");

		MemberVO member = (MemberVO) session.getAttribute("member");
		String userId = member.getUserId();

		order.setUserId(userId);
		board.setUserId(userId);
		List<OrderVO> orderList = service.orderList(order);

		List<MemberVO> memberList = service.memberList(member);

		List<BoardVO> QnA = service.gdsQnA(board);

		model.addAttribute("orderList", orderList);
		model.addAttribute("memberList", memberList);
		model.addAttribute("QnA", QnA);
	}

	// 주문취소
	@RequestMapping(value = "/profile", method = RequestMethod.POST)
	public String delivery(OrderVO order) throws Exception {
		logger.info("cancel order");

		service.delivery(order);

		List<OrderListVO> orderView = service.orderView(order);
		GoodsVO goods = new GoodsVO();

		return "redirect:/member/profile";
	}

	// 프로필 업데이트
	@RequestMapping(value = "/profileUpdate", method = RequestMethod.GET)
	public void profileGet(Model model, HttpSession session) throws Exception {

		MemberVO member = (MemberVO) session.getAttribute("member");
		String userId = member.getUserId();

		List<MemberVO> memberList = service.memberList(member);

		model.addAttribute("memberList", memberList);

	}

	// 프로필 업데이트
	@RequestMapping(value = "/profileUpdate", method = RequestMethod.POST)
	public String profileUp(MemberVO member) throws Exception {

		String inputPass = member.getUserPass();
		String pass = passEncoder.encode(inputPass);
		member.setUserPass(pass);

		service.profileUpdate(member);

		return "redirect:/member/profile";
	}

	// 회원가입 아이디 체크
	@ResponseBody
	@RequestMapping(value = "/signup/emailCheck", method = RequestMethod.POST)
	public int eamilCheck(MemberVO member) throws Exception {

		int result = service.idCheck(member);

		return result;

	}

	// 회원탈퇴
	@ResponseBody
	@RequestMapping(value = "/profile/deleteUserId", method = RequestMethod.POST)
	public String deleteUserId(MemberVO member, @RequestParam("userId") String userId, HttpSession session)
			throws Exception {

		member.setUserId(userId);

		service.delete(userId);

		session.invalidate();
		return "redirect:/";

	}

} // end pubic class MemberController
