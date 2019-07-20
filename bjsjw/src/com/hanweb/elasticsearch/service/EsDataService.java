package com.hanweb.elasticsearch.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.hanweb.complat.entity.Accept;
import com.hanweb.elasticsearch.dao.ESDao;
import com.hanweb.searchcore.bean.MapSearchResult;
import com.hanweb.searchcore.bean.ResultData;
import com.hanweb.searchcore.client.query.QueryParams;
import com.hanweb.searchcore.client.query.SearchQuery;
import com.hanweb.searchcore.client.search.Searcher;

@Service
public class EsDataService {
	
	@Autowired
	private ESDao esDao;
	/**
	 * 
	 * @param projectNo 事项编号
	 * @param table 表名
	 * @return
	 */
	public String getDataFromEs(String projectNo,String table,Map<String,Object> allNode){
		
		SearchQuery searchQuery = new SearchQuery();
		if(table.equals("pro_materialcatalogue")){
			searchQuery.setSelect("GetType,MaterialName");
		}else {
			searchQuery.setSelect("*");
		}
		
		searchQuery.setFrom(table);
		QueryParams where;
		String params = " ProjectNo:${ProjectNo}";
		where = new QueryParams(params);
		where.addString("ProjectNo", projectNo);
		searchQuery.setWhere(where);
		if(table.equals("pro_accept")){//为详情表
			searchQuery.addOrderBy("Cd_time", true);
			searchQuery.setP(1);
			searchQuery.setOffset(1);
		}
		if(table.equals("pro_process")){
			searchQuery.addOrderBy("EventEndTime");
		}
		
		Searcher searcher = Searcher.getInstance();
		MapSearchResult result = searcher.search(searchQuery);
		System.out.println(JSON.toJSONString(result));
	    if(MapSearchResult.isValid(result)){
	    	List<ResultData> resultDatas = result.getItems();
	    	List list = new ArrayList();
	    	for(ResultData results : resultDatas){
	    		list.add(results.getData()) ;
	    	} 
	    	allNode.put("result", "0");
	    	allNode.put("message","返回成功");
	    	allNode.put("data", list) ;
	    }
		
		return JSON.toJSONString(allNode); 
	}

	/**
	 * 查询前500条办件受理表信息
	 * @param i
	 * @return
	 */
	public List<Map<String, Object>> getAcceptList(int i) {
		String is_sync = "0";
		return esDao.getAcceptList(i,is_sync);
	}

	
	public boolean updateAccept(Long id) {
		return esDao.updateAccept(id);
	}


	/**
	 * 查询前500条办件material表信息
	 * @param i
	 * @return
	 */
	public List<Map<String, Object>> getMaterialList(int i) {
		String is_sync = "0";
		return esDao.getMaterialList(i,is_sync);
	}


	public boolean updateMaterial(Long id) {
		return esDao.updateMaterial(id);
	}


	/**
	 * 查询前500条办件Process表信息
	 * @param i
	 * @return
	 */
	public List<Map<String, Object>> getProcessList(int i) {
		String is_sync = "0";
		return esDao.getProcessList(i,is_sync);
	}


	public boolean updateProcess(Long id) {
		return esDao.updateProcess(id);
	}


	/**
	 * 查询前500条办件Result表信息
	 * @param i
	 * @return
	 */
	public List<Map<String, Object>> getResultList(int i) {
		String is_sync = "0";
		return esDao.getResultList(i,is_sync);
	}


	public boolean updateResult(Long id) {
		return esDao.updateResult(id);
	}


	/**
	 * 查询前500条办件SpecialProcedure表信息
	 * @param i
	 * @return
	 */
	public List<Map<String, Object>> getSpecialProcedureList(int i) {
		String is_sync = "0";
		return esDao.getSpecialProcedureList(i,is_sync);
	}


	public boolean updateSpecialProcedure(Long id) {
		return esDao.updateSpecialProcedure(id);
	}

	/**
	 * 查询办件受理表中数据总量
	 * @param string
	 * @return
	 */
	public long getDataLong(String string) {
		return esDao.getDataLong(string);
	}

	/**
	 * 
	 * @param newTime 
	 * @return
	 */
	public boolean deleteAccept(String is_sync,String newTime) {
		return esDao.deleteAccept(is_sync,newTime);
	}

	public boolean deleteProaccept(String is_sync, String newTime) {
		return esDao.deleteProaccept(is_sync,newTime);
	}

	public boolean deleteResult(String is_sync, String newTime) {
		return esDao.deleteResult(is_sync,newTime);
	}

	public boolean deleteMaterial(String is_sync, String newTime) {
		return esDao.deleteMaterial(is_sync,newTime);
	}

	

	public Integer getAcceptCount(String is_sync) {
		return esDao.getAccetpCount(is_sync);
	}

	public Integer getResultCount(String is_sync) {
		
		return esDao.getResultCount(is_sync);
	}
	
	

}
