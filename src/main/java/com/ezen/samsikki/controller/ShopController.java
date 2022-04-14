package com.ezen.samsikki.controller;

import java.text.DecimalFormat;
import java.util.Calendar;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ezen.samsikki.service.ShopService;
import com.ezen.samsikki.vo.BoardVO;
import com.ezen.samsikki.vo.CartListVO;
import com.ezen.samsikki.vo.CartVO;
import com.ezen.samsikki.vo.CriteriaVO;
import com.ezen.samsikki.vo.GoodsVO;
import com.ezen.samsikki.vo.GoodsViewVO;
import com.ezen.samsikki.vo.MemberVO;
import com.ezen.samsikki.vo.OrderDetailVO;
import com.ezen.samsikki.vo.OrderListVO;
import com.ezen.samsikki.vo.OrderVO;
import com.ezen.samsikki.vo.QnAReplyListVO;
import com.ezen.samsikki.vo.QnAReplyVO;
import com.ezen.samsikki.vo.ReplyListVO;
import com.ezen.samsikki.vo.ReplyVO;

@Controller
@RequestMapping("/shop/*")
public class ShopController {

	private static final Logger logger = LoggerFactory.getLogger(ShopController.class);

	@Inject
	ShopService service;

	// 상품 리스트 (페이징, 검색)
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public void getList(Model model, CriteriaVO cri) throws Exception {
		logger.info("get list");

		List<GoodsViewVO> listPaging = service.list(cri);

		if (!listPaging.isEmpty()) {
			model.addAttribute("list", listPaging);
		} else {
			model.addAttribute("listCheck", "empty");
			return;
		}

		int count = service.listCount(cri);
		CriteriaVO pageMake = new CriteriaVO(cri, count);
		model.addAttribute("pageMaker", pageMake);
	}

	// 상품 리스트 (100, 페이징, 검색)
	@RequestMapping(value = "/list1", method = RequestMethod.GET)
	public void getList1(Model model, CriteriaVO cri) throws Exception {
		logger.info("get list1");

		List<GoodsViewVO> listPaging = service.list1(cri);

		if (!listPaging.isEmpty()) {
			model.addAttribute("list1", listPaging);
		} else {
			model.addAttribute("listCheck", "empty");
			return;
		}

		int count = service.listCount1(cri);
		CriteriaVO pageMake = new CriteriaVO(cri, count);
		model.addAttribute("pageMaker", pageMake);
	}

	// 상품 리스트 (200, 페이징, 검색)
	@RequestMapping(value = "/list2", method = RequestMethod.GET)
	public void getList2(Model model, CriteriaVO cri) throws Exception {
		logger.info("get list2");

		List<GoodsViewVO> listPaging = service.list2(cri);

		if (!listPaging.isEmpty()) {
			model.addAttribute("list2", listPaging);
		} else {
			model.addAttribute("listCheck", "empty");
			return;
		}

		int count = service.listCount2(cri);
		CriteriaVO pageMake = new CriteriaVO(cri, count);
		model.addAttribute("pageMaker", pageMake);
	}

	// 상품 리스트 (300, 페이징, 검색)
	@RequestMapping(value = "/list3", method = RequestMethod.GET)
	public void getList3(Model model, CriteriaVO cri) throws Exception {
		logger.info("get list3");

		List<GoodsViewVO> listPaging = service.list3(cri);

		if (!listPaging.isEmpty()) {
			model.addAttribute("list3", listPaging);
		} else {
			model.addAttribute("listCheck", "empty");
			return;
		}

		int count = service.listCount3(cri);
		CriteriaVO pageMake = new CriteriaVO(cri, count);
		model.addAttribute("pageMaker", pageMake);
	}

	// 상품 리스트 (sale, 페이징, 검색)
	@RequestMapping(value = "/saleList", method = RequestMethod.GET)
	public void getSaleList(Model model, CriteriaVO cri) throws Exception {
		logger.info("get sale list");

		List<GoodsViewVO> listPaging = service.saleList(cri);

		if (!listPaging.isEmpty()) {
			model.addAttribute("saleList", listPaging);
		} else {
			model.addAttribute("listCheck", "empty");
			return;
		}

		int count = service.saleListCount(cri);
		CriteriaVO pageMake = new CriteriaVO(cri, count);
		model.addAttribute("pageMaker", pageMake);
	}

	// 상품 조회
	@RequestMapping(value = "/view", method = RequestMethod.GET)
	public void getView(@RequestParam("n") int gdsNum, Model model, BoardVO board) throws Exception {
		logger.info("get view");

		GoodsViewVO view = service.goodsView(gdsNum);
		model.addAttribute("view", view);

		board.setGdsNum(gdsNum);
		model.addAttribute("QnA", service.gdsQnA(board));
	}

