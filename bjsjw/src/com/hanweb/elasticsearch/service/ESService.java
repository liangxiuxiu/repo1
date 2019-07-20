package com.hanweb.elasticsearch.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hanweb.complat.dao.UserDAO;
import com.hanweb.elasticsearch.dao.ESDao;

/**
 * ES业务逻辑层
 * @author jiangzt
 *
 */
@Service
public class ESService {
	
	@Autowired
	private ESDao esDao;
	
	@Autowired
	private UserDAO userDAO;

	/**
	 * 获得办件过程表信息
	 */
	public List<Map<String, Object>> getProProcessValue() {
		List<Map<String, Object>> task = userDAO.getProProcessValue();
		return task;
	}
    /**
     * 获得办件结果信息
     * @return
     */
	public List<Map<String, Object>> getProResultValue() {
		List<Map<String, Object>> result = userDAO.getProResultValue();
		return result;
	}
    /**
     * 获得办件过详情
     * @return
     */
	public List<Map<String, Object>> getProAccessValue() {
		List<Map<String, Object>> access = userDAO.getProAccessValue();
		return access;
	}
    /**
     * 获取办件材料信息
     * @return
     */
	public List<Map<String, Object>> getProMaterialValue() {
		List<Map<String, Object>> material = userDAO.getProMaterialValue();
		return material;
	}

}
