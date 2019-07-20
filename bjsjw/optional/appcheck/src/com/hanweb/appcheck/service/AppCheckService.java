package com.hanweb.appcheck.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.commons.collections.CollectionUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hanweb.appcheck.dao.AppDAO;
import com.hanweb.appcheck.entity.App;
import com.hanweb.appcheck.exception.AppCheckException;
import com.hanweb.common.util.JsonUtil;
import com.hanweb.common.util.NumberUtil;
import com.hanweb.common.util.SpringUtil;
import com.hanweb.common.util.StringUtil;
import com.hanweb.common.util.cache.CacheHandle;
import com.hanweb.common.util.log.LogWriter;
import com.hanweb.common.util.security.SecurityUtil;
import com.hanweb.complat.exception.OperationException;

@Service("com.hanweb.appcheck.service.AppCheckService")
public class AppCheckService {
	
	@Autowired
	AppDAO appDAO;
	
	private static final String cacheName = "_app_cache";
	
	/**
	 * 新增方法
	 * @param app
	 * 		应用实体
	 * @return
	 * @throws OperationException
	 */
	public boolean add(App app) throws OperationException{
		String result = checkout(app);
		if (StringUtil.isNotEmpty(result)){
			throw new OperationException(result);
		}
		int iid = appDAO.insert(app);
		boolean success = false;
		if (iid > 0) {
			success = true;
			addCache(app);
		}
		return success;
	}
	
	/**
	 * 根据iid查找实体
	 * @param iid
	 * 			主键
	 * @return
	 */
	public App findByIid(int iid){
		App app = appDAO.findByIid(NumberUtil.getInt(iid));
		return app;
	}
	
	/**
	 * 修改
	 * @param app
	 * 			应用实体
	 * @return
	 */
	public boolean modify(App app){
		String result = checkout(app);
		if (StringUtil.isNotEmpty(result)){
			throw new OperationException(result);
		}
		boolean bl = appDAO.update(app);
		if(bl) {
			addCache(app);
		}
		return bl;
	}
	
	/**
	 * 根据id串删除
	 * @param ids
	 * 			iid串
	 * @return
	 * @throws OperationException
	 */
	public boolean removeByIds(String ids) throws OperationException{
		List<Integer> idsLsit = StringUtil.toIntegerList(ids, ",");
		if (CollectionUtils.isEmpty(idsLsit)) {
			throw new OperationException("要删除的id串为空");
		}
		List<String> appidList = new ArrayList<String>();
		List<App> appList = appDAO.findByids(ids);
		boolean bl = appDAO.deleteByIds(idsLsit);
		if(bl && CacheHandle.isExist(cacheName)) {
			if (CollectionUtils.isNotEmpty(appList)) {
				for(App app : appList) {
					if(app == null || StringUtil.isEmpty(app.getAppid())) {
						continue;
					}
					appidList.add(app.getAppid());
				}
				CacheHandle app_cache = CacheHandle.getInstance(cacheName);
				if(app_cache != null) {
					boolean success = app_cache.remove(appidList);
					LogWriter.debug("_app_cache remove " + success);
					LogWriter.debug("_app_cache Keys : " + JsonUtil.objectToString(app_cache.getAllKey()));
				}
			}
		}else {
			LogWriter.debug("removeByIds error : appDAO.deleteByIds " + bl 
					+ " or " + cacheName + " exist " + CacheHandle.isExist(cacheName));
		}
		return bl;
	}
	
	/**
	 * 校验app实体
	 * @param app
	 * @return
	 */
	private String checkout(App app){
		String result = "";
		if (app == null){
			result = "app is null!";
		}else if (StringUtil.isEmpty(app.getAppid()) || StringUtil.isEmpty(app.getAppsecret())){
			result = "appid或appsecret为空！";
		}else if (StringUtil.isEmpty(app.getPuK())){
			result = "公钥为空！";
		}else if (StringUtil.isEmpty(app.getPrK())){
			result = "私钥为空！";
		}else{
			//查重
			int num = appDAO.checkByAppidAndName(app);
			if (num > 0 && NumberUtil.getInt(app.getIid()) != num){
				result = "appid或应用名称已存在！";
			}
		}
		return result;
	}
	
