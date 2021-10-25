package org.phone48.board.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.phone48.board.dto.Criteria;
import org.phone48.board.dto.Paging;
import org.phone48.board.dto.ReviewDTO;
import org.phone48.board.service.BoardService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class BoardController {
	@Resource(name="org.phone48.board.service.BoardService")
    BoardService2 mBoardService;
    
    @RequestMapping("/list") //게시판 리스트 화면 호출  
    private String reviewList(Model model) throws Exception{
        
        model.addAttribute("list", mBoardService.reviewListService());
        
        return "list"; 
    }
    
    @RequestMapping("/detail/{rno}") //게시물 상세 페이지
    private String boardDetail(@PathVariable int rno, Model model) throws Exception{
        model.addAttribute("detail", mBoardService.reviewDetailService(rno));
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
        
        mBoardService.reviewInsertService(board);
        
        return "redirect:/list";
    }
    
    @RequestMapping("/list") //페이징
    public String boardList(Criteria cri, Model model) throws Exception {
 
        // 전체 글 개수
        int boardListCnt = mBoardService.boardListCnt();
        
        // 페이징 객체
        Paging paging = new Paging();
        paging.setCri(cri);
        paging.setTotalCount(boardListCnt);    
        
        List<Map<String, Object>> list = mBoardService.boardList(cri);
        
        model.addAttribute("list", list);    
        model.addAttribute("paging", paging);    
                
        return "list";
    }

}
