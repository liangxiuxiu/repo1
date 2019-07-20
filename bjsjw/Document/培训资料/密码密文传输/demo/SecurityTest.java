package com.hanweb.test.logpass;

import java.net.URLEncoder;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.junit.Test;

import com.hanweb.common.util.security.SecurityUtil;

public class SecurityTest {
	
	@Test
	public void test0(){
		// 应用的物理路径，到应用名称即可后面不要"/"
		SecurityUtil.init("应用物理路径");
	}
	
	public void test1(HttpServletResponse response) throws Exception{
		// 获得公钥
		String publicKey = SecurityUtil.getPublicKey();
		// 将公钥保存在cookie中，注意，要encode
		response.addCookie(new Cookie("_pubk", URLEncoder.encode(publicKey, "utf-8")));
	}
	
	public void test2(HttpServletRequest request){
		// 接收页面传来的秘文用户名密码
		String userName = request.getParameter("username");
		String password = request.getParameter("password");
		
		if(userName != null && password != null){
			// 解密
			userName = SecurityUtil.RSAdecode(userName);
			password = SecurityUtil.RSAdecode(password);
		}
	}
}