	/**
	 * 根据appid、appsecret、ip校验应用
	 * 
	 * @return
	 */
	public App check(String appid, String appsecret, String ip) throws AppCheckException{
		if (StringUtil.isEmpty(appid)){
			throw new AppCheckException("appid为空");
		}
		if (StringUtil.isEmpty(appsecret)){
			throw new AppCheckException("appsecret为空");
		}
		if(StringUtil.isEmpty(ip)){
			throw new AppCheckException("ip为空");
		}
//		App app = appDAO.findByAppid(appid);
		//从缓存里拿
		CacheHandle app_cache = CacheHandle.getInstance(cacheName);
		if(!CacheHandle.isExist(cacheName) || app_cache == null) {
			LogWriter.debug("app_cache is not exist！");
			throw new AppCheckException("app_cache 缓存不存在");
		}
		App app = app_cache.getValue(appid);
		if (app == null || app.getIid() <= 0){
			LogWriter.debug("check app error app is null, appid : " + appid);
			throw new AppCheckException("appid错误，无此appid对应的应用");
		}
		//未开启
		if (!StringUtil.equals("1", app.getIsOpen())){
			throw new AppCheckException("接口正在维护中");
		}
		String appsecret_decode = SecurityUtil.RSADecode(appsecret, app.getPrK());
		if (!StringUtil.equals(app.getAppsecret(), appsecret_decode)){
			throw new AppCheckException("appsecret错误");
		}
		if(StringUtil.isNotEmpty(app.getIpadd())) {//校验ip地址
			List<String> ipList = StringUtil.toStringList(app.getIpadd());
			boolean ipcheck = false;
			for(String ipadd : ipList){
				if (StringUtil.equals(ip, ipadd)){
					ipcheck = true;
					break;
				}
			}
			if (!ipcheck){
				throw new AppCheckException("ip地址未授权");
			}
		}
		if(app.getCusParam() != null && app.getCusParam().size() > 0) {
			Map<String, String> cusParam = app.getCusParam();
			for(String key : cusParam.keySet()) {
				if(StringUtil.isEmpty(key))
					continue;
				String cusValue = SpringUtil.getRequest().getParameter(key);
				if(StringUtil.isEmpty(cusValue)){
					throw new AppCheckException("自定义校验字段： " + key + " 为空");
				}
				if(!StringUtil.equals(cusParam.get(key), SecurityUtil.RSADecode(cusValue, app.getPrK()))) {
					throw new AppCheckException("自定义校验字段： " + key + " 验证错误");
				}
			}
		}
		return app;
	}
	
	/**
	 * 修改接口开关状态
	 * @param iid
	 * @param isOpen
	 * @return
	 */
	public boolean modifyOpen(Integer iid, String isOpen){
		if (iid == 0){
			return false;
		}
		return appDAO.updateOpen(iid, isOpen);
	}
	
	/**
	 * 查出全部应用实体
	 * @return
	 * @throws AppCheckException
	 */
	public List<App> findAll() throws AppCheckException{
		List<App> list = appDAO.findAll();
		if(CollectionUtils.isEmpty(list)) {
//			throw new AppCheckException("数据库中没有数据");
			LogWriter.debug("数据库中没有数据");
		}
		return list;
	}
	
	/**
	 * 把bean放入缓存中
	 * @param app
	 */
	private void addCache(App app) {
		if(!CacheHandle.isExist(cacheName)) {//cache不存在就创建
			CacheHandle.createCache(cacheName, 0, false, true, 0, 0);
		}
		CacheHandle app_cache = CacheHandle.getInstance(cacheName);
		app_cache.addValue(app.getAppid(), app);
		LogWriter.debug("_app_cache Keys : " + JsonUtil.objectToString(app_cache.getAllKey()));
	}
}
