package com.KSCT.work.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.KSCT.work.model.Menu;

@Mapper
public interface IndexMapper {

	public List<Menu> getList();
}
