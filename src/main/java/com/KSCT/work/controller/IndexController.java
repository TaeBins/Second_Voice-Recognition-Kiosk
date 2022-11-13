package com.KSCT.work.controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

@RestController
public class IndexController {

	
	@RequestMapping("/")
	public ModelAndView Index(ModelAndView mav) {
		
		mav.setViewName("index");
		return mav;
	}
}
