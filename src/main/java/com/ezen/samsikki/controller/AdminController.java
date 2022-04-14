package com.ezen.samsikki.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.ezen.samsikki.service.AdminService;
import com.ezen.samsikki.utils.UploadFileUtils;
import com.ezen.samsikki.vo.BoardVO;
import com.ezen.samsikki.vo.CriteriaVO;
import com.ezen.samsikki.vo.GoodsVO;
import com.ezen.samsikki.vo.GoodsViewVO;
import com.ezen.samsikki.vo.MemberVO;
import com.ezen.samsikki.vo.OrderListVO;
import com.ezen.samsikki.vo.OrderVO;
import com.ezen.samsikki.vo.PageMaker;
import com.ezen.samsikki.vo.ReplyListVO;
import com.ezen.samsikki.vo.ReplyVO;
import com.ezen.samsikki.vo.SearchCriteria;

@Controller
@RequestMapping("/admin/*")
public class AdminController {

	private static final Logger logger = LoggerFactory.getLogger(AdminController.class);

	@Inject
	AdminService service;

	@Resource(name = "uploadPath")
	private String uploadPath;

	// 관리자 화면
	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public void getIndex() throws Exception {
		logger.info("get index");
	}

	// 상품 등록 (GET)
	@RequestMapping(value = "/goods/register", method = RequestMethod.GET)
	public void getGoodsRegister(Model model) throws Exception {
		logger.info("get goods register");
	}

	// 상품 등록 (POST)
	@RequestMapping(value = "/goods/register", method = RequestMethod.POST)
	public String postGoodsRegister(GoodsVO vo, MultipartFile file) throws Exception {
		
		String imgUploadPath = uploadPath + File.separator + "imgUpload"; // 이미지를 업로드할 폴더 생성 = /uploadPath/imgUplod
		String ymdPath = UploadFileUtils.calcPath(imgUploadPath); // 위의 폴더를 기준으로 연월일 폴더 생성
		String fileName = null; // 기본 경로와 별개로 작성되는 경로 + 파일이름
		
		if (file.getOriginalFilename() != null && file.getOriginalFilename() != "") {
			// 파일 인풋박스에 첨부된 파일이 없다면(=첨부된 파일이 이름이 없다면)
			
			fileName = UploadFileUtils.fileUpload(imgUploadPath, file.getOriginalFilename(), file.getBytes(), ymdPath);
			
			// gdsImg에 원본 파일 경로 + 파일명 저장
			vo.setGdsImg(File.separator + "imgUpload" + ymdPath + File.separator + fileName);
			// gdsThumbImg에 썸네일 파일 경로 + 썸네일 파일명 저장
			vo.setGdsThumbImg(
					File.separator + "imgUpload" + ymdPath + File.separator + "s" + File.separator + "s_" + fileName);
			
		} else { // 첨부된 파일이 없다면
			fileName = File.separator + "images" + File.separator + "none.jpg";
			// 미리 준비된 none.png파일을 대신 출력함
			
			vo.setGdsImg(fileName);
			vo.setGdsThumbImg(fileName);
		}
		
		service.register(vo);
		
		return "redirect:/admin/index";
	}

	// 상품 목록 (페이징, 검색)
	@RequestMapping(value = "/goods/list", method = RequestMethod.GET)
	public void getGoodsList(Model model, CriteriaVO cri) throws Exception {
		logger.info("get goods list");
		
		List<GoodsViewVO> listPaging = service.goodsListPaging(cri);
		model.addAttribute("list", listPaging);
		
		int count = service.getCount();
		CriteriaVO pageMake = new CriteriaVO(cri, count);
		model.addAttribute("pageMaker", pageMake);
	}

	// 상품 조회
	@RequestMapping(value = "/goods/view", method = RequestMethod.GET)
	public void getGoodsview(@RequestParam("n") int gdsNum, Model model) throws Exception {
		logger.info("get goods view");
		
		GoodsViewVO goods = service.goodsView(gdsNum);
		
		model.addAttribute("goods", goods);
	}

	// 상품 수정 (GET)
	@RequestMapping(value = "/goods/modify", method = RequestMethod.GET)
	public void getGoodsModify(@RequestParam("n") int gdsNum, Model model) throws Exception {
		logger.info("get goods modify");
		
		GoodsViewVO goods = service.goodsView(gdsNum);
		model.addAttribute("goods", goods);
	}

