package com.spring.board.mapper;

import java.util.List;

import com.spring.board.domain.Criteria;
import com.spring.board.domain.HobbyAttachFileDTO;
import com.spring.board.domain.HobbyVO;

public interface HobbyMapper {

	public int insert(HobbyVO vo);
	public int delete(int bno);
	public int update(HobbyVO vo);
	public List<HobbyVO> list(Criteria cri);
	public HobbyVO read(int bno);
	public int totalCnt(Criteria cri);
	
	public List<HobbyAttachFileDTO> getAttachList(int bno);

}
