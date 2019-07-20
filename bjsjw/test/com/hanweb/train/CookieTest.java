package com.hanweb.train;

import com.hanweb.common.util.mvc.ControllerUtil;

public class CookieTest {
	
	public void setHttp() {
		ControllerUtil.addCookie(response, key, value, seconds, httpOnly);
	}
}
