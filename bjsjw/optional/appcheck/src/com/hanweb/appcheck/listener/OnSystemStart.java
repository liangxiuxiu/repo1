package com.hanweb.appcheck.listener;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Component;

import com.hanweb.appcheck.entity.App;
import com.hanweb.appcheck.exception.AppCheckException;
import com.hanweb.appcheck.service.AppCheckService;
import com.hanweb.common.delegate.OnSystemStartDelegate;
import com.hanweb.common.util.JsonUtil;
import com.hanweb.common.util.SpringUtil;
import com.hanweb.common.util.StringUtil;
import com.hanweb.common.util.cache.CacheHandle;
import com.hanweb.common.util.log.LogWriter;

@Component("com.hanweb.appcheck.listener.OnSystemStart")
public class OnSystemStart implements OnSystemStartDelegate {
	
	private static String cacheName = "_app_cache";

	@Override
	public void onDestroyed() {
		// TODO Auto-generated method stub

	}

	@Override
	public void onStart() {
		//启动时将全部应用从数据库中取出，放入缓存
		CacheHandle.createCache(cacheName, 0, false, true, 0, 0);
		AppCheckService appCheckService = SpringUtil.getBean(AppCheckService.class);
		CacheHandle cacheHandle = CacheHandle.getInstance(cacheName);
		List<App> appList = new ArrayList<App>();
		try {
			appList = appCheckService.findAll();
		} catch (AppCheckException e) {
			LogWriter.debug(e.getMessage());
		}
		for(App app : appList) {
			if(app == null || StringUtil.isEmpty(app.getAppid())) {
				continue;
			}
			cacheHandle.addValue(app.getAppid(), app);
		}
		LogWriter.debug("cacheKeys : " + JsonUtil.objectToString(cacheHandle.getAllKey()));
	}

}
