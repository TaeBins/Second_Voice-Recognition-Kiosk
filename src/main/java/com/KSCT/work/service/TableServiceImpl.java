package com.KSCT.work.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.KSCT.work.model.mapper.TableMapper;

@Service
public class TableServiceImpl implements TableService{

	@Autowired
	TableMapper tableMapper;
	
	@Override
	public List<Map<String, Object>> SelectAllList() throws Exception {
		return tableMapper.SelectAllList();
	}
}
