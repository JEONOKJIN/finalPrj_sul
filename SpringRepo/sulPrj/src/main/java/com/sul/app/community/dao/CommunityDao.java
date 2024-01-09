package com.sul.app.community.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.sul.app.community.vo.CommunityVo;

@Repository
public class CommunityDao {

	//�Խñ� �ۼ�
	public int insert(SqlSessionTemplate sst, CommunityVo vo) {
		return sst.insert("CommunityMapper.insert", vo);
	}

	//���
	public List<CommunityVo> list(SqlSessionTemplate sst) {
		return sst.selectList("CommunityMapper.list");
	}

	//����ȸ
	public CommunityVo detail(SqlSessionTemplate sst, CommunityVo vo) {
		return sst.selectOne("CommunityMapper.detail", vo);
	}

	//����
	public int edit(SqlSessionTemplate sst, CommunityVo vo) {
		return sst.update("CommunityMapper.edit", vo);
	}

	//����
	public int delete(SqlSessionTemplate sst, CommunityVo vo) {
		return sst.update("CommunityMapper.delete", vo);
	}
	
	
	

	
}
