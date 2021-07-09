package com.spring.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.spring.board.domain.BoardVO;
import com.spring.board.domain.CommentVO;
import com.spring.board.mapper.BoardMapper;
import com.spring.board.mapper.CommentMapper;

@Service
public class CommentServiceImpl implements CommentService {

	@Autowired
	private CommentMapper mapper;
	
	@Autowired
	private BoardMapper boardMapper;
	
	
	@Transactional
	@Override
	public boolean commentInsert(CommentVO reply) {
		
//		boardMapper.replyCntUpdate(reply.getBno(), 1);
		return mapper.insert(reply)>0?true:false;
	}


	@Override
	public ReplyVO replyGet(int rno) {		
		return mapper.read(rno);
	}


	@Override
	public boolean replyUpdate(ReplyVO reply) {		
		return mapper.update(reply)>0?true:false;
	}


	@Transactional
	@Override
	public boolean replyDelete(int rno) {	
		
		//rno를 이용해서 bno 알아내기
		ReplyVO reply=mapper.read(rno);		
		
//		boardMapper.replyCntUpdate(reply.getBno(), -1);
		return mapper.delete(rno)>0?true:false;
	}


	@Override
	public ReplyPageVO getList(Criteria cri, int bno) {		
		return new ReplyPageVO(mapper.getCountByBno(bno),mapper.list(cri, bno));
	}


	@Override
	public boolean insert(BoardVO vo) {
		// TODO Auto-generated method stub
		return false;
	}


	@Override
	public boolean delete(int bno) {
		// TODO Auto-generated method stub
		return false;
	}


	@Override
	public boolean update(BoardVO vo) {
		// TODO Auto-generated method stub
		return false;
	}


	@Override
	public List<BoardVO> list(com.spring.board.domain.Criteria cri) {
		// TODO Auto-generated method stub
		return null;
	}


	@Override
	public BoardVO read(int bno) {
		// TODO Auto-generated method stub
		return null;
	}


	@Override
	public int total(com.spring.board.domain.Criteria cri) {
		// TODO Auto-generated method stub
		return 0;
	}

}