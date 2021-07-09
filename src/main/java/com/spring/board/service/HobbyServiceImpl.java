package com.spring.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.spring.board.domain.Criteria;
import com.spring.board.domain.HobbyAttachFileDTO;
import com.spring.board.domain.HobbyVO;
import com.spring.board.mapper.HobbyAttachMapper;
import com.spring.board.mapper.HobbyMapper;

@Service
public class HobbyServiceImpl implements HobbyService {

	@Autowired
	private HobbyMapper hmapper;
	
	@Autowired
	private HobbyAttachMapper hobbyattachMapper;
	
	
	
	@Transactional
	@Override
	public boolean insert(HobbyVO vo) {
		//새글 등록		
		boolean result=hmapper.insert(vo)>0?true:false;
			
		//첨부파일 등록
		if(vo.getAttachList()==null || vo.getAttachList().size()<=0) {
			return result;
		}		
		
		vo.getAttachList().forEach(attach ->{
			attach.setBno(vo.getNo());
			hobbyattachMapper.insert(attach);			
		});
		
		return result;
		
	}

	@Transactional
	@Override
	public boolean delete(int bno) {
		

		//첨부파일 삭제
		hobbyattachMapper.delete(bno);
		
		//게시글 삭제
		return hmapper.delete(bno)>0?true:false;
	}

	@Transactional
	@Override
	public boolean update(HobbyVO vo) {
		//기존에 첨부파일 정보 모두 삭제 후 삽입
		
		hobbyattachMapper.delete(vo.getNo());
		
		//게시글 수정
		boolean modifyResult = hmapper.update(vo)>0?true:false;
		
		if(vo.getAttachList() == null) {
			return modifyResult;
		}
		
		
		
		//첨부파일 삽입
		if(modifyResult && vo.getAttachList().size()>0) {
			for(HobbyAttachFileDTO dto:vo.getAttachList()) {
				dto.setBno(vo.getNo());
				hobbyattachMapper.insert(dto);
			}
		}
		return modifyResult;
	}

	@Override
	public List<HobbyVO> list(Criteria cri) {		
		return hmapper.list(cri);
	}

	@Override
	public HobbyVO read(int bno) {		
		return hmapper.read(bno);
	}

	@Override
	public int total(Criteria cri) {		
		return hmapper.totalCnt(cri);
	}

	@Override
	public List<HobbyAttachFileDTO> getAttachList(int bno) {		
		return hobbyattachMapper.findByBno(bno);
	}


	
	

}




