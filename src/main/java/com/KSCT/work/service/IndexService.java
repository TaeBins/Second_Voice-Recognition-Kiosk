package com.KSCT.work.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.KSCT.work.mapper.IndexMapper;
import com.KSCT.work.model.Menu;

@Service
public class IndexService {

	@Autowired
	private IndexMapper indexMapper;

	public List<Menu> getList() {
		List<Menu> list = indexMapper.getList();
		return list;
	}

}
