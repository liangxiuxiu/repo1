package com.hanweb.elasticsearch.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.hanweb.common.BaseInfo;
import com.hanweb.common.util.JsonUtil;
import com.hanweb.common.util.Properties;
import com.hanweb.common.util.StringUtil;
import com.hanweb.elasticsearch.service.EsDataService;
import com.hanweb.searchcore.bean.MapSearchResult;
import com.hanweb.searchcore.bean.ResultData;
import com.hanweb.searchcore.client.query.QueryParams;
import com.hanweb.searchcore.client.query.SearchQuery;
import com.hanweb.searchcore.client.query.UpdateQuery;
import com.hanweb.searchcore.client.search.Searcher;
import com.hanweb.searchcore.client.write.Writer;


@Controller
@RequestMapping("elasticsearch/banjian")
public class EsDataController {
	
	
	Properties properties = new Properties(BaseInfo.getRealPath()+"/WEB-INF/config/esTables.properties") ;
	
	@RequestMapping("processDetail")
	@ResponseBody
	public String getEsProcess(HttpServletResponse res, String projectNo){
		setKy(res) ;
		Map<String ,Object> allNode = new HashMap<String,Object>();
		if(StringUtil.isEmpty(projectNo)){
			allNode.put("result", "1") ;
			allNode.put("message", "参数有误");
			return JSON.toJSONString(allNode) ;
		}
		String up_process = properties.getString("pro_process") ;
		String processResult = getDataFromEs(projectNo, up_process,allNode) ;
		
		return processResult;
	}
	
	@RequestMapping("resultDetail")
	@ResponseBody
	public String getEsResult(HttpServletResponse res, String projectNo){
		setKy(res) ;
		Map<String ,Object> allNode = new HashMap<String,Object>();
		if(StringUtil.isEmpty(projectNo)){
			allNode.put("result", "1") ;
			allNode.put("message", "参数有误");
			return JSON.toJSONString(allNode) ;
		}
		String up_process = properties.getString("pro_result") ;
		
		String processResult = getDataFromEs(projectNo, up_process,allNode) ;
		
		return processResult;
	}
	
	@RequestMapping("acceptDetail")
	@ResponseBody
	public String getEsAccept(HttpServletResponse res, String projectNo){
		setKy(res) ;
		Map<String ,Object> allNode = new HashMap<String,Object>();
		if(StringUtil.isEmpty(projectNo)){
			allNode.put("result", "1") ;
			allNode.put("message", "参数有误");
			return JSON.toJSONString(allNode) ;
		}
		String up_process = properties.getString("pro_accept") ;
		String processResult = getDataFromEs(projectNo, up_process,allNode) ;
		
		return processResult;
	}
	
	@RequestMapping("materialDetail")
	@ResponseBody
	public String getEsMaterial(HttpServletResponse res, String projectNo){
		setKy(res) ;
		Map<String ,Object> allNode = new HashMap<String,Object>();
		if(StringUtil.isEmpty(projectNo)){
			allNode.put("result", "1") ;
			allNode.put("message", "参数有误");
			return JSON.toJSONString(allNode) ;
		}
		String up_process = properties.getString("pro_material") ;
		String processResult = getDataFromEs(projectNo, up_process,allNode) ;
		
		return processResult;
	}
	
	@RequestMapping("bjCount")
	@ResponseBody
	public String getEsAcceptByCertkey(HttpServletResponse res, String certKey){
		setKy(res) ;
		Map<String ,Object> allNode = new HashMap<String,Object>();
		if(StringUtil.isEmpty(certKey)){
			allNode.put("result", "1") ;
			allNode.put("message", "参数有误");
			return JSON.toJSONString(allNode) ;
		}
		String up_accept = properties.getString("pro_accept") ;
		String processResult = getBjCountFromEsAccept(certKey, up_accept,allNode) ;
		
		return processResult;
	}
	
	private String getBjCountFromEsAccept(String CertKey, String up_accept, Map<String, Object> allNode) {
		
		SearchQuery searchQuery = new SearchQuery() ;
		searchQuery.setSelect("*");
		searchQuery.setFrom(up_accept);
		QueryParams where ;
		String params = " CertKey:${CertKey}" ;
		where = new QueryParams(params)  ;
		where.addString("CertKey", CertKey) ;
		searchQuery.setWhere(where);
		Searcher searcher = Searcher.getInstance();
		MapSearchResult result = searcher.search(searchQuery);
		
	    if(MapSearchResult.isValid(result)){
	    	List<ResultData> resultDatas = result.getItems();
	    	allNode.put("data", resultDatas.size()) ;
	    }else {
	    	allNode.put("data", 0) ;
	    }
		return JSON.toJSONString(allNode);

	}

	private void setKy(HttpServletResponse res){
		res.addHeader("Access-Control-Allow-Origin", "*");// 修改跨域设置
		res.addHeader("Access-Control-Allow-Methods", "GET,POST");// 请求方式
	}
	
	private String getDataFromEs(String projectNo,String table,Map<String,Object> allNode){
	    //projectNo="3204820000000141389160070010000201809060014329" ;
		SearchQuery searchQuery = new SearchQuery();
		if(table.equals("pro_materialcatalogue")){
			searchQuery.setSelect("GetType,MaterialName");
		}else {
			searchQuery.setSelect("*");
		}
		searchQuery.setFrom(table);
		QueryParams where;
		String params = " ProjectNo:${ProjectNo}";
		//String params= "CertKey:${CertKey}";
		where = new QueryParams(params);
		where.addString("ProjectNo", projectNo);
		//where.addString("CertKey", CertKey);
		searchQuery.setWhere(where);
		if(table.equals("pro_accept")){//为详情表
			searchQuery.addOrderBy("Status", true);
			searchQuery.setP(1);
			searchQuery.setOffset(1);
		}
		if(table.equals("pro_process")){
			searchQuery.addOrderBy("EventEndTime");
		}
		
		Searcher searcher = Searcher.getInstance();
		MapSearchResult result = searcher.search(searchQuery);
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


}
