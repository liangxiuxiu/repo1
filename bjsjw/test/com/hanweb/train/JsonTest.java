package com.hanweb.train;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.httpclient.methods.RequestEntity;
import org.apache.commons.httpclient.methods.StringRequestEntity;
import org.junit.Assert;
import org.junit.Test;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.hanweb.common.util.FileUtil;
import com.hanweb.common.util.HttpSender;
import com.hanweb.common.util.JsonUtil;
import com.hanweb.common.util.log.LogWriter;
import com.hanweb.complat.entity.User;
import com.hanweb.train.controller.FromBean;

public class JsonTest {
	
	@Test
	public void bean() {
		User user = new User();
		user.setLoginName("test");
		user.setIid(11);
		user.setName("测试");
		String jsonStr = JsonUtil.objectToString(user);
		Assert.assertEquals("测试", JsonUtil.getValueFromPath(jsonStr, "$.name"));
	}
	
	@Test
	public void beanInBean() {
		Map<String, User> userMap = new HashMap<String, User>();
		
		User user1 = new User();
		user1.setLoginName("test1");
		user1.setIid(11);
		user1.setName("测试1");
		userMap.put("user1", user1);
		
		User user2 = new User();
		user2.setLoginName("test2");
		user2.setIid(12);
		user2.setName("测试2");
		userMap.put("user2", user2);
		
		String jsonStr = JsonUtil.objectToString(userMap);
		Assert.assertEquals("测试2", JsonUtil.getValueFromPath(jsonStr, "$.user2.name"));
	}
	
	@Test
	public void beans() {
		List<User> users = new ArrayList<User>();
		
		User user1 = new User();
		user1.setLoginName("test1");
		user1.setIid(11);
		user1.setName("测试1");
		users.add(user1);
		
		User user2 = new User();
		user2.setLoginName("test2");
		user2.setIid(12);
		user2.setName("测试2");
		users.add(user2);
		
		String jsonStr = JsonUtil.objectToString(users);
		Assert.assertEquals("测试2", JsonUtil.getValueFromPath(jsonStr, "$[1].name"));
	}
	
	@Test
	public void beansSearch() {
		List<User> users = new ArrayList<User>();
		
		User user1 = new User();
		user1.setLoginName("test1");
		user1.setIid(11);
		user1.setName("测试1");
		user1.setGroupId(1);
		users.add(user1);
		
		User user2 = new User();
		user2.setLoginName("test2");
		user2.setIid(12);
		user2.setName("测试2");
		user2.setGroupId(1);
		users.add(user2);
		
		User user3 = new User();
		user3.setLoginName("test3");
		user3.setIid(13);
		user3.setName("测试3");
		user3.setGroupId(2);
		users.add(user3);
		
		
		String jsonStr = JsonUtil.objectToString(users);
		LogWriter.debug(JsonUtil.getValueFromPath(jsonStr, "$[?(@.name=='测试3' ||  @.name=='测试1')].name"));
	}

	@Test
	public void rceViaSpel() throws Exception {
		System.out.println("creating objectmapper");
		ObjectMapper om = new ObjectMapper();
		om.enableDefaultTyping();
		FromBean i = om.readValue(new File("G:/system/桌面/jackson-rce-via-spel-master/test-exploit.json"), FromBean.class);
		System.out.println("done");
	}
	
	@Test
	public void rceViaSpelControler() throws Exception {
		HttpSender httpSender = HttpSender.getInstancePost("http://127.0.0.1:9091/complat3.2/test/rceViaSpel.do");
		RequestEntity requestEntity = new StringRequestEntity(FileUtil.readFileToString("G:/system/桌面/jackson-rce-via-spel-master/test-exploit.json"), "application/json", "utf-8");
		httpSender.setRequestBody(requestEntity);
		httpSender.execute();
		System.out.println(httpSender.getResult());
		httpSender.close();
	}
	
	@Test
	public void rceViaSpelControler1() throws Exception {
		HttpSender httpSender = HttpSender.getInstancePost("http://127.0.0.1:9091/complat3.2/test/rceViaSpel1.do");
		RequestEntity requestEntity = new StringRequestEntity(FileUtil.readFileToString("G:/system/桌面/jackson-rce-via-spel-master/test-exploit.json"), "application/json", "utf-8");
		httpSender.setRequestBody(requestEntity);
		httpSender.execute();
		System.out.println(httpSender.getResult());
		httpSender.close();
	}
}
