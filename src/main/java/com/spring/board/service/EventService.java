package com.spring.board.service;

import java.util.List;

import com.spring.board.domain.EventAttachFileDTO;
import com.spring.board.domain.EventVO;
import com.spring.board.domain.Criteria;

public interface EventService {

	public boolean insert(EventVO vo);
	public boolean delete(int bno);
	public boolean update(EventVO vo);
	public List<EventVO> list(Criteria cri);
	public EventVO read(int bno);
	public int total(Criteria cri);
	
	public List<EventAttachFileDTO> getAttachList(int bno);

	
}
