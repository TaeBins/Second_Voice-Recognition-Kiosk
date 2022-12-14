package com.KSCT.work.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.KSCT.work.model.Menus;
import com.KSCT.work.model.Orders;
import com.KSCT.work.model.Receipt;
import com.KSCT.work.model.TableInfo;
import com.KSCT.work.service.IndexService;

@RestController
public class ApiController {
   @Autowired
   IndexService indexService;
   
   @PostMapping("/getJsonOrderList")
   @ResponseBody
   public List<Orders> getJsonOrderList(){
	System.out.println("request 요청이 들어왔습니다.");
	List<Orders> orderList = indexService.selectOrderList();
   if(orderList == null) {
	   orderList.set(0, null);
   }
    return orderList;
   }
   
   @PostMapping("/getMenuList")
   @ResponseBody
   public List<Menus> getMenuList(@RequestBody Menus menus){
      
      
      System.out.println(menus.getMenu_name()+"을 받아왔습니다");
      List<Menus> menuList = indexService.menulist(menus);
    return menuList;
   }
   
   @PostMapping("/getReceiptList")
   public List<Receipt> getReceiptList(HttpSession session){
	   TableInfo table = (TableInfo) session.getAttribute("table");
	      List<Receipt> receiptlist = indexService.receiptList(table);
	      
	      return receiptlist;
	   
   }
   
   // 메뉴 화면에서 오른쪽 주문목록 주문 하기 버튼 누르면 실행
   @PostMapping("/orderComplete")
   // 영수증 모델과 주문목록 모델을 사용해야해서 가져오기
   public String orderComplete(HttpSession session) {
      // 영수증 모델 서비스로 보내기
	   Receipt receipt = new Receipt();
      TableInfo table = (TableInfo) session.getAttribute("table");
      receipt.setReceipt_num(table.getReceipt_num());
      receipt.setTbl_number(table.getTbl_number());
      indexService.orderComplete(receipt);
      // 주문목록 모델 서비스로 보내기
      indexService.menusUpdate();
      

      // 영수증 페이지로 가기전에 최신화 시키기위해 "/" 이걸 붙여서 맵핑 실행하도록
      
      return null;
   }
   
}