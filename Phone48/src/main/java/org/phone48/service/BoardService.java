package org.phone48.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.phone48.dto.BoardDTO;
import org.phone48.dto.FileDTO;
import org.phone48.dto.ReviewDTO;
import org.phone48.mapper.BoardMapper;
import org.springframework.stereotype.Service;

@Service
public class BoardService {
	private BoardMapper mapper;
	//---------------------------KANG
	public BoardService(BoardMapper mapper) {
		super();
		this.mapper = mapper;
	}

	public int selectBoardCount() {
		return mapper.selectBoardCount();
	}

	public int insertBoard(BoardDTO dto) {
		int bno = mapper.selectBoardNo();
		dto.setBno(bno);
		mapper.insertBoard(dto);
		return bno;
	}
	
	public void insertFileList(ArrayList<FileDTO> flist) {
		for(int i=0;i<flist.size();i++) {
			mapper.insertFileInfo(flist.get(i));
		}
	}
	
	public void deleteBoard(int bno) {
		mapper.deleteBoard(bno);
	}
	
	public BoardDTO selectBoardContent(int bno) {
		return mapper.selectBoardContent(bno);
	}
	
	public void updateBoard(int bno, String title, String content) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("bno", bno);
		map.put("title", title);
		map.put("content", content);
		mapper.updateBoard(map);		
	}

	public ArrayList<BoardDTO> selectBoard(int pageNo) {
		return mapper.selectBoard(pageNo);
	}

	public void addBoardCount(int bno) {
		mapper.addBoardCount(bno);
	}

	public ArrayList<FileDTO> selectFileList(int bno) {
		return mapper.selectFileList(bno);
	}
	
	//---------------------------KANG
	//-----------------------------CHOI
	
		// 리뷰 페이징
		public List<ReviewDTO> selectReview(int currentPageNo) {
			return mapper.selectReview(currentPageNo);
		}
		// 리뷰 페이징
		public int selectReviewCount() {
			return mapper.selectReviewCount();
		}
		// 리뷰 글쓰기
		public int insertReview(ReviewDTO dto) {
		int rno = mapper.selectReviewNo();
		dto.setRno(rno);
		mapper.insertReview(dto);
		return rno;
		}
		
		// 리뷰 상세 -
	    public ReviewDTO reviewDetailService(int rno)  {
	    	 return mapper.reviewDetail(rno);
	    }
	    
		// 리뷰 페이징
	    public Map<String,Object> reviewSum() {
	    	return mapper.reviewSum();
	    }

	    // 리뷰 상세 
		public void updateReview(int rno, String title, String review_content, int review_point) {
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("rno", rno);
			map.put("title", title);
			map.put("review_content", review_content);
			map.put("review_point", review_point);
			mapper.updateReview(map);
			
		}
		
		// 리뷰 수정
		public ReviewDTO selectReviewContent(int rno) {
			return mapper.selectReviewContent(rno);
		}
		// 리뷰 삭제
		public void deleteReview(int rno) {
			mapper.deleteReview(rno);
			
		}
		//-----------------------------CHOI

		public BoardDTO boardDetailService(int bno) {
			 return mapper.boardDetail(bno);
		}
}