package com.spring.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.spring.board.domain.BoardCriteria;
import com.spring.board.domain.BoardHobbyAttachFileDTO;
import com.spring.board.domain.BoardHobbyVO;
import com.spring.board.mapper.BoardHobbyAttachMapper;
import com.spring.board.mapper.BoardHobbyMapper;


@Service
public class BoardHobbyServieImpl implements BoardHobbyService {

	@Autowired
	private BoardHobbyMapper hmapper;
	
	@Autowired
	private BoardHobbyAttachMapper hattachMapper;
	
	
	
	@Transactional
	@Override
	public boolean bhinsert(BoardHobbyVO vo) {
		//새글 등록		
		boolean result=hmapper.bhinsert(vo)>0?true:false;
			
		//첨부파일 등록
		if(vo.getHattachList()==null || vo.getHattachList().size()<=0) {
			return result;
		}		
		
		vo.getHattachList().forEach(attach ->{
			attach.setHno(vo.getHno());
			hattachMapper.bhinsert(attach);			
		});
		
		return result;
		
	}

	@Transactional
	@Override
	public boolean bhdelete(int bno) {
		

		//첨부파일 삭제
		hattachMapper.bhdelete(bno);
		
		//게시글 삭제
		return hmapper.bhdelete(bno)>0?true:false;
	}

	@Transactional
	@Override
	public boolean bhupdate(BoardHobbyVO vo) {
		//기존에 첨부파일 정보 모두 삭제 후 삽입
		
		hattachMapper.bhdelete(vo.getHno());
		
		//게시글 수정
		boolean modifyResult = hmapper.bhupdate(vo)>0?true:false;
		
		if(vo.getHattachList() == null) {
			return modifyResult;
		}
		
		
		
		//첨부파일 삽입
		if(modifyResult && vo.getHattachList().size()>0) {
			for(BoardHobbyAttachFileDTO dto:vo.getHattachList()) {
				dto.setHno(vo.getHno());
				hattachMapper.bhinsert(dto);
			}
		}
		return modifyResult;
	}

	@Override
	public List<BoardHobbyVO> bhlist(BoardCriteria cri) {		
		return hmapper.bhlist(cri);
	}

	@Override
	public BoardHobbyVO bhread(int bno) {		
		return hmapper.bhread(bno);
	}

	@Override
	public int bhtotalCnt(BoardCriteria cri) {		
		return hmapper.bhtotalCnt(cri);
	}

	@Override
	public List<BoardHobbyAttachFileDTO> bhAttachList(int bno) {		
		return hattachMapper.bhfindByBno(bno);
	}

	// 조회수 올리기
	@Override
	public boolean boardupdateviews(int bno){
		return hmapper.boardupdateviews(bno)>0? true:false;
	}
		
	//비밀번호 체크
	@Override
	public boolean boardcheckpw(int bno, String password) {
		return hmapper.boardcheckpw(bno, password)!=null?true:false;
	}

	

	

	
	

}




