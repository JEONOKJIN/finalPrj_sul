package com.sul.app.notice.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;

import com.sul.app.notice.dao.NoticeDao;
import com.sul.app.notice.vo.NoticeVo;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class NoticeService {
	
	private final NoticeDao dao;
	private final SqlSessionTemplate sqlSessionTemplate;
	
	// 공지사항 목록 조회
	public List<NoticeVo> list() {
		return dao.list(sqlSessionTemplate);
	}
	
	// 공자시항 상세 조회
	public NoticeVo detail(String no) {
		return dao.detail(sqlSessionTemplate, no);
	}
	
	// 조회수 증가
	public int increaseHit(String no) {
		return dao.increaseHit(sqlSessionTemplate, no);
	}
	
}
