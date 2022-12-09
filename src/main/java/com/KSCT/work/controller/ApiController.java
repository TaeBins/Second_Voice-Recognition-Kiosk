package com.KSCT.work.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.KSCT.work.model.Menus;
import com.KSCT.work.model.Orders;
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
   
}