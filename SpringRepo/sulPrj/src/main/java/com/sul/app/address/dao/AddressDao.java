package com.sul.app.address.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.sul.app.address.vo.AddressVo;

@Repository
public class AddressDao {

	//�ּ��߰�
	public int plus(SqlSessionTemplate sst, AddressVo vo) {
		return sst.insert("AddressMapper.plus", vo);
	}

	//�ּ� ����
	public int delete(SqlSessionTemplate sst, AddressVo vo) {
		return sst.update("AddressMapper.delete", vo);
	}

}
