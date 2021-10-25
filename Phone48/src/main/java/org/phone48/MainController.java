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

import org.phone48.dto.BoardDTO;
import org.phone48.dto.Criteria;
import org.phone48.dto.FileDTO;
import org.phone48.dto.MemberDTO;
import org.phone48.dto.PaggingVO;
import org.phone48.dto.Paging;
import org.phone48.dto.ReviewDTO;
import org.phone48.service.BoardService;
import org.phone48.service.MemberService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class MainController {
	
	private BoardService boardService;
	private MemberService memberService;
	public MainController(BoardService boardService, MemberService memberService) {
		super();
		this.boardService = boardService;
		this.memberService = memberService;
	}
	@RequestMapping("/")
	public String main() {
		return "main";
	}
	
	@RequestMapping("boardList.do")
	public String boardMain(HttpServletRequest request, HttpSession session) {
		//1. 현재 페이지 번호 - 없으면 페이지 번호 1로 설정
		String pageNo = request.getParameter("pageNo");
		int currentPageNo = pageNo == null || pageNo.equals("") ? 1 : Integer.parseInt(pageNo);
		ArrayList<BoardDTO> list = boardService.selectBoard(currentPageNo);
		
		int count = boardService.selectBoardCount();
		PaggingVO vo = new PaggingVO(count, currentPageNo, 5, 4);
		request.setAttribute("pagging", vo);
		return "board/board_list";
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

		String title = request.getParameter("title");
		String content = request.getParameter("content");
		String nickname = ((MemberDTO) session.getAttribute("client")).getNickname();
		int bno = boardService.insertBoard(new BoardDTO(0, null, nickname, 0, title, content, 0, '0'));//오라클에 char(1), dto boolean으로 설정
		// 업로드한 파일 목록
		System.out.println(request.getParameterMap());
		List<MultipartFile> fileList = request.getFiles("file");
		System.out.println(fileList.size());
		String path = "c:\\fileupload\\" + nickname + "\\";
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
		// ----------------------------------CHOI
		 @RequestMapping("/list") //게시판 리스트 화면 호출  
		    private String reviewList(Model model) throws Exception{
		        
		        model.addAttribute("list", boardService.reviewListService());
		        
		        return "list"; 
		    }
		    
		    @RequestMapping("/detail/{rno}") //게시물 상세 페이지
		    private String boardDetail(@PathVariable int rno, Model model) throws Exception{
		        model.addAttribute("detail", boardService.reviewDetailService(rno));
		        return "detail";
		    }

		    @RequestMapping("/insert") //게시글 작성폼 호출  
		    private String reviewInsertForm(){
		        
		        return "insert";
		    }
		    
		    @RequestMapping("/insertProc") //게시글 작성
		    private String reviewInsertProc(HttpServletRequest request) throws Exception{
		        
		        ReviewDTO board = new ReviewDTO(0, null, null, null, 0);
		        
		        board.setReview_content(request.getParameter("content"));
		        
		        boardService.reviewInsertService(board);
		        
		        return "redirect:/list";
		    }
		    
		    @RequestMapping("/list") //페이징
		    public String boardList(Criteria cri, Model model) throws Exception {
		 
		        // 전체 글 개수
		        int boardListCnt = boardService.boardListCnt();
		        
		        // 페이징 객체
		        Paging paging = new Paging();
		        paging.setCri(cri);
		        paging.setTotalCount(boardListCnt);    
		        
		        List<Map<String, Object>> list = boardService.boardList(cri);
		        
		        model.addAttribute("list", list);    
		        model.addAttribute("paging", paging);    
		                
		        return "list";
		    }
	//---------------------------------------------CHOI
}