	// 상품 소감(댓글) 작성
	@ResponseBody
	@RequestMapping(value = "view/registReply", method = RequestMethod.POST)
	public void registReply(ReplyVO reply, HttpSession session) throws Exception {
		logger.info("regist reply");

		MemberVO member = (MemberVO) session.getAttribute("member");
		reply.setUserId(member.getUserId());

		service.registReply(reply);
	}

	// 상품 소감(댓글) 목록
	@ResponseBody
	@RequestMapping(value = "/view/replyList", method = RequestMethod.GET)
	public List<ReplyListVO> getReplyList(@RequestParam("n") int gdsNum) throws Exception {
		logger.info("get reply list");

		List<ReplyListVO> reply = service.replyList(gdsNum);

		return reply;
	}

	// 상품 소감(댓글) 삭제
	@ResponseBody
	@RequestMapping(value = "/view/deleteReply", method = RequestMethod.POST)
	public int getReplyList(ReplyVO reply, HttpSession session) throws Exception {
		logger.info("post delete reply");

		int result = 0;

		MemberVO member = (MemberVO) session.getAttribute("member");
		String userId = service.idCheck(reply.getRepNum());

		if (member.getUserId().equals(userId)) {
			reply.setUserId(member.getUserId());
			service.deleteReply(reply);
			result = 1;
		}
		return result;
	}

	// 상품 소감(댓글) 수정
	@ResponseBody
	@RequestMapping(value = "/view/modifyReply", method = RequestMethod.POST)
	public int modifyReply(ReplyVO reply, HttpSession session) throws Exception {
		logger.info("modify reply");

		int result = 0;

		MemberVO member = (MemberVO) session.getAttribute("member");
		String userId = service.idCheck(reply.getRepNum());

		if (member.getUserId().equals(userId)) {
			reply.setUserId(member.getUserId());
			service.modifyReply(reply);
			result = 1;
		}
		return result;
	}

	// 카트 담기
	@ResponseBody
	@RequestMapping(value = "/view/addCart", method = RequestMethod.POST)
	public int addCart(CartVO cart, HttpSession session) throws Exception {

		int result = 0;

		MemberVO member = (MemberVO) session.getAttribute("member");

		if (member != null) {
			cart.setUserId(member.getUserId());
			service.addCart(cart);
			result = 1;
		}
		return result;
	}

	// 카트 목록
	@RequestMapping(value = "/shop/cartList", method = RequestMethod.GET)
	public void getCartList(HttpSession session, Model model) throws Exception {
		logger.info("get cart list");

		MemberVO member = (MemberVO) session.getAttribute("member");
		String userId = member.getUserId();

		List<CartListVO> cartList = service.cartList(userId);

		model.addAttribute("cartList", cartList);
	}

	// 카트 삭제
	@ResponseBody
	@RequestMapping(value = "/shop/deleteCart", method = RequestMethod.POST)
	public int deleteCart(HttpSession session, @RequestParam(value = "chbox[]") List<String> chArr, CartVO cart)
			throws Exception {
		logger.info("delete cart");

		MemberVO member = (MemberVO) session.getAttribute("member");
		String userId = member.getUserId();

		int result = 0;
		int cartNum = 0;

		if (member != null) {
			cart.setUserId(userId);
			for (String i : chArr) {
				cartNum = Integer.parseInt(i);
				cart.setCartNum(cartNum);
				service.deleteCart(cart);
			}
			result = 1;
		}
		return result;
	}

	// 주문
	@RequestMapping(value = "/shop/cartList", method = RequestMethod.POST)
	public String order(HttpSession session, OrderVO order, OrderDetailVO orderDetail, GoodsVO goods) throws Exception {
		logger.info("order");

		MemberVO member = (MemberVO) session.getAttribute("member");
		String userId = member.getUserId();

		Calendar cal = Calendar.getInstance();
		int year = cal.get(Calendar.YEAR);
		String ym = year + new DecimalFormat("00").format(cal.get(Calendar.MONTH) + 1);
		String ymd = ym + new DecimalFormat("00").format(cal.get(Calendar.DATE));
		String subNum = "";

		for (int i = 1; i <= 6; i++) {
			subNum += (int) (Math.random() * 10);
		}

		String orderId = ymd + "_" + subNum;

		order.setOrderId(orderId);
		order.setUserId(userId);
		service.orderInfo(order);

		orderDetail.setOrderId(orderId);
		service.orderInfo_Details(orderDetail);

		service.cartAllDelete(userId);

		return "redirect:/shop/orderList";
	}

	// 주문 목록
	@RequestMapping(value = "/shop/orderList", method = RequestMethod.GET)
	public void getOrderList(HttpSession session, OrderVO order, Model model) throws Exception {
		logger.info("get order list");

		MemberVO member = (MemberVO) session.getAttribute("member");
		String userId = member.getUserId();

		order.setUserId(userId);

		List<OrderVO> orderList = service.orderList(order);

		model.addAttribute("orderList", orderList);
	}

