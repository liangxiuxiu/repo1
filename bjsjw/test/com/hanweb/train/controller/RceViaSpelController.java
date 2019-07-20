package com.hanweb.train.controller;

import java.io.File;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.hanweb.common.util.FileUtil;
import com.hanweb.common.util.JsonUtil;

/**
 * 
 * @author 李杰
 * 
 */
@Controller
@RequestMapping("test")
public class RceViaSpelController {
	/**
	 * 移除用户
	 * 
	 * @param ids
	 *            用户ID串 如:1,2,3,4
	 * @return
	 */
	@RequestMapping("rceViaSpel")
	@ResponseBody
	public FromBean rceViaSpel(@RequestBody FromBean fromBean) {
		System.out.println(fromBean.obj);
		System.out.println(JsonUtil.StringToObject(FileUtil.readFileToString("G:/system/桌面/jackson-rce-via-spel-master/test-exploit.json"), FromBean.class).obj);
		return fromBean;
	}
	
	@RequestMapping("rceViaSpel1")
	@ResponseBody
	public FromBean rceViaSpel1(@RequestBody FromBean fromBean) throws Exception{
		System.out.println("creating objectmapper");
		ObjectMapper om = new ObjectMapper();
		om.enableDefaultTyping();
		
		FromBean i = om.readValue(new File("G:/system/桌面/jackson-rce-via-spel-master/test-exploit.json"), FromBean.class);
		System.out.println("done");
		return fromBean;
	}
}
