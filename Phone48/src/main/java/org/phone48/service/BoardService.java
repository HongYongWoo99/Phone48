package org.phone48.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.phone48.dto.BoardDTO;
import org.phone48.dto.Criteria;
import org.phone48.dto.FileDTO;
import org.phone48.dto.ReviewDTO;
import org.phone48.mapper.BoardMapper;
import org.springframework.stereotype.Service;

@Service
public class BoardService {
	private BoardMapper mapper;

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
	
    // 게시글 목록 --CHOI
    public List<ReviewDTO> reviewListService() throws Exception{
        return mapper.reviewList();
    }
    // 게시글 상세 --CHOI
    public ReviewDTO reviewDetailService(int rno) throws Exception {
    	 return mapper.reviewDetail(rno);
    }
    //게시글 작성 --CHOI
    public int reviewInsertService(ReviewDTO board) throws Exception{
        return mapper.reviewInsert(board);
    }
    // 페이징 --CHOI
    public int boardListCnt() throws Exception {
        return mapper.boardListCnt();
    }
    // 페이징 --CHOI
    public List<Map<String, Object>> boardList(Criteria cri) throws Exception {
        return mapper.boardList(cri);
    }

}