	// 상품 수정 (POST)
	@RequestMapping(value = "/goods/modify", method = RequestMethod.POST)
	public String postGoodsModify(GoodsVO vo, MultipartFile file, HttpServletRequest req) throws Exception {
		logger.info("post goods modify");
		
		// 새로운 파일이 등록되었는지 확인
		if (file.getOriginalFilename() != null && file.getOriginalFilename() != "") {
			// 기존 파일을 삭제
			new File(uploadPath + req.getParameter("gdsImg")).delete();
			new File(uploadPath + req.getParameter("gdsThumbImg")).delete();
			
			// 새로 첨부한 파일을 등록
			String imgUploadPath = uploadPath + File.separator + "imgUpload";
			String ymdPath = UploadFileUtils.calcPath(imgUploadPath);
			String fileName = UploadFileUtils.fileUpload(imgUploadPath, file.getOriginalFilename(), file.getBytes(),
					ymdPath);
			
			vo.setGdsImg(File.separator + "imgUpload" + ymdPath + File.separator + fileName);
			vo.setGdsThumbImg(
					File.separator + "imgUpload" + ymdPath + File.separator + "s" + File.separator + "s_" + fileName);
			
		} else { // 새로운 파일이 등록되지 않았다면
			// 기존 이미지를 그래도 사용
			vo.setGdsImg(req.getParameter("gdsImg"));
			vo.setGdsThumbImg(req.getParameter("gdsThumbImg"));
		}
		
		service.goodsModify(vo);
		
		return "redirect:/admin/index";
	}

	// 상품 삭제
	@RequestMapping(value = "/goods/delete", method = RequestMethod.POST)
	public String postGoodsDelete(@RequestParam("n") int gdsNum) throws Exception {
		logger.info("post goods delete");
		
		service.goodsDelete(gdsNum);
		
		return "redirect:/admin/goods/list";
	}

