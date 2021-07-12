package com.spring.board.mapper;

import java.util.List;

import com.spring.board.domain.Criteria;
import com.spring.board.domain.SpecialAttachFileDTO;
import com.spring.board.domain.SpecialVO;



public interface SpecialMapper {

	public int insert(SpecialVO vo);
	public int delete(int bno);
	public int update(SpecialVO vo);
	public List<SpecialVO> list(Criteria cri);
	public SpecialVO read(int bno);
	public int totalCnt(Criteria cri);
	
	public List<SpecialAttachFileDTO> getAttachList(int bno);

}
