package com.KSCT.work.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.KSCT.work.mapper.IndexMapper;
import com.KSCT.work.model.Menu;
import com.KSCT.work.model.test;

// @Transactional : 메소드 내부에서 일어나는 DB 로직이 전부성공 or 하나라도 실패시 다시롤백 해줌
// @Service : 서비스 Class에 사용
@Transactional
@Service
public class IndexService {

	@Autowired
	private IndexMapper indexMapper;

	public List<Menu> getList() {
		List<Menu> list = indexMapper.getList();
		return list;
	}
	
	public void insertList(test menu) {
		indexMapper.insertList(menu);
	}

}
