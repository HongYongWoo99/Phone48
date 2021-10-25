package org.phone48.mapper;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.phone48.dto.BoardDTO;
import org.phone48.dto.Criteria;
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

	
	//리뷰 개수  --CHOI
//    public int boardCount() throws Exception;
//    
//    //리뷰 목록  --CHOI
//    public List<ReviewDTO> reviewList() throws Exception;
//    
//    //리뷰 상세	--CHOI
//    public ReviewDTO reviewDetail(int rno) throws Exception;
//
//    //리뷰 작성  --CHOI
//    public int reviewInsert(ReviewDTO board) throws Exception;
//    
//    //페이징 --CHOI
//    public List<Map<String, Object>> boardList(Criteria cri) throws Exception;
//    
//    public int boardListCnt() throws Exception;
}
