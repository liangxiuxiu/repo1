package com.hanweb.elasticsearch.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hanweb.common.datasource.DataSourceSwitch;
import com.hanweb.elasticsearch.service.ESService;
import com.hanweb.elasticsearch.util.EncodeUtil;

/**
 * 同步es数据控制层
 * @author jiangzt
 *
 */
@Controller
@RequestMapping("synchronization")
public class SynchronizationESController {
	
	@Autowired
	private ESService esService;
	
	/**
	 * 同步办件受理信息表
	 */
	@RequestMapping("tBProAccept")
	public void tBProAccept() {
		//切换至办件前置库
		DataSourceSwitch.change("qzkwz");
		List<Map<String, Object>> accessList = esService.getProAccessValue();		
        
		//切换回默认库
		DataSourceSwitch.changeDefault();
		//添加到es库中
				if(accessList!=null && accessList.size()>0){
					for(Map<String,Object> resultMap: accessList){
						EncodeUtil.addProAccept(resultMap);
					}
						
				}
		
		
	}
	
	/**
	 * 同步办件过程信息
	 */
	@RequestMapping("tBProProcess")
	public void tBProProcess() {
		//切换至办件前置库
		DataSourceSwitch.change("qzkwz");
		//查出办件过程信息
		List<Map<String, Object>> task = esService.getProProcessValue();
		
		//切换回默认库
		DataSourceSwitch.changeDefault();
		//添加es库中
		for (Map<String, Object> map : task) {
			EncodeUtil.addProProcess(map);
		}
	}
	
	/**
	 * 同步办件结果信息
	 */
	@RequestMapping("tBProResult")
	public void tBProResult() {
		//切换至办件前置库
		DataSourceSwitch.change("qzkwz");
		
		//查询办件结果信息
		List<Map<String, Object>> resultList = esService.getProResultValue();		
		//切换回默认库
		DataSourceSwitch.changeDefault();
		
		//添加到es库中
		if(resultList!=null && resultList.size()>0){
			for(Map<String,Object> resultMap: resultList){
				EncodeUtil.addProResult(resultMap);
			}
				
		}
	
	}
	
	/**
	 * 同步办件材料信息
	 */
	@RequestMapping("tBProMaterial")
	public void tBProMaterial() {
		//切换至办件前置库
		//DataSourceSwitch.change("banjian");
		List<Map<String, Object>> material = esService.getProMaterialValue();
	
		//切换回默认库
		//DataSourceSwitch.changeDefault();
		
		//添加到es库中
				if(material!=null && material.size()>0){
					for(Map<String,Object> resultMap: material){
						EncodeUtil.addProMaterial(resultMap);
					}
						
				}
	}
	
	
	/**
	 * 同步索引库
	 */
	@RequestMapping("syncIndex")
	public void SyncIndexKu(){
		ESController escontroller = new ESController() ;
		try {
			escontroller.createTableAccept();
			escontroller.createTableProcess();
			escontroller.createTableProcessMaterialcatalogue();
			escontroller.createTableProcessResult();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
}
