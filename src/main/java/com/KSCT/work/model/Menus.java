package com.KSCT.work.model;

import lombok.Data;

@Data
// 메뉴 리스트
public class Menus {
	// 메뉴 순번
	private Double menuSeq;

	// 메뉴 명
	private String menuName;

	// 메뉴 타입
	private String menuType;

	// 메뉴 가격
	private Double menuPrice;

	// 메뉴 재고수량
	private Double menuStockCnt;

	// 메뉴 주문횟수
	private Double menuOrderCnt;

	// 메뉴 사진1
	private String menuImg1;

	// 주문 가능 여부
	private String menuAvailable;

	// 메뉴 불가 사진
	private String menuSoldoutImg;

	// 업체 번호
	private String resNo;

	// 평균 조리시간
	private Double menuTime;

	public Double getMenuSeq() {
		return menuSeq;
	}

	public void setMenuSeq(Double menuSeq) {
		this.menuSeq = menuSeq;
	}

	public String getMenuName() {
		return menuName;
	}

	public void setMenuName(String menuName) {
		this.menuName = menuName;
	}

	public String getMenuType() {
		return menuType;
	}

	public void setMenuType(String menuType) {
		this.menuType = menuType;
	}

	public Double getMenuPrice() {
		return menuPrice;
	}

	public void setMenuPrice(Double menuPrice) {
		this.menuPrice = menuPrice;
	}

	public Double getMenuStockCnt() {
		return menuStockCnt;
	}

	public void setMenuStockCnt(Double menuStockCnt) {
		this.menuStockCnt = menuStockCnt;
	}

	public Double getMenuOrderCnt() {
		return menuOrderCnt;
	}

	public void setMenuOrderCnt(Double menuOrderCnt) {
		this.menuOrderCnt = menuOrderCnt;
	}

	public String getMenuImg1() {
		return menuImg1;
	}

	public void setMenuImg1(String menuImg1) {
		this.menuImg1 = menuImg1;
	}

	public String getMenuAvailable() {
		return menuAvailable;
	}

	public void setMenuAvailable(String menuAvailable) {
		this.menuAvailable = menuAvailable;
	}

	public String getMenuSoldoutImg() {
		return menuSoldoutImg;
	}

	public void setMenuSoldoutImg(String menuSoldoutImg) {
		this.menuSoldoutImg = menuSoldoutImg;
	}

	public String getResNo() {
		return resNo;
	}

	public void setResNo(String resNo) {
		this.resNo = resNo;
	}

	public Double getMenuTime() {
		return menuTime;
	}

	public void setMenuTime(Double menuTime) {
		this.menuTime = menuTime;
	}

	// Menus 모델 복사
	public void CopyData(Menus param) {
		this.menuSeq = param.getMenuSeq();
		this.menuName = param.getMenuName();
		this.menuType = param.getMenuType();
		this.menuPrice = param.getMenuPrice();
		this.menuStockCnt = param.getMenuStockCnt();
		this.menuOrderCnt = param.getMenuOrderCnt();
		this.menuImg1 = param.getMenuImg1();
		this.menuAvailable = param.getMenuAvailable();
		this.menuSoldoutImg = param.getMenuSoldoutImg();
		this.resNo = param.getResNo();
		this.menuTime = param.getMenuTime();
	}
}