	// 주문 상세 목록
	@RequestMapping(value = "/shop/orderView", method = RequestMethod.GET)
	public void getOrderList(HttpSession session, @RequestParam("n") String orderId, OrderVO order, Model model)
			throws Exception {

		logger.info("get order view");

		MemberVO member = (MemberVO) session.getAttribute("member");
		String userId = member.getUserId();

		order.setUserId(userId);
		order.setOrderId(orderId);

		List<OrderListVO> orderView = service.orderView(order);

		model.addAttribute("orderView", orderView);
	}

	// QnA 상세페이지
	@RequestMapping(value = "/shop/QnADetail", method = RequestMethod.GET)

	public String noticeView(BoardVO boardVO, Model model, HttpSession session, @RequestParam("n") int gdsNum)
			throws Exception {
		logger.info("view");

		model.addAttribute("view", service.QnAView(boardVO.getBrdNum()));

		return "/shop/QnADetail";

	}

	// QnA 상세페이지
	@ResponseBody
	@RequestMapping(value = "/shop/QnADetail", method = RequestMethod.POST)
	public int secret(BoardVO board, HttpSession session) throws Exception {
		logger.info("secret board");

		int result = 0;

		MemberVO member = (MemberVO) session.getAttribute("member");
		String userId = service.secret(board.getBrdNum());

		if (member.getUserId().equals(userId)) {

			board.setUserId(member.getUserId());
			result = 1;
		} else if (member.getVerify() == 9) {
			result = 1;
		}

		return result;
	}

	// QnA 수정뷰
	@RequestMapping(value = "/shop/QnAupdateView", method = RequestMethod.GET)
	public String updateView(BoardVO board, Model model, @RequestParam("n") int gdsNum) throws Exception {
		logger.info("updateView");

		model.addAttribute("update", service.QnAView(board.getBrdNum()));

		return "shop/QnAupdateView";
	}

	// QnA 수정
	@RequestMapping(value = "/shop/QnAupdateView", method = RequestMethod.POST)
	public String noticeUpdate(BoardVO board, Model model, @RequestParam("n") int gdsNum) throws Exception {
		logger.info("QnA Update");

		service.QnAUpdate(board);

		model.addAttribute("n", gdsNum);
		return "redirect:/shop/view";
	}

	// QnA 삭제
	@RequestMapping(value = "/shop/delete", method = RequestMethod.GET)
	public String noticeDelete(BoardVO board, Model model, @RequestParam("n") int gdsNum) throws Exception {
		logger.info("QnA delete");

		service.QnADelete(board.getBrdNum());

		model.addAttribute("n", gdsNum);
		return "redirect:/shop/view";
	}

	// QnA 댓글 작성
	@ResponseBody
	@RequestMapping(value = "/QnADetail/QnAregistReply", method = RequestMethod.POST)
	public void QnAregistReply(QnAReplyVO QnAreply, HttpSession session) throws Exception {
		logger.info("regist reply");

		MemberVO member = (MemberVO) session.getAttribute("member");
		QnAreply.setUserId(member.getUserId());

		service.QnAregistReply(QnAreply);

	}

	// QnA 댓글 리스트
	@ResponseBody
	@RequestMapping(value = "/QnADetail/QnAreplyList", method = RequestMethod.GET)
	public List<QnAReplyListVO> QnAReplyList(@RequestParam("brdNum") int brdNum) throws Exception {
		logger.info("get reply List");

		List<QnAReplyListVO> QnAreply = service.QnAreplyList(brdNum);

		return QnAreply;
	}

	// QnA 댓글 삭제
	@ResponseBody
	@RequestMapping(value = "/QnADetail/deleteReply", method = RequestMethod.POST)
	public int QnAReplyDelte(QnAReplyVO QnAreply, HttpSession session) throws Exception {
		logger.info("post delete reply");

		int result = 0;
		MemberVO member = (MemberVO) session.getAttribute("member");
		String userId = service.QnAidCheck(QnAreply.getRepNum());

		if (member.getUserId().equals(userId)) {
			QnAreply.setUserId(member.getUserId());
			service.QnAdeleteReply(QnAreply);

			result = 1;

		}
		return result;
	}

	// QnA 댓글 수정
	@ResponseBody
	@RequestMapping(value = "/QnADetail/modifyReply", method = RequestMethod.POST)
	public int QnAModifyReply(QnAReplyVO QnAreply, HttpSession session) throws Exception {
		int result = 0;
		MemberVO member = (MemberVO) session.getAttribute("member");
		String userId = service.QnAidCheck(QnAreply.getRepNum());

		if (member.getUserId().equals(userId)) {
			QnAreply.setUserId(member.getUserId());
			service.QnAModifyReply(QnAreply);
			result = 1;
		}

		return result;
	}

} // end public class ShopController
