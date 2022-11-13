package com.KSCT.work.model.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface TableMapper {

	// 3. Mapper 생성 => service
	public List<Map<String, Object>> SelectAllList() throws Exception;
}
