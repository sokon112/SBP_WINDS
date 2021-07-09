package com.spring.od.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
	
	@Autowired
	private int test;
	
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
		return mapper.returned(vo)>0?true:false;
	}

	@Override
	public boolean approve(OfficeNoticeVO vo) {
		return mapper.approve(vo)>0?true:false;
	}

	@Override
	public OfficeNoticeVO read(int docNum) {
		return mapper.read(docNum);
	}

	@Override
	public List<AttachFileDTO> getAttachList(int docNum) {
		return attachMapper.findByDocNum(docNum);
	}

	@Override
	public int test() {
		return 0;
	}

}
