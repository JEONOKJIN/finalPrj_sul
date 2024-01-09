package com.sul.app.communitycommt.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;

import com.sul.app.communitycommt.dao.CcommtDao;
import com.sul.app.communitycommt.vo.CcommtVo;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class CcommtService {

	private final CcommtDao dao;
	private final SqlSessionTemplate sst;
	
	//��� �ۼ�
	public int insert(CcommtVo vo) {
		return dao.insert(sst, vo);
	}

	//��� ����
	public int delete(CcommtVo vo) {
		return dao.delete(sst, vo);
	}

}
