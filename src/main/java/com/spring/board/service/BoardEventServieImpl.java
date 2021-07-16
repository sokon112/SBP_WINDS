//package com.spring.board.service;
//
//import java.util.List;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Service;
//import org.springframework.transaction.annotation.Transactional;
//
//import com.spring.board.domain.BoardCriteria;
//import com.spring.board.domain.BoardEventAttachFileDTO;
//import com.spring.board.domain.BoardEventVO;
//import com.spring.board.mapper.BoardEventAttachMapper;
//import com.spring.board.mapper.BoardEventMapper;
//
//
//@Service
//public class BoardEventServieImpl implements BoardHobbyService {
//
//	@Autowired
//	private BoardEventMapper smapper;
//	
//	@Autowired
//	private BoardEventAttachMapper sattachMapper;
//	
//	
//	
//	@Transactional
//	@Override
//	public boolean beinsert(BoardEventVO vo) {
//		//새글 등록		
//		boolean result=smapper.beinsert(vo)>0?true:false;
//			
//		//첨부파일 등록
//		if(vo.getAttachList()==null || vo.getAttachList().size()<=0) {
//			return result;
//		}		
//		
//		vo.getAttachList().forEach(attach ->{
//			attach.setSno(vo.getSno());
//			sattachMapper.bspecialinsert(attach);			
//		});
//		
//		return result;
//		
//	}
//
//	@Transactional
//	@Override
//	public boolean bspecialdelete(int bno) {
//		
//
//		//첨부파일 삭제
//		sattachMapper.bspecialdelete(bno);
//		
//		//게시글 삭제
//		return smapper.bspecialdelete(bno)>0?true:false;
//	}
//
//	@Transactional
//	@Override
//	public boolean bspecialupdate(BoardEventVO vo) {
//		//기존에 첨부파일 정보 모두 삭제 후 삽입
//		
//		sattachMapper.bspecialdelete(vo.getSno());
//		
//		//게시글 수정
//		boolean modifyResult = smapper.bspecialupdate(vo)>0?true:false;
//		
//		if(vo.getAttachList() == null) {
//			return modifyResult;
//		}
//		
//		
//		
//		//첨부파일 삽입
//		if(modifyResult && vo.getAttachList().size()>0) {
//			for(BoardEventAttachFileDTO dto:vo.getAttachList()) {
//				dto.setSno(vo.getSno());
//				sattachMapper.bspecialinsert(dto);
//			}
//		}
//		return modifyResult;
//	}
//
//	@Override
//	public List<BoardEventVO> bspeciallist(BoardCriteria cri) {		
//		return smapper.bspeciallist(cri);
//	}
//
//	@Override
//	public BoardEventVO bspecialread(int bno) {		
//		return smapper.bspecialread(bno);
//	}
//
//	@Override
//	public int bspecialtotalCnt(BoardCriteria cri) {		
//		return smapper.bspecialtotalCnt(cri);
//	}
//
//	@Override
//	public List<BoardEventAttachFileDTO> bspecialAttachList(int bno) {		
//		return sattachMapper.bspecialfindByBno(bno);
//	}
//
//	
//
//	
//
//	
//	
//
//}
//
//
//
//
