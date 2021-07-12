package com.spring.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.spring.board.domain.Criteria;
import com.spring.board.domain.SpecialAttachFileDTO;
import com.spring.board.domain.SpecialVO;
import com.spring.board.mapper.SpecialAttachMapper;
import com.spring.board.mapper.SpecialMapper;


@Service
public class SpecialServieImpl implements SpecialService {

	@Autowired
	private SpecialMapper smapper;
	
	@Autowired
	private SpecialAttachMapper sattachMapper;
	
	
	
	@Transactional
	@Override
	public boolean insert(SpecialVO vo) {
		//새글 등록		
		boolean result=smapper.insert(vo)>0?true:false;
			
		//첨부파일 등록
		if(vo.getAttachList()==null || vo.getAttachList().size()<=0) {
			return result;
		}		
		
		vo.getAttachList().forEach(attach ->{
			attach.setBno(vo.getNo());
			sattachMapper.insert(attach);			
		});
		
		return result;
		
	}

	@Transactional
	@Override
	public boolean delete(int bno) {
		

		//첨부파일 삭제
		sattachMapper.delete(bno);
		
		//게시글 삭제
		return smapper.delete(bno)>0?true:false;
	}

	@Transactional
	@Override
	public boolean update(SpecialVO vo) {
		//기존에 첨부파일 정보 모두 삭제 후 삽입
		
		sattachMapper.delete(vo.getNo());
		
		//게시글 수정
		boolean modifyResult = smapper.update(vo)>0?true:false;
		
		if(vo.getAttachList() == null) {
			return modifyResult;
		}
		
		
		
		//첨부파일 삽입
		if(modifyResult && vo.getAttachList().size()>0) {
			for(SpecialAttachFileDTO dto:vo.getAttachList()) {
				dto.setBno(vo.getNo());
				sattachMapper.insert(dto);
			}
		}
		return modifyResult;
	}

	@Override
	public List<SpecialVO> list(Criteria cri) {		
		return smapper.list(cri);
	}

	@Override
	public SpecialVO read(int bno) {		
		return smapper.read(bno);
	}

	@Override
	public int total(Criteria cri) {		
		return smapper.totalCnt(cri);
	}

	@Override
	public List<SpecialAttachFileDTO> getAttachList(int bno) {		
		return sattachMapper.findByBno(bno);
	}


	
	

}




