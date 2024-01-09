package com.sul.app.community.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;

import com.sul.app.community.dao.CommunityDao;
import com.sul.app.community.vo.CommunityVo;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class CommunityService {

	private final CommunityDao dao;
	private final SqlSessionTemplate sst;
	
	//�ۼ��ϱ�
	public int insert(CommunityVo vo) {
		return dao.insert(sst, vo);
	}

	//���
	public List<CommunityVo> list() {
		return dao.list(sst);
	}

	//����ȸ
	public CommunityVo detail(CommunityVo vo) {
		return dao.detail(sst, vo);
	}

	//����
	public int edit(CommunityVo vo) {
		return dao.edit(sst, vo);
	}

	//����
	public int delete(CommunityVo vo) {
		return dao.delete(sst, vo);
	}

	

}
