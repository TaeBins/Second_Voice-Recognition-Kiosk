package com.KSCT.work.model;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class SearchDto {
	private int page; // 현재 페이지 번호
	private int recordSize; // 한 페이지당 출력될 데이터 개수
	private int pageSize; // 하단에 있는 페이지 번호
	private String keyword; // 검색 키워드
	private String searchType; // 검색 유형

	public SearchDto() {
		this.page = 1;
		this.recordSize = 8;
		this.pageSize = 5;
	}

	public int getOffset() {
		return (page - 1) * recordSize;
	}
}
