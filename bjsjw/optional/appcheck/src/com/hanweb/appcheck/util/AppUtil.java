package com.hanweb.appcheck.util;

import com.hanweb.appcheck.entity.App;
import com.hanweb.common.util.SpringUtil;
import com.hanweb.common.util.StringUtil;
import com.hanweb.common.util.log.LogWriter;
import com.hanweb.common.util.security.SecurityUtil;

public class AppUtil {

	/**
	 * 解密字符串
	 * @param str
	 * 			需要解密的字符串
	 * 
	 * @return
	 */
	public static String RSADecode(String str){
		if(StringUtil.isEmpty(str)){
			return "";
		}
		App app = getApp();
		if(app == null || StringUtil.isEmpty(app.getAppid())){
			LogWriter.error("app is null");
			return "";
		}
		return SecurityUtil.RSADecode(str, app.getPrK());
	}
	
	/**
	 * 加密字符串
	 * @param str
	 * 			需要加密的字符串
	 * @return
	 */
	public static String RSAEncode(String str){
		if(StringUtil.isEmpty(str)){
			return "";
		}
		App app = getApp();
		if(app == null || StringUtil.isEmpty(app.getAppid())){
			LogWriter.error("app is null");
			return "";
		}
		return SecurityUtil.RSAEncode(str, app.getPuK());
	}
	
	/**
	 * 获取当前应用实体
	 * @return
	 */
	public static App getApp(){
		App app = (App)SpringUtil.getRequest().getAttribute("_app");
		return app;
	}
}
