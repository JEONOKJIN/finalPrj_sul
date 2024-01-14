package com.sul.app.member.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.sul.app.member.vo.MemberVo;

@Repository
public class AdminMemberDao {

	//회원가입
	public int join(SqlSessionTemplate sst, MemberVo vo) {
		return sst.insert("MemberMapper.join", vo);
	}

	//로그인
	public MemberVo login(SqlSessionTemplate sst, MemberVo vo) {
		return sst.selectOne("MemberMapper.quit", vo);
	}

	//회원정보 수정
	public int edit(SqlSessionTemplate sst, MemberVo vo) {
		return sst.update("MemberMapper.edit",vo);
	}

	//회원탈퇴
	public int quit(SqlSessionTemplate sst, MemberVo vo) {
		return sst.update("MemberMapper.quit", vo);
	}

	//회원목록 조회
	public List<MemberVo> list(SqlSessionTemplate sst) {
		return sst.selectList("MemberMapper.list");
	}

	// 회원 목록 상세 조회
	public MemberVo detail(SqlSessionTemplate sst, String no) {
		return sst.selectOne("MemberMapper.detail", no);
	}
	
	// 회원 삭제
	public int delete(SqlSessionTemplate sst, String no) {
		return sst.update("MemberMapper.delete", no);
	}

}