	// ck 에디터에서 파일 업로드
	@RequestMapping(value = "/goods/ckUpload", method = RequestMethod.POST)
	public void postCKEditorImgUpload(HttpServletRequest req, HttpServletResponse res,
			@RequestParam MultipartFile upload) throws Exception {
		logger.info("post CKEditor img upload");
		
		// 랜덤 문자 생성
		UUID uid = UUID.randomUUID();
		
		OutputStream out = null;
		PrintWriter printWriter = null;
		
		// 인코딩
		res.setCharacterEncoding("utf-8");
		res.setContentType("text/html;charset=utf-8");
		
		try {
			
			String fileName = upload.getOriginalFilename(); // 파일 이름 가져오기
			byte[] bytes = upload.getBytes();
			
			// 업로드 경로
			String ckUploadPath = uploadPath + File.separator + "ckUpload" + File.separator + uid + "_" + fileName;
			
			out = new FileOutputStream(new File(ckUploadPath));
			out.write(bytes);
			out.flush(); // out에 저장된 데이터를 전송하고 초기화
			
			String callback = req.getParameter("CKEditorFuncNum");
			printWriter = res.getWriter();
			String fileUrl = "/resources/ckUpload/" + uid + "_" + fileName; // 작성화면
			
			printWriter.println("{\"filename\" : \"" + fileName + "\", \"uploaded\" : 1, \"url\":\"" + fileUrl + "\"}");
			
			printWriter.flush();
			
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			try {
				if (out != null) {
					out.close();
				}
				if (printWriter != null) {
					printWriter.close();
				}
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return;
	}

	// 주문 목록 (GET)
	@RequestMapping(value = "/shop/orderList", method = RequestMethod.GET)
	public void getOrderList(Model model) throws Exception {
		logger.info("get order list");
		
		List<OrderVO> orderList = service.orderList();
		
		model.addAttribute("orderList", orderList);
	}

	// 주문 목록 (POST)
	@RequestMapping(value = "/shop/orderList", method = RequestMethod.POST)
	public String postDeleteOrder(OrderVO order, String orderId) throws Exception {
		logger.info("post order list");
		
		service.deleteOrder(order.getOrderId());
		
		return "redirect:/admin/shop/orderList";
	}

	// 주문 상세 목록 (GET)
	@RequestMapping(value = "/shop/orderView", method = RequestMethod.GET)
	public void getOrderList(@RequestParam("n") String orderId, OrderVO order, Model model) throws Exception {
		logger.info("get order view");
		
		order.setOrderId(orderId);
		List<OrderListVO> orderView = service.orderView(order);
		
		model.addAttribute("orderView", orderView);
	}

	// 주문 상세 목록 (POST)
	@RequestMapping(value = "/shop/orderView", method = RequestMethod.POST)
	public String delivery(OrderVO order) throws Exception {
		logger.info("post order view");
		
		service.delivery(order);
		
		List<OrderListVO> orderView = service.orderView(order);
		GoodsVO goods = new GoodsVO();
		
		for (OrderListVO i : orderView) {
			goods.setGdsNum(i.getGdsNum());
			goods.setGdsStock(i.getCartStock());
			service.changeStock(goods);
		}
		
		return "redirect:/admin/shop/orderView?n=" + order.getOrderId();
	}

	// 모든 소감(댓글) (GET)
	@RequestMapping(value = "/shop/allReply", method = RequestMethod.GET)
	public void getAllReply(Model model) throws Exception {
		logger.info("get all reply");
		
		List<ReplyListVO> reply = service.allReply();
		
		model.addAttribute("reply", reply);
	}

	// 모든 소감(댓글) (POST)
	@RequestMapping(value = "/shop/allReply", method = RequestMethod.POST)
	public String postAllReply(ReplyVO reply) throws Exception {
		logger.info("post all reply");
		
		service.deleteReply(reply.getRepNum());
		
		return "redirect:/admin/shop/allReply";
	}

	// 공지사항
	@RequestMapping(value = "/notice/notice", method = RequestMethod.GET)
	public String notice() throws Exception {
		
		return "admin/notice/notice";
	}

	// 공지사항 작성 : POST
	@RequestMapping(value = "/notice/notice", method = RequestMethod.POST)
	public String noticeWrite(HttpSession session, BoardVO boardVO) throws Exception {
		
		MemberVO member = (MemberVO) session.getAttribute("member");
		String userId = member.getUserId();
		
		boardVO.setUserId(userId);
		
		service.noticeWrite(boardVO);
		
		return "redirect:/admin/notice/list";
	}

	// 공지사항 목록 조회
	@RequestMapping(value = "/notice/list", method = RequestMethod.GET)
	public String noticeList(Model model, @ModelAttribute("scri") SearchCriteria scri) throws Exception {
		logger.info("list");
		
		model.addAttribute("list", service.list(scri));
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(scri);
		pageMaker.setTotalCount(service.listCount(scri));
		
		model.addAttribute("pageMaker", pageMaker);
		
		return "admin/notice/list";
	}

	// 공지사항 상세보기
	@RequestMapping(value = "/notice/noticeView", method = RequestMethod.GET)
	public String noticeView(BoardVO boardVO, Model model) throws Exception {
		logger.info("view");
		
		model.addAttribute("view", service.noticeView(boardVO.getBrdNum()));
		
		return "admin/notice/noticeView";
	}

	// 공지사항 수정뷰
	@RequestMapping(value = "/notice/updateView", method = RequestMethod.GET)
	public String updateView(BoardVO board, Model model) throws Exception {
		logger.info("updateView");
		
		model.addAttribute("update", service.noticeView(board.getBrdNum()));
		
		return "admin/notice/updateView";
	}

	// 공지사항 수정
	@RequestMapping(value = "/notice/update", method = RequestMethod.POST)
	public String noticeUpdate(BoardVO board) throws Exception {
		logger.info("notice Update");
		
		service.noticeUpdate(board);
		
		return "redirect:/admin/notice/list";
	}

	// 공지사항 삭제
	@RequestMapping(value = "/notice/delete", method = RequestMethod.GET)
	public String noticeDelete(BoardVO board) throws Exception {
		logger.info("notice delete");
		
		service.noticeDelete(board.getBrdNum());
		
		return "redirect:/admin/notice/list";
	}

	// 회원 목록
	@RequestMapping(value = "/member/memberList", method = RequestMethod.GET)
	public void memberList(Model model, MemberVO member) throws Exception {
		logger.info("member list");
		
		List<MemberVO> List = service.memberList(member);
		
		model.addAttribute("List", List);
	}

	// 탈퇴 회원 목록
	@RequestMapping(value = "/member/deleteMemberList", method = RequestMethod.GET)
	public void deleteMemberList(Model model, MemberVO member) throws Exception {
		logger.info("delete member list");
		
		List<MemberVO> deleteList = service.deleteMemberList(member);
		
		model.addAttribute("deleteList", deleteList);
	}

	// 탈퇴 회원 삭제

	@RequestMapping(value = "/member/deleteMemberList", method = RequestMethod.POST)
	public String memberDelete(MemberVO member, String userId) throws Exception {
		logger.info("post member delete");
		
		service.memberDelete(member.getUserId());
		
		return "redirect:/admin/member/deleteMemberList";
	}

} // end public class AdminController
