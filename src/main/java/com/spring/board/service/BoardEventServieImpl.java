package com.spring.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.spring.board.domain.BoardCriteria;
import com.spring.board.domain.BoardEventAttachFileDTO;
import com.spring.board.domain.BoardEventVO;
import com.spring.board.mapper.BoardCommentMapper;
import com.spring.board.mapper.BoardEventAttachMapper;
import com.spring.board.mapper.BoardEventMapper;


@Service
public class BoardEventServieImpl implements BoardEventService {

	@Autowired
	private BoardEventMapper emapper;
	
	@Autowired
	private BoardEventAttachMapper eattachMapper;
	

	
	@Transactional
	@Override
	public boolean beinsert(BoardEventVO vo) {
		//새글 등록		
		boolean result=emapper.beinsert(vo)>0?true:false;
			
		//첨부파일 등록
		if(vo.getEattachList()==null || vo.getEattachList().size()<=0) {
			return result;
		}		
		
		vo.getEattachList().forEach(attach ->{
			attach.setEno(vo.getEno());
			eattachMapper.beinsert(attach);			
		});
		
		return result;
		
	}

	@Transactional
	@Override
	public boolean bedelete(int eno,String epassword) {
		

		//첨부파일 삭제
		eattachMapper.bedelete(eno);
		
		//게시글 삭제
		return emapper.bedelete(eno,epassword)>0?true:false;
	}

	@Transactional
	@Override
	public boolean beupdate(BoardEventVO vo) {
		//기존에 첨부파일 정보 모두 삭제 후 삽입
		
		eattachMapper.bedelete(vo.getEno());
		
		//게시글 수정
		boolean modifyResult = emapper.beupdate(vo)>0?true:false;
		
		if(vo.getEattachList() == null) {
			return modifyResult;
		}
		
		
		
		//첨부파일 삽입
		if(modifyResult && vo.getEattachList().size()>0) {
			for(BoardEventAttachFileDTO dto:vo.getEattachList()) {
				dto.setEno(vo.getEno());
				eattachMapper.beinsert(dto);
			}
		}
		return modifyResult;
	}

	@Override
	public List<BoardEventVO> belist(BoardCriteria cri) {		
		return emapper.belist(cri);
	}

	@Override
	public BoardEventVO beread(int eno) {		
		return emapper.beread(eno);
	}

	@Override
	public int betotalCnt(BoardCriteria cri) {		
		return emapper.betotalCnt(cri);
	}

	@Override
	public List<BoardEventAttachFileDTO> beAttachList(int eno) {		
		return eattachMapper.befindBySno(eno);
	}
	

	@Override
	public boolean beupdateviews(int eno) {
		return emapper.beupdateviews(eno)>0? true:false;

	}

	@Override
	public boolean becheckpw(int eno, String epassword) {
		return emapper.becheckpw(eno, epassword)!=null?true:false;

	}

	//----------------------------------변경함
	@Transactional
	@Override
	public boolean beaddelete(int eno) {
		//첨부파일 삭제
		eattachMapper.bedelete(eno);
		return emapper.beaddelete(eno)>0?true:false;
	}

	

	

	
	

}




