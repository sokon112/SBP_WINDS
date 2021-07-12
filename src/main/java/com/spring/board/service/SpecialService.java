package com.spring.board.service;

import java.util.List;


import com.spring.board.domain.Criteria;
import com.spring.board.domain.SpecialAttachFileDTO;
import com.spring.board.domain.SpecialVO;

public interface SpecialService {

	public boolean insert(SpecialVO vo);
	public boolean delete(int bno);
	public boolean update(SpecialVO vo);
	public List<SpecialVO> list(Criteria cri);
	public SpecialVO read(int bno);
	public int total(Criteria cri);
	
	public List<SpecialAttachFileDTO> getAttachList(int bno);

	
}
