package org.phone48.mapper;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.phone48.dto.BoardDTO;
import org.phone48.dto.FileDTO;
import org.phone48.dto.ReviewDTO;

@Mapper
public interface BoardMapper {
	
	//----------------------KANG
	int selectBoardCount();

	int selectBoardNo();

	int insertBoard(BoardDTO dto);

	int insertFileInfo(FileDTO fileDTO);

	int deleteBoard(int bno);

	BoardDTO selectBoardContent(int bno);

	int updateBoard(HashMap<String, Object> map);

	ArrayList<BoardDTO> selectBoard(int pageNo);

	int addBoardCount(int bno);

	ArrayList<FileDTO> selectFileList(int bno);
	//----------------------KANG

	//----------------------CHOI
		List<ReviewDTO> selectReview(int currentPageNo);

		int selectReviewCount();

		int selectReviewNo();

		int insertReview(ReviewDTO dto);

		public ReviewDTO reviewDetail(int rno);

		Map<String, Object> reviewSum();

		int updateReview(HashMap<String, Object> map);

		ReviewDTO selectReviewContent(int rno);

		int deleteReview(int rno);
		//----------------------CHOI

		BoardDTO boardDetail(int bno);
		
}