package com.spring.od.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.spring.od.domain.AttachFileDTO;
import com.spring.od.domain.OfficeNoticeVO;
import com.spring.od.mapper.DocAttachMapper;
import com.spring.od.mapper.DocMapper;

@Service
public class DocServiceImpl implements DocService {
	
	@Autowired
	private DocMapper mapper;
	
	@Autowired
	private DocAttachMapper attachMapper;
	
	@Transactional
	@Override
	public boolean owrite(OfficeNoticeVO vo) {
		
		boolean result = mapper.owrite(vo)>0?true:false;
		
		if(vo.getAttach()==null||vo.getAttach().size()<=0) {
			return result;
		}
		vo.getAttach().forEach(attach ->{
			attach.setDocNum(vo.getDocNum());
			attachMapper.oainsert(attach);
		});
		
		return result;
	}

	@Override
	public boolean oapprove(OfficeNoticeVO vo) {
		return mapper.oapprove(vo)>0?true:false;
	}

	@Override
	public OfficeNoticeVO oread(int docNum) {
		return mapper.oread(docNum);
	}

	@Override
	public List<AttachFileDTO> getAttachList(int docNum) {
		return attachMapper.oafindByDocNum(docNum);
	}
	
	@Transactional
	@Override
	public boolean oremove(int docNum) {
		return mapper.oremove(docNum)>0?true:false;
	}
	
	@Transactional
	@Override
	public boolean omodify(OfficeNoticeVO vo) {
		boolean result = mapper.omodify(vo)>0?true:false;
		
		if(vo.getAttach()==null||vo.getAttach().size()<=0) {
			return result;
		}
		
		vo.getAttach().forEach(attach ->{
			attach.setDocNum(vo.getDocNum());
			attachMapper.oainsert(attach);
		});
				
		return result;
	}


}
