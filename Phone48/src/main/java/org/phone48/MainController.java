package org.phone48;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import org.json.JSONArray;
import org.json.JSONObject;
import org.phone48.dto.BoardDTO;
import org.phone48.dto.FileDTO;
import org.phone48.dto.MemberDTO;
import org.phone48.dto.PaggingVO;
import org.phone48.dto.ReviewDTO;
//import org.phone48.dto.Paging;
import org.phone48.service.BoardService;
import org.phone48.service.MemberService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class MainController {
	private BoardService boardService;
	private MemberService memberService;

	public MainController(BoardService boardService, MemberService memberService) {
		this.boardService = boardService;
		this.memberService = memberService;
	}

	@RequestMapping("/")
	public String main() {
		return "index";
	}

	@RequestMapping("login.do")
	public String login(HttpServletRequest request, HttpServletResponse response, HttpSession session)
			throws IOException {
		String id = request.getParameter("id");
		String pass = request.getParameter("pass");
		System.out.println(id + pass);
		if (session.getAttribute("client") == null) {
			id = request.getParameter("id");
			pass = request.getParameter("pass");
			if (id.equals("admin") && pass.equals("1234"))
				return "admin/admin_page";
		} else {
			id = ((MemberDTO) session.getAttribute("client")).getId();
			pass = ((MemberDTO) session.getAttribute("client")).getPassword();
		}
		MemberDTO dto = memberService.login(id, pass);
		if (dto == null) {
			response.setContentType("text/html;charset=utf-8");
			response.getWriter().write("<script>alert('????????? ???????????? ???????????????'); history.back();</script>");
			return null;
		} else {
			request.getSession().setAttribute("client", dto);
			return boardMain(request, request.getSession());
		}
	}

	@RequestMapping("logout.do")
	public String logout(HttpSession session) {
		session.invalidate();
		return "index";
	}
	
	@RequestMapping("termsOfUse.do")
	public String termsOfUse() {
		return "terms_of_use";
	}

	@RequestMapping("register.do")
	public String register() {
		return "register";
	}
	
	@RequestMapping("buyList.do")
	public String buyList() {
		return "buy_list";
	}
	


	@RequestMapping("boardList.do")
	public String boardMain(HttpServletRequest request, HttpSession session) {
		System.out.println("?????? ????????? ??????");
		// 1. ?????? ????????? ?????? - ????????? ????????? ?????? 1??? ??????
		String pageNo = request.getParameter("pageNo");
		int currentPageNo = pageNo == null || pageNo.equals("") ? 1 : Integer.parseInt(pageNo);
		List<BoardDTO> list = boardService.selectBoard(currentPageNo);
		System.out.println(list.toString());
		int count = boardService.selectBoardCount();
		PaggingVO vo = new PaggingVO(count, currentPageNo, 5, 4);
		request.setAttribute("pagging", vo);
		request.setAttribute("list", list);
		return "board/board_list";
	}

	@RequestMapping("boardView.do")
	public String boardView(@RequestParam("bno") int bno, Model model) {
		model.addAttribute("bdetail", boardService.boardDetailService(bno));

		return "board/board_view";
	}

	@RequestMapping("memberUpdateView.do")
	public String memberUpdateView(HttpSession session) {
		return "member/member_update";
	}

	@RequestMapping("memberUpdate.do")
	public String memberUpdate(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String id = request.getParameter("id");
		String password = request.getParameter("password");
		String email = request.getParameter("email");
		String tell = request.getParameter("tell");
		String nickname = request.getParameter("nickname");
		MemberDTO dto = new MemberDTO(id, password, email, tell, 0, nickname, 0);
		int count = memberService.updateMember(dto);
		if (count == 0) {
			request.getSession().invalidate();
			response.setContentType("text/html;charset=utf-8");
			response.getWriter()
					.write("<script>alert('?????? ?????? ?????????. ?????? ??? ?????? ????????? ?????????');" + "location.href = '/';</script>");
			return null;
		}
		return memberUpdateView(request.getSession());
	}

	@RequestMapping("boardWriteView.do")
	public String boardWriteView() {
		return "board/board_write";
	}

	@RequestMapping("boardWrite.do")
	public String boardWrite(MultipartHttpServletRequest request, HttpSession session)
			throws UnsupportedEncodingException {

		String id = ((MemberDTO) session.getAttribute("client")).getId();
		String title = request.getParameter("title");
		int price = Integer.parseInt(request.getParameter("price"));
		String content = request.getParameter("content");
		String nickname = ((MemberDTO) session.getAttribute("client")).getNickname();
		String btag = request.getParameter("btag");
		String atag = request.getParameter("atag");
		String model = request.getParameter("model");
		String ctag = request.getParameter("ctag");
		String ptag = request.getParameter("ptag");
		int trade = Integer.parseInt(request.getParameter("trade"));

		int bno = boardService.insertBoard(
				new BoardDTO(0, id, nickname, trade, title, content, btag, atag, model, ctag, ptag, price));
		// ???????????? ?????? ??????
		System.out.println(request.getParameterMap());
		List<MultipartFile> fileList = request.getFiles("file");
		System.out.println(fileList.size());
		String path = "c:\\fileupload\\" + nickname + "\\";
		ArrayList<FileDTO> flist = new ArrayList<FileDTO>();
		int i = 1;
		for (MultipartFile mf : fileList) {
			// ?????? ?????????
			String originalFileName = mf.getOriginalFilename();
			long fileSize = mf.getSize();
			if (fileSize == 0)
				continue;
			// ????????? ?????? ?????? ??????
			SimpleDateFormat format = new SimpleDateFormat("yyyy_MM_dd_hh_mm_ss");
			int idx = originalFileName.lastIndexOf(".");
			// ?????? ????????? ?????? ??????
			String saveName = format.format(Calendar.getInstance().getTime()) + "_" + nickname + "_" + i + "."
					+ originalFileName.substring(idx + 1);
			i++;
			String saveFile = path + saveName;
			System.out.println(saveFile);
			File f = new File(saveFile);
			FileDTO dto = new FileDTO(f);
			dto.setOriginfilename(originalFileName);
			dto.setBno(bno);
			dto.setNickname(nickname);
			flist.add(dto);
			System.out.println(dto.toString());
			try {
				// ?????? ?????????
				File parentPath = new File(path);
				if (!parentPath.exists())
					parentPath.mkdirs();
				mf.transferTo(f);
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}

		}
		boardService.insertFileList(flist);

		return "redirect:boardList.do";
	}

	// ????????? ??????
	@RequestMapping("boardDelete.do")
	public String boardDelete(HttpServletRequest request) {
		int bno = Integer.parseInt(request.getParameter("bno"));
		boardService.deleteBoard(bno);
		return "redirect:boardList.do";
	}

	// ????????? ?????? ???????????? ??????
	@RequestMapping("boardUpdateView.do")
	public String boardUpdateView(HttpServletRequest request) {
		int bno = Integer.parseInt(request.getParameter("bno"));
		BoardDTO dto = boardService.selectBoardContent(bno);
		request.setAttribute("board", dto);
		return "board/board_update_view";
	}

	// ????????? ??????
	@RequestMapping("boardUpdate.do")
	public String boardUpdate(HttpServletRequest request, RedirectAttributes redirectAttributes) {
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		int bno = Integer.parseInt(request.getParameter("bno"));

		boardService.updateBoard(bno, title, content);
		redirectAttributes.addAttribute("bno", bno);
		return "redirect:/boardView.do";
	}
	// -----------------------------------KANG
	// ----------------------------------CHOI

	// ?????? ????????? ?????? ??????
	@RequestMapping("reviewList.do")
	private String reviewList(HttpServletRequest request, HttpSession session) {
		String pageNo = request.getParameter("pageNo");
		Integer reviewPoint = null;
		int currentPageNo = pageNo == null || pageNo.equals("") ? 1 : Integer.parseInt(pageNo);
		List<ReviewDTO> list = boardService.selectReview(currentPageNo);
		for (ReviewDTO reviewDTO : list) {
			MemberDTO memberDTO = (MemberDTO) session.getAttribute("client");
			memberDTO.getId();
			if (reviewDTO.getId().equals(memberDTO.getId())) {
				reviewPoint = reviewDTO.getReview_point();
				break;
			}
		}
		Map<String, Object> map = boardService.reviewSum();
		int count = boardService.selectReviewCount();
		PaggingVO vo = new PaggingVO(count, currentPageNo, 5, 4);
		request.setAttribute("pagging", vo);
		request.setAttribute("list", list);
		request.setAttribute("client", session.getAttribute("client"));
		request.setAttribute("reviewPoint", reviewPoint);
		request.setAttribute("totalPoint", map.get("TOTAL_POINT"));
		return "review/list";
	}

	// ?????? ????????????
	@RequestMapping("reviewView.do")
	public String reviewView(@RequestParam("rno") int rno, Model model) {

		model.addAttribute("detail", boardService.reviewDetailService(rno));
		return "review/detail";
	}

	// ?????? ????????? ???????????? ??????
	@RequestMapping("reviewWriteView.do")
	public String reviewWriteView() {
		return "review/review_write";
	}

	// ?????? ?????????
	@RequestMapping("reviewWrite.do")
	public String reviewWrite(HttpServletRequest request, HttpSession session) throws Exception {

		String id = ((MemberDTO) session.getAttribute("client")).getId();
		String nickname = ((MemberDTO) session.getAttribute("client")).getNickname();
		String review_content = request.getParameter("review_content");
		int review_point = Integer.parseInt(request.getParameter("review_point"));
		String title = request.getParameter("title");
		int rno = boardService.insertReview(new ReviewDTO(0, id, nickname, review_content, review_point, title));
		System.out.println(request.getParameterMap());

		return "redirect:reviewList.do";
	}

	// ?????? ?????? ???????????? ??????
	@RequestMapping("reviewUpdateView.do")
	public String reviewUpdateView(HttpServletRequest request) {
		int rno = Integer.parseInt(request.getParameter("rno"));
		ReviewDTO dto = boardService.selectReviewContent(rno);
		request.setAttribute("review", dto);

		return "review/update_detail";
	}

	// ?????? ??????
	@RequestMapping("reviewUpdate.do")
	public String reviewUpdate(HttpServletRequest request, RedirectAttributes redirectAttributes) {
		int rno = Integer.parseInt(request.getParameter("rno"));
		String title = request.getParameter("title");
		String review_content = request.getParameter("review_content");
		int review_point = Integer.parseInt(request.getParameter("review_point"));

		boardService.updateReview(rno, title, review_content, review_point);
		redirectAttributes.addAttribute("rno", rno);
		return "redirect:/reviewView.do";
	}

	// ?????? ??????
	@RequestMapping("reviewDelete.do")
	public String reviewDelete(HttpServletRequest request) {
		int rno = Integer.parseInt(request.getParameter("rno"));
		boardService.deleteReview(rno);
		return "redirect:reviewList.do";
	}

	@RequestMapping("myPage.do")
	public String myPage() {
		return "my_page";
	}

	@RequestMapping("customerCenter.do")
	public String customerCenter() {
		return "customer_service_center";
	}

	// ---------------------------------------------CHOI
	// ---------------------------------------------Lee
	@RequestMapping("search.do")
	public String search(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String kind = request.getParameter("kind");
		String search = request.getParameter("search");

		List<MemberDTO> list = memberService.selectMember(kind, search);

		JSONArray arr = new JSONArray(list);
		JSONObject obj = new JSONObject();
		obj.put("result", arr);
		if (list.size() != 0) {
			obj.put("code", 200);
			obj.put("message", "??????????????? ?????????????????????.");
		} else {
			obj.put("code", 500);
			obj.put("message", "????????? ???????????? ????????????.");

		}
		response.setContentType("text/html;charset=utf-8");
		response.getWriter().write(obj.toString());

		return null;
	}
	// ----------------------------------------------Lee
}