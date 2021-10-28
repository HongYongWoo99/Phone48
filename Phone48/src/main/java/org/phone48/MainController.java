package org.phone48;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URL;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
import org.springframework.web.bind.annotation.RequestMapping;
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
	public String login(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws IOException {
		String id = request.getParameter("id");
		String pass = request.getParameter("pass");
		System.out.println(id + pass);
		if(session.getAttribute("client") == null){
			id = request.getParameter("id");
			pass = request.getParameter("pass");
			if(id.equals("admin") && pass.equals("1234"))
				return "admin/adminPage";
		}else {
			id = ((MemberDTO) session.getAttribute("client")).getId();
			pass = ((MemberDTO) session.getAttribute("client")).getPassword();
		}
		MemberDTO dto = memberService.login(id, pass);
		if (dto == null) {
			response.setContentType("text/html;charset=utf-8");
			response.getWriter().write("<script>alert('아이디 비밀번호 확인하세요'); history.back();</script>");
			return null;
		}else {
			request.getSession().setAttribute("client", dto);
			return boardMain(request, request.getSession());
		}
	}
	//-------------------------------------KANG
	@RequestMapping("boardList.do")
	public String boardMain(HttpServletRequest request, HttpSession session) {
		System.out.println("보드 리스트 실행");
		//1. 현재 페이지 번호 - 없으면 페이지 번호 1로 설정
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
	public String boardView(HttpServletRequest request,HttpSession session) {
		int bno = Integer.parseInt(request.getParameter("bno"));
		boardService.addBoardCount(bno);
		BoardDTO dto = boardService.selectBoardContent(bno);
		request.setAttribute("board", dto);

		// 파일목록
		ArrayList<FileDTO> flist = boardService.selectFileList(bno);
		request.setAttribute("flist", flist);

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
					.write("<script>alert('없는 회원 입니다. 확인 후 다시 수행해 주세요');" + "location.href = '/';</script>");
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
			
		String imageURL = request.getParameter("picture");
		
		String id = ((MemberDTO) session.getAttribute("client")).getId();
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		int price = Integer.parseInt(request.getParameter("price"));
		String model = request.getParameter("model");
		int btag = Integer.parseInt(request.getParameter("btag"));
		int atag = Integer.parseInt(request.getParameter("atag"));
		int ctag = Integer.parseInt(request.getParameter("ctag"));
		int ptag = Integer.parseInt(request.getParameter("ptag"));

		int bno = boardService.insertBoard(new BoardDTO(0, id, null, 0, title, content, price, '0', model, btag, atag, ctag, ptag, 0));//오라클에 char(1), dto boolean으로 설정
		
		// 업로드한 파일 목록
		System.out.println(request.getParameterMap());
		List<MultipartFile> fileList = request.getFiles("file");
		System.out.println(fileList.size());
		String path = "c:\\fileupload\\" + id + "\\";
		ArrayList<FileDTO> flist = new ArrayList<FileDTO>();
		int i = 1;
		for (MultipartFile mf : fileList) {
			// 원본 파일명
			String originalFileName = mf.getOriginalFilename();
			long fileSize = mf.getSize();
			if (fileSize == 0)
				continue;
			// 저장할 파일 경로 완성
			SimpleDateFormat format = new SimpleDateFormat("yyyy_MM_dd_hh_mm_ss");
			int idx = originalFileName.lastIndexOf(".");
			// 실제 저장할 파일 경로
			String saveName = format.format(Calendar.getInstance().getTime()) + "_" + id + "_" + i + "."
					+ originalFileName.substring(idx + 1);
			i++;
			String saveFile = path + saveName;
			System.out.println(saveFile);
			File f = new File(saveFile);
			FileDTO dto = new FileDTO(f);
			dto.setOriginfilename(originalFileName);
			dto.setBno(bno);
			dto.setId(id);
			flist.add(dto);
			System.out.println(dto.toString());
			try {
				// 파일 업로드
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
		
		try {
			URL imgURL = new URL(imageURL);
			String extension = imageURL.substring(imageURL.lastIndexOf(".")+1); // 확장자
			String fileName = "나를_업로드_해봐"; // 이미지 이름
			
			BufferedImage image = ImageIO.read(imgURL);
			File file = new File("resource/" + fileName + "." + extension);
			if(!file.exists()) { // 해당 경로의 폴더가 존재하지 않을 경우
				file.mkdirs(); // 해당 경로의 폴더 생성
			}
			
			ImageIO.write(image, extension, file); // image를 file로 업로드
		} catch (Exception e) {
			e.printStackTrace();
		}
	
		
		boardService.insertFileList(flist);

		return "redirect:boardList.do";
	}
	
	//게시글 삭제
		@RequestMapping("boardDelete.do")
		public String boardDelete(HttpServletRequest request) {
			int bno = Integer.parseInt(request.getParameter("bno"));
			boardService.deleteBoard(bno);
			return "redirect:boardList.do";
		}
		//게시글 수정 페이지로 이동
		@RequestMapping("boardUpdateView.do")
		public String boardUpdateView(HttpServletRequest request) {
			int bno = Integer.parseInt(request.getParameter("bno"));
			BoardDTO dto = boardService.selectBoardContent(bno);
			request.setAttribute("board", dto);
			return "board/board_update_view";
		}
		
		//게시글 수정
		@RequestMapping("boardUpdate.do")
		public String boardUpdate(HttpServletRequest request, RedirectAttributes redirectAttributes) {
			String title = request.getParameter("title");
			String content = request.getParameter("content");
			int bno = Integer.parseInt(request.getParameter("bno"));
			
			boardService.updateBoard(bno, title, content);
			redirectAttributes.addAttribute("bno",bno);
			return "redirect:/boardView.do";
		}
		//-----------------------------------KANG
		// ----------------------------------CHOI
		@RequestMapping("reviewList.do") //리뷰 리스트 화면 호출  
		private String reviewList(HttpServletRequest request, HttpSession session) {
			String pageNo = request.getParameter("pageNo");
			int currentPageNo = pageNo == null || pageNo.equals("") ? 1 : Integer.parseInt(pageNo);
			List<ReviewDTO> list = boardService.selectReview(currentPageNo);
			int count = boardService.selectReviewCount(); 
			PaggingVO vo = new PaggingVO(count, currentPageNo, 5, 4);
			request.setAttribute("pagging", vo);
			request.setAttribute("list", list);
			return "review/list"; 
		    }
		@RequestMapping("reviewWriteView.do") //리뷰 상세보기
		public String reviewWriteView() {
			return "review/review_write";
		}
		
		
		//---------------------------------------------Lee
		@RequestMapping("search.do")
		public String search(HttpServletRequest request, HttpServletResponse response) throws IOException {
			String kind = request.getParameter("kind");
			String search = request.getParameter("search");
		
			List<MemberDTO> list = memberService.selectMember(kind,search);
			
			JSONArray arr = new JSONArray(list);
			JSONObject obj = new JSONObject();
			obj.put("result", arr);
			if(list.size() != 0) {
				obj.put("code", 200);
				obj.put("message", "정상적으로 조회되었습니다.");
			}else {
				obj.put("code", 500);
				obj.put("message", "조회된 데이터가 없습니다.");
				
			}
			response.setContentType("text/html;charset=utf-8");
			response.getWriter().write(obj.toString());
			
			return null;
		}
		//----------------------------------------------Lee
}