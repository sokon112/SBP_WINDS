package com.spring.od.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.od.domain.OfficeNoticeVO;
import com.spring.od.mapper.DocAttachMapper;
import com.spring.od.mapper.DocMapper;

@Service
public class DocServiceImpl implements DocService {
	
	@Autowired
	private DocMapper mapper;
	
	@Autowired
	private DocAttachMapper attachMapper;
	
	@Override
	public boolean write(OfficeNoticeVO vo) {
		
		boolean result = mapper.write(vo)>0?true:false;
		
		if(vo.getAttach()==null||vo.getAttach().size()<=0) {
			return result;
		}
		vo.getAttach().forEach(attach ->{
			attach.setDocNum(vo.getDocNum());
			attachMapper.insert(attach);
		});
		
		return result;
	}

	@Override
	public boolean returned(OfficeNoticeVO vo) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean approve(OfficeNoticeVO vo) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public OfficeNoticeVO read(int docNum) {
		// TODO Auto-generated method stub
		return null;
	}

}
