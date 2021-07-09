package com.spring.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.spring.board.domain.Criteria;
import com.spring.board.domain.EventAttachFileDTO;
import com.spring.board.domain.EventVO;
import com.spring.board.mapper.EvenetMapper;
import com.spring.board.mapper.EventAttachMapper;


@Service
public class EventServieImpl implements EventService {

	@Autowired
	private EvenetMapper emapper;
	
	@Autowired
	private EventAttachMapper eventattachMapper;
	
	
	
	@Transactional
	@Override
	public boolean insert(EventVO vo) {
		//새글 등록		
		boolean result=emapper.insert(vo)>0?true:false;
			
		//첨부파일 등록
		if(vo.getAttachList()==null || vo.getAttachList().size()<=0) {
			return result;
		}		
		
		vo.getAttachList().forEach(attach ->{
			attach.setBno(vo.getNo());
			eventattachMapper.insert(attach);			
		});
		
		return result;
		
	}

	@Transactional
	@Override
	public boolean delete(int bno) {
		

		//첨부파일 삭제
		eventattachMapper.delete(bno);
		
		//게시글 삭제
		return emapper.delete(bno)>0?true:false;
	}

	@Transactional
	@Override
	public boolean update(EventVO vo) {
		//기존에 첨부파일 정보 모두 삭제 후 삽입
		
		eventattachMapper.delete(vo.getNo());
		
		//게시글 수정
		boolean modifyResult = emapper.update(vo)>0?true:false;
		
		if(vo.getAttachList() == null) {
			return modifyResult;
		}
		
		
		
		//첨부파일 삽입
		if(modifyResult && vo.getAttachList().size()>0) {
			for(EventAttachFileDTO dto:vo.getAttachList()) {
				dto.setBno(vo.getNo());
				eventattachMapper.insert(dto);
			}
		}
		return modifyResult;
	}

	@Override
	public List<EventVO> list(Criteria cri) {		
		return emapper.list(cri);
	}

	@Override
	public EventVO read(int bno) {		
		return emapper.read(bno);
	}

	@Override
	public int total(Criteria cri) {		
		return emapper.totalCnt(cri);
	}

	@Override
	public List<EventAttachFileDTO> getAttachList(int bno) {		
		return eventattachMapper.findByBno(bno);
	}


	
	

}




