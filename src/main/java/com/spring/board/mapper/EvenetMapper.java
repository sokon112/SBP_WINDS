package com.spring.board.mapper;

import java.util.List;

import com.spring.board.domain.Criteria;
import com.spring.board.domain.EventAttachFileDTO;
import com.spring.board.domain.EventVO;

public interface EvenetMapper {

	public int insert(EventVO vo);
	public int delete(int bno);
	public int update(EventVO vo);
	public List<EventVO> list(Criteria cri);
	public EventVO read(int bno);
	public int totalCnt(Criteria cri);
	
	public List<EventAttachFileDTO> getAttachList(int bno);

}
