package com.spring.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.spring.board.domain.BoardAttachFileDTO;
import com.spring.board.domain.BoardVO;
import com.spring.board.domain.Criteria;
import com.spring.board.mapper.BoardAttachMapper;
import com.spring.board.mapper.BoardMapper;
import com.spring.board.mapper.CommentMapper;
import com.spring.board.service.BoardService;

@Service
public class BoardServieImpl implements BoardService {

	@Autowired
	private BoardMapper mapper;
	
	@Autowired
	private CommentMapper commentMapper;
	
	@Transactional
	@Override
	public boolean insert(BoardVO vo) {
		//새글 등록		
		boolean result=mapper.insert(vo)>0?true:false;
				
		return result;
		
	}
	

	@Transactional
	@Override
	public boolean delete(int bno) {
		
		//댓글 삭제
		commentMapper.deleteAll(bno);		
		
		//게시글 삭제
		return mapper.delete(bno)>0?true:false;
	}

	@Transactional
	@Override
	public boolean update(BoardVO vo) {
	
		//게시글 수정
		boolean modifyResult = mapper.update(vo)>0?true:false;
		
		return modifyResult;
	}

	@Override
	public List<BoardVO> list(Criteria cri) {		
		return mapper.list(cri);
	}

	@Override
	public BoardVO read(int rno) {		
		return mapper.read(rno);
	}

	@Override
	public int total(Criteria cri) {		
		return mapper.totalCnt(cri);
	}


	


	
	}

	

	
}

