package com.spring.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.spring.board.domain.BoardVO;
import com.spring.board.domain.BoardCriteria;
import com.spring.board.mapper.BoardMapper;
import com.spring.board.mapper.BoardCommentMapper;
import com.spring.board.service.BoardService;

@Service
public class BoardServieImpl implements BoardService {

	@Autowired
	private BoardMapper bmapper;
	
	@Autowired
	private BoardCommentMapper commentMapper;
	
	
	@Override
	public boolean insert(BoardVO vo) {
		//새글 등록		
		boolean result=bmapper.insert(vo)>0?true:false;
				
		return result;
		
	}
	

	@Transactional
	@Override
	public boolean delete(int bno) {
		
		//댓글 삭제
		commentMapper.deleteAll(bno);		
		
		//게시글 삭제
		return bmapper.delete(bno)>0?true:false;
	}

	@Transactional
	@Override
	public boolean update(BoardVO vo) {
	
		//게시글 수정
		boolean modifyResult = bmapper.update(vo)>0?true:false;
		
		return modifyResult;
	}


	@Override
	public BoardVO read(int rno) {		
		return bmapper.read(rno);
	}

	@Override
	public int total(BoardCriteria cri) {		
		return bmapper.totalCnt(cri);
	}


	@Override
	public List<BoardVO> list(BoardCriteria cri) {
		return bmapper.list(cri);
	}




	
}

	

