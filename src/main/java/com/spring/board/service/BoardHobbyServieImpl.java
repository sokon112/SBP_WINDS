package com.spring.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.spring.board.domain.BoardCriteria;
import com.spring.board.domain.BoardHobbyAttachFileDTO;
import com.spring.board.domain.BoardHobbyVO;
import com.spring.board.mapper.BoardCommentMapper;
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
	public boolean bhdelete(int hno,String hpassword) {
		

		//첨부파일 삭제
		hattachMapper.bhdelete(hno);
		
		//게시글 삭제
		return hmapper.bhdelete(hno,hpassword)>0?true:false;
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

	//검색리스트
	@Override
	public List<BoardHobbyVO> bhlist(BoardCriteria cri) {		
		return hmapper.bhlist(cri);
	}
	
	//읽기
	@Override
	public BoardHobbyVO bhread(int hno) {		
		return hmapper.bhread(hno);
	}
	
	//검색
	@Override
	public int bhtotalCnt(BoardCriteria cri) {		
		return hmapper.bhtotalCnt(cri);
	}
	
	//파일첨부
	@Override
	public List<BoardHobbyAttachFileDTO> bhAttachList(int hno) {		
		return hattachMapper.bhfindBySno(hno);
	}

	// 조회수 올리기
	@Override
	public boolean bhupdateviews(int hno){
		return hmapper.bhupdateviews(hno)>0? true:false;
	}
		
	//비밀번호 체크
	@Override
	public boolean bhcheckpw(int hno, String hpassword) {
		return hmapper.bhcheckpw(hno, hpassword)!=null?true:false;
	}

	//관리자 삭제
	@Override
	public boolean bhaddelete(int hno) {
		//첨부파일삭제
		hattachMapper.bhdelete(hno);
		return hmapper.bhaddelete(hno)>0?true:false;
	}
	//암호화
	@Override
	public BoardHobbyVO bhsalt(int hno) {
		return hmapper.bhsalt(hno);
	}

	

	

	
	

}




