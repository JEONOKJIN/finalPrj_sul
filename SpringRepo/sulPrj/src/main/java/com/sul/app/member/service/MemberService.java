package com.sul.app.member.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;

import com.sul.app.member.dao.MemberDao;
import com.sul.app.member.vo.MemberVo;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class MemberService {

	private final MemberDao dao;
	private final SqlSessionTemplate sst;
	
	//ȸ������
	public int join(MemberVo vo) throws Exception {
		
		String id = vo.getId();
		if(id.length() < 5) {
			throw new Exception("���̵� 5���� �̻�");
		}
		if("admin".equalsIgnoreCase(id)) {
			throw new Exception("��� �Ұ��� ���̵� �Դϴ�.");
		}
		return dao.join(sst, vo);
	}

	//�α���
	public MemberVo login(MemberVo vo) {
		return dao.login(sst, vo);
	}

	//ȸ�� ���� ����
	public int edit(MemberVo vo) {
		return dao.edit(sst, vo);
	}

	//ȸ�� Ż��
	public int quit(MemberVo vo) {
		return dao.quit(sst, vo);
	}

	//ȸ�� �����ȸ
	public List<MemberVo> list() {
		return dao.list(sst);
	}
	

}
