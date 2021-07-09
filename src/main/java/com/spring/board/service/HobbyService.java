package com.spring.board.service;

import java.util.List;

import com.spring.board.domain.HobbyVO;
import com.spring.board.domain.Criteria;
import com.spring.board.domain.HobbyAttachFileDTO;

public interface HobbyService {

	public boolean insert(HobbyVO vo);
	public boolean delete(int bno);
	public boolean update(HobbyVO vo);
	public List<HobbyVO> list(Criteria cri);
	public HobbyVO read(int bno);
	public int total(Criteria cri);
	
	public List<HobbyAttachFileDTO> getAttachList(int bno);

	
}
