package com.hanweb.elasticsearch.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MyViewResoverController {
	
	
	@RequestMapping("handleplu")
	public String handleplu(){
		
		return "meinv:/gaoqing";
		
	}

}
