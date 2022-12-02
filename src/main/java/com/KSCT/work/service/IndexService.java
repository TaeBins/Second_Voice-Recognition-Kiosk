package com.KSCT.work.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.KSCT.work.mapper.IndexMapper;
import com.KSCT.work.model.Menus;
import com.KSCT.work.model.Orders;
import com.KSCT.work.model.Receipt;
import com.KSCT.work.model.TableInfo;

// @Transactional : 메소드 내부에서 일어나는 DB 로직이 전부성공 or 하나라도 실패시 다시롤백 해줌
// @Service : 서비스 Class에 사용
@Transactional
@Service
public class IndexService {

	@Autowired
	private IndexMapper indexMapper;
	
	
	//화면이 켜지면 테이블 값 가져오고, receipt_num이 없다면 max+1 값으로 셋팅
	public TableInfo getTable(HttpSession session) {
		TableInfo table_info = indexMapper.getTable();
		session.setAttribute("table", table_info);
		return table_info;
	}
	
	
	//모든 메뉴 가져오기(컨트롤에서 보낸 menu_type int 형으로)
	public List<Menus> menulist(Menus menus){
		// 컨트롤에서 받은 menu_type mapper로 보내기
		if(menus.getMenu_gender() == 0) {
		 return indexMapper.manMenulist(menus);

		}else {
			return  indexMapper.womanMenulist(menus);

		}

	}


	
	//손님이 주문한 목록 DB에 저장하기 (오른쪽에 뜨는 메뉴목록)
	public boolean order(Orders orders) {
		
		// 이번 순번에서 주문했었던 메뉴라면 update 시키기
		//이 테이블이 기존에 주문했던 주문목록이 있는지 확인
		
		int checkNum = indexMapper.checkReceiptNum(orders);
		boolean addReceipt = false;
		if(checkNum == 0) {
			System.out.println("현재 하는 주문은 최초의 주문입니다. 영수증을 만듭니다.");
			addReceipt = true;
		} else {
		System.out.println("현재 테이블은 영수증이 있습니다.");
		}
		// 이번 순번에서 처음으로 주문한 메뉴라면 insert 시키기
		indexMapper.order(orders); 
		
		return addReceipt;
		
		
		
	}
	//DB 목록 출력해주기 위해 orders의 현재 순번에 있는 데이터 모두 가지고오기
	public List<Orders> selectOrderList(){
		return indexMapper.selectOrderList();
	}
	
	//손님이 주문한 목록에서 삭제 하면 DB에서도 삭제시켜주기
	public void deleteOrder(Orders orders) {
		indexMapper.deleteOrder(orders);
	}
	
	// 주문하기 누르면 영수증에 주문한 내용 추가
	public void orderComplete(Receipt receipt) {
		indexMapper.orderComplete(receipt);
	}
	
	// 주문한 내용 토대로 menus 테이블에서는 재고, 주문횟수 수정
	public void menusUpdate(Orders orders) {
		indexMapper.menusUpdate(orders);
		indexMapper.menusTruncate();
	}
	
	// 영수증 목록 가져오기
	public List<Receipt> receiptList(TableInfo table){
		
		return indexMapper.receiptList(table);
	}

	// 메뉴 재고 수량 리셋
	public void stockReset() {
		indexMapper.stockReset();
	}
}
