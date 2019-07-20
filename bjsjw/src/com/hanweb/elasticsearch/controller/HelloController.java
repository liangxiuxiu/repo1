package com.hanweb.elasticsearch.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class HelloController {

	@RequestMapping("hello")
	public String hello() {
		return "success";
	}

	@RequestMapping("success")
	public String success() {
		return "forward:/success.jsp";
	}

	@RequestMapping("redirect")
	public String redirect() {
		System.out.println("redirect");
		return "redirect:/success.jsp";
	}
	
	@RequestMapping("str")
	@ResponseBody
	public String str(){
		return "hello!!";
	}

}
