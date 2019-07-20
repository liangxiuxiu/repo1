package com.hanweb.elasticsearch;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONObject;
import com.hanweb.common.BaseInfo;
import com.hanweb.common.datasource.DataSourceSwitch;
import com.hanweb.common.util.JsonUtil;
import com.hanweb.common.util.SpringUtil;
import com.hanweb.complat.dao.TaskDAO;
import com.hanweb.complat.dao.UserDAO;
import com.hanweb.elasticsearch.controller.ESController;
import com.hanweb.elasticsearch.util.EncodeUtil;
import com.hanweb.elasticsearch.util.FilterUtil;
import com.hanweb.searchcore.bean.MapSearchResult;
import com.hanweb.searchcore.bean.ResultData;
import com.hanweb.searchcore.client.Config;
import com.hanweb.searchcore.client.query.DeleteQuery;
import com.hanweb.searchcore.client.query.QueryParams;
import com.hanweb.searchcore.client.query.SearchQuery;
import com.hanweb.searchcore.client.query.UpdateQuery;
import com.hanweb.searchcore.client.search.Searcher;
import com.hanweb.searchcore.client.write.Writer;

import dm.jdbc.util.StringUtil;

/**
 * es办件接口控制层
 * 
 * 1.办件总数
 * 2.我的办件
 * @author jiangzt
 *
 */
@Controller
@RequestMapping("banjian/query")
public class ListSearchController {
	
	private static final Integer BJCOUNT = 50;
	
	/**
	 * 初始化
	 */
	@RequestMapping("initEs")
	public void init() {
		String appPath = BaseInfo.getRealPath();
		BaseInfo.initWithPath(appPath, "complat");
		Config.init(appPath);
	}
	
	/**
	 * 根据地区编码删除该省数据
	 * @param res
	 * @param AreaCode
	 * 地区编码
	 * @param tableName
	 * 表名
	 * @return
	 */
	@RequestMapping("removeByOrgCode")
	@ResponseBody
	public boolean removeByOrgCode(HttpServletResponse res,String tableName, String areaCode) {
		res.addHeader("Access-Control-Allow-Origin", "*");
		res.addHeader("Access-Control-Allow-Methods", "GET,POST");
		if (areaCode == null || areaCode.equals("null")) {
			return false;
		}
		if(!FilterUtil.isSqlOK(areaCode)) {
			return false;
		}
		Writer writer = Writer.getInstance();
		// 根据query语法删除
		QueryParams params = new QueryParams("AreaCode:${AreaCode}");
//		params.addNumber("orgCode", orgCode);
		params.addString("AreaCode", areaCode);
		DeleteQuery deleteQuery = new DeleteQuery(tableName, params);
		boolean success = writer.remove(deleteQuery);
		
		return success;
	}
	
	
	@RequestMapping("removeByProjectNo")
	@ResponseBody
	public boolean removeByProjectNo(HttpServletResponse res,String tableName, String ProjectNo) {
		res.addHeader("Access-Control-Allow-Origin", "*");
		res.addHeader("Access-Control-Allow-Methods", "GET,POST");
		if (ProjectNo == null || ProjectNo.equals("null")) {
			return false;
		}
		if(!FilterUtil.isSqlOK(ProjectNo)) {
			return false;
		}
		Writer writer = Writer.getInstance();
		// 根据query语法删除
		QueryParams params = new QueryParams("ProjectNo:${ProjectNo}");
//		params.addNumber("orgCode", orgCode);
		params.addString("ProjectNo", ProjectNo);
		DeleteQuery deleteQuery = new DeleteQuery(tableName, params);
		boolean success = writer.remove(deleteQuery);
		
		return success;
	}
	
	/**
	 * 清空该表中所有数据
	 * @param tableName
	 * es表名
	 */
	@RequestMapping("cutOffByTableName")
	@ResponseBody
	public void removeAllByTableName(HttpServletResponse res, String tableName) {
		res.addHeader("Access-Control-Allow-Origin", "*");
		res.addHeader("Access-Control-Allow-Methods", "GET,POST");
		Writer writer = Writer.getInstance();
		DeleteQuery deleteQuery = new DeleteQuery(tableName, new QueryParams("*:*"));
		boolean success = writer.remove(deleteQuery);
	}
	
	@RequestMapping("tongBuBanJian")
	@ResponseBody
	public String tongBuBanJian(HttpServletResponse res, String areaCode){
		/*if (areaCode == null || areaCode.equals("")) {
			return "不规范的地区编码";
		}*/
		res.addHeader("Access-Control-Allow-Origin", "*");
		res.addHeader("Access-Control-Allow-Methods", "GET,POST");
		//初始化es
//		init();
		        DataSourceSwitch.change("qzkwz");
		      
				//获取同步件的总数
				Integer count = SpringUtil.getBean(UserDAO.class).getBjCount();
				System.out.println("发展改革委开始同步,总共："+count+"条");
				long startFz  = System.currentTimeMillis();
				while(count>0){
					DataSourceSwitch.change("qzkwz");
					//查询要同步的数据
					List<Map<String, Object>> list = SpringUtil.getBean(UserDAO.class).getTask();
					
					for (Map<String, Object> map : list) {
						//切换回默认库
						DataSourceSwitch.changeDefault();
						ESController.add(map,"05");
						//修改同步状态
						String projectNo = (String)map.get("ProjectNo") ;
						if(StringUtil.isNotEmpty(projectNo)){
							DataSourceSwitch.change("qzkwz");
							SpringUtil.getBean(UserDAO.class).updateSyncStatus(projectNo);
						}
					}
					count = count - BJCOUNT ;
				    if(count > -50 && count <0 ){
				    	count = 0;
				    }
				    System.out.println("还剩"+count+"条");
					
				}
				long endFz  = System.currentTimeMillis();
				System.out.println("发展改革委同步完成，耗时:"+(endFz-startFz)+"ms");
				
				
				

				
			/*	//切换至办件前置库
				DataSourceSwitch.change("banjian");
				//查询要同步的数据
				List<Map<String, Object>> list1 = SpringUtil.getBean(UserDAO.class).getTask1();
				System.out.println("贵州开始同步");
				//切换回默认库
				DataSourceSwitch.changeDefault();
				for (Map<String, Object> map : list1) {
					ESController.add(map,"520000");
				}
				System.out.println("贵州同步完成");*/
				//切换至办件前置库
//				DataSourceSwitch.change("banjian");
//				//查询要同步的数据
//				List<Map<String, Object>> list1 = SpringUtil.getBean(UserDAO.class).getTask1();
//				System.out.println("贵州开始同步");
//				//切换回默认库
//				DataSourceSwitch.changeDefault();
//				for (Map<String, Object> map : list1) {
//					ESController.add(map,"520000");
//				}
//				System.out.println("贵州同步完成");

				
				//获取同步件的总数
				/*Integer count1 = SpringUtil.getBean(UserDAO.class).getBjCount1();
				System.out.println("贵州同步,总共："+count1+"条");
				long startGz  = System.currentTimeMillis();
				while(count1>0){
					DataSourceSwitch.change("bdbj");
					//查询要同步的数据
					List<Map<String, Object>> list = SpringUtil.getBean(UserDAO.class).getTask1();
					
					
					for (Map<String, Object> map : list) {
						//切换回默认库
						DataSourceSwitch.changeDefault();
						ESController.add(map,"520000");
						//修改同步状态
						String projectNo = (String)map.get("ProjectNo") ;
						if(StringUtil.isNotEmpty(projectNo)){
							DataSourceSwitch.change("bdbj");
							SpringUtil.getBean(UserDAO.class).updateSyncStatus(projectNo);
						}
						
					}
					count1 = count1 - BJCOUNT ;
				    if(count1 > -50 && count1 <0 ){
				    	count1 = 0;
				    }
				    System.out.println("还剩"+count1+"条");
					
				}
				long endGz  = System.currentTimeMillis();
				System.out.println("贵州同步完成，耗时:"+(endGz-startGz)+"ms");*/
				
				
		return "true";
	}
	
	/**
	 *加测试数据
	 * @param res
	 * @param areaCode
	 * @return
	 */
	@RequestMapping("tongBuBanceshi")
	@ResponseBody
	public String tongBuBanJianceshi(HttpServletResponse res, String areaCode){
		if (areaCode == null || areaCode.equals("")) {
			return "不规范的地区编码";
		}
		res.addHeader("Access-Control-Allow-Origin", "*");
		res.addHeader("Access-Control-Allow-Methods", "GET,POST");
		//初始化es
//		init();
		
		//查询要同步的数据
		List<Map<String, Object>> list = SpringUtil.getBean(UserDAO.class).getceshiTask();
		System.out.println(" ceshi 开始同步");
		
		for (Map<String, Object> map : list) {
			ESController.add1(map,"120000");
		}
		System.out.println("ceshi同步完成");
		return "true";
		
	}
	
	
	/**
	 * 根据主键删除es库的数据
	 * @param tableName
	 * 库名称
	 * @param iid
	 * 主键id即表中的_id
	 */
	@RequestMapping("deleteBanJianById")
	@ResponseBody
	public boolean deleteBanJianById(HttpServletResponse res, String tableName, String iid){
		res.addHeader("Access-Control-Allow-Origin", "*");
		res.addHeader("Access-Control-Allow-Methods", "GET,POST");
		//初始化es
//		init();
		Writer writer = Writer.getInstance();
		//根据主键删除(第一个参数放的是表名)
		DeleteQuery deleteQuery = new DeleteQuery(tableName, iid);
		boolean success = writer.remove(deleteQuery);
		return success;
	}
	
	/**
	 * 获取办件详情(暂时只查一张表)
	 * @param ProjectNo
	 * 办件id
	 * @return
	 */
	@RequestMapping("banJianDetails")
	@ResponseBody
	public String getBanJianDetails(HttpServletResponse res, String ProjectNo) {
		res.addHeader("Access-Control-Allow-Origin", "*");
		res.addHeader("Access-Control-Allow-Methods", "GET,POST");
		JSONObject json = new JSONObject();
		if(StringUtil.isEmpty(ProjectNo)){
			json.put("result", "1");
			json.put("message", "参数有误");
			return json.toJSONString();
		}
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		//初始化
//		init();
		//获取search客户端
		Searcher searcher = Searcher.getInstance();
		//办件过程信息查询
		SearchQuery searchProcess = new SearchQuery();
		searchProcess.setSelect("*");
		searchProcess.setFrom("pro_accept");
		QueryParams whereProcess = new QueryParams("ProjectNo:${ProjectNo}");
		whereProcess.addString("ProjectNo", ProjectNo);
		searchProcess.setWhere(whereProcess);
		searchProcess.addOrderBy("_timestamp_long_", true);
		MapSearchResult resultProcess = searcher.search(searchProcess);
		if (MapSearchResult.isValid(resultProcess)) {
			// 获取结果集
			List<ResultData> resultDatasAccept = resultProcess.getItems();
			List<Map<String, String>> dataAccept = new ArrayList<Map<String,String>>();
				for(ResultData data : resultDatasAccept){
						String timestamp = sdf.format(new Date(Long.parseLong(data.getData().get("_timestamp_long_"))));
						data.getData().put("_timestamp_long_", timestamp);
						String ApplyDate = sdf.format(new Date(Long.parseLong(data.getData().get("ApplyDate"))));
						data.getData().put("ApplyDate", ApplyDate);
						String PromiseDate = sdf.format(new Date(Long.parseLong(data.getData().get("PromiseDate"))));
						data.getData().put("PromiseDate", PromiseDate);
						String AcceptDate = sdf.format(new Date(Long.parseLong(data.getData().get("AcceptDate"))));
						data.getData().put("AcceptDate", AcceptDate);
						dataAccept.add(data.getData());
					}
					json.put("dataAccept", dataAccept);
					return json.toJSONString();
				}
				
				json.put("result", "0");
				return json.toJSONString();
	}
	
	/**
	 * 查询我的办件页数
	 * @param res
	 * @param CertKey
	 * 身份证号散列值
	 * @return
	 */
	@RequestMapping("getBanJianPage")
	@ResponseBody
	public String getBanJianPage(HttpServletResponse res, String CertKey) {
		res.addHeader("Access-Control-Allow-Origin", "*");
		res.addHeader("Access-Control-Allow-Methods", "GET,POST");
		if (CertKey == null || CertKey.equals("null")) {
			return "身份证号不能为空";
		}
		if(!FilterUtil.isSqlOK(CertKey)) {
			return "身份证号不符合sql规范";
		}
		
		//初始化
//				init();
				JSONObject json = new JSONObject();
				SearchQuery searchQuery = new SearchQuery();
				searchQuery.setSelect("*");
				searchQuery.setFrom("pro_accept");
				QueryParams where;
				String params = "CertKey:${CertKey}";
				where = new QueryParams(params);
				where.addString("CertKey", CertKey);
				searchQuery.setWhere(where);
				searchQuery.addOrderBy("_timestamp_long_", true);
				Searcher searcher = Searcher.getInstance();
				MapSearchResult result = searcher.search(searchQuery);
				if (MapSearchResult.isValid(result)) {
					long total = result.getTotal();
					// 获取结果集（分页结果）
					json.put("result", "0");
					json.put("count", total);
				}else{
					json.put("result", "1");
					json.put("message", "暂无数据");
				}
				return json.toJSONString();
	}
	
	/**
	 *  * 查询我的办件
	 * @param res
	 * @param CertKey
	 * 身份证号散列值
	 * @param pagenum
	 * 页码
	 * @param pagesize
	 * 页容量
	 * @param Status
	 * 办件状态
	 * @return
	 */
	@RequestMapping("getMyBanjianList")
	@ResponseBody
	public String getMyBanjianList(HttpServletResponse res, String CertKey, String pagenum, String pagesize,String Status) {
		if (!FilterUtil.isSqlOK(CertKey) || !FilterUtil.isSqlOK(pagenum) || !FilterUtil.isSqlOK(pagesize) || !FilterUtil.isSqlOK(Status)) {
			return null;
		}
		res.addHeader("Access-Control-Allow-Origin", "*");
		res.addHeader("Access-Control-Allow-Methods", "GET,POST");
		if (CertKey == null || CertKey.equals("null")) {
			return "身份证号不能为空";
		}
		if(!FilterUtil.isSqlOK(CertKey)) {
			return "身份证号不符合sql规范";
		}
		//初始化
//		init();
		JSONObject json = new JSONObject();
		SearchQuery searchQuery = new SearchQuery();
		searchQuery.setSelect("*");
		searchQuery.setFrom("pro_accept");
		searchQuery.setP(Integer.parseInt(pagenum));
		searchQuery.setOffset(Integer.parseInt(pagesize));
		QueryParams where;
		String params = "CertKey:${CertKey}";
		where = new QueryParams(params);
		where.addString("CertKey", CertKey);
		searchQuery.setWhere(where);
		searchQuery.addOrderBy("_timestamp_long_", true);
		Searcher searcher = Searcher.getInstance();
		MapSearchResult result = searcher.search(searchQuery);
		if (MapSearchResult.isValid(result)) {
			// 获取结果集（分页结果）
			List<ResultData> resultDatas = result.getItems();
			List<Map<String, String>> datalist = new ArrayList<Map<String,String>>();
			for(ResultData data : resultDatas){
			    String ProjectNo = data.getData().get("ProjectNo");
			    String StatusUncertain = data.getData().get("Status");
                String StratusTrue = this.getStatusTrue(StatusUncertain,ProjectNo,Status);
                data.getData().put("Status", StratusTrue);
				datalist.add(data.getData());
			}
			json.put("result", "0");
			json.put("count", datalist);
		}else{
			json.put("result", "1");
			json.put("message", "暂无数据");
		}
		return json.toJSONString();
	}
	
	
	/**
     * 获取办件正确办理状态(目前只支持无Status作为条件查询的办件)
     * @param StatusUncertain  办理状态（不确定是否正确）
     * @param ProjectNo   办件号
     * @param Status 参数办理状态（查询条件）
     * @return 正确办理状态
     */
    public String getStatusTrue(String StatusUncertain,String ProjectNo,String Status) {
        if(Status == null || "".equals(Status)) {
            if("1".equals(StatusUncertain)) {      
                SearchQuery searchQuery = new SearchQuery();
                searchQuery.setSelect("*");
                searchQuery.setFrom("pro_result");
                searchQuery.setP(1);
                searchQuery.setOffset(10);
                QueryParams where;
                String params = "ProjectNo:${ProjectNo}";
                where = new QueryParams(params);
                where.addString("ProjectNo", ProjectNo);
                searchQuery.setWhere(where);
                Searcher searcher = Searcher.getInstance();
                MapSearchResult result = searcher.search(searchQuery);
                if (MapSearchResult.isValid(result)) {
                    return "3";
                } else {
                    SearchQuery searchQuery1 = new SearchQuery();
                    searchQuery1.setSelect("*");
                    searchQuery1.setFrom("pro_process");
                    searchQuery1.setP(1);
                    searchQuery1.setOffset(10);
                    QueryParams where1;
                    String params1 = "ProjectNo:${ProjectNo}";
                    where1 = new QueryParams(params1);
                    where1.addString("ProjectNo", ProjectNo);
                    searchQuery1.setWhere(where1);
                    Searcher searcher1 = Searcher.getInstance();
                    MapSearchResult result1 = searcher1.search(searchQuery1);
                    if (MapSearchResult.isValid(result1)) {
                        return "2";
                    }              
                }
                return "1";
            }else if("2".equals(StatusUncertain)) {
                SearchQuery searchQuery = new SearchQuery();
                searchQuery.setSelect("*");
                searchQuery.setFrom("pro_result");
                searchQuery.setP(1);
                searchQuery.setOffset(10);
                QueryParams where;
                String params = "ProjectNo:${ProjectNo}";
                where = new QueryParams(params);
                where.addString("ProjectNo", ProjectNo);
                searchQuery.setWhere(where);
                Searcher searcher = Searcher.getInstance();
                MapSearchResult result = searcher.search(searchQuery);
                if (MapSearchResult.isValid(result)) {
                    return "3";
                }
                return "2";
            }
            return StatusUncertain;
        }       
        return StatusUncertain;     
    }
	
	/**
	 * 查询总办件量
	 * @param res
	 * @return
	 */
	@RequestMapping("count")
	@ResponseBody
	public long getBanjianCount(HttpServletResponse res){
		res.addHeader("Access-Control-Allow-Origin", "*");
		res.addHeader("Access-Control-Allow-Methods", "GET,POST");
		//初始化
//		init();
		SearchQuery searchQuery = new SearchQuery();
		searchQuery.setSelect("*");
		searchQuery.setFrom("pro_accept");
		searchQuery.setGroupBy("ProjectNo");
		//searchQuery.addOrderBy("_timestamp_long_", true);
		Searcher searcher = Searcher.getInstance();
		MapSearchResult result = searcher.search(searchQuery);
		System.out.println(JsonUtil.objectToString(result));
		return result.getTotal();
	}
	
	/**
	 * 
	 * @param ProjectNo 办件编号
	 * @throws Exception
	 */
	@RequestMapping("updatecs")
	@ResponseBody
	public String updatecs(String tableName,String ProjectNo,String TaskCode, String CertKey){
	
		JSONObject json = new JSONObject();
	Searcher searcher = Searcher.getInstance();
	SearchQuery searchAccept= new SearchQuery();
	searchAccept.setSelect("*");
	searchAccept.setFrom("pro_accept");
	QueryParams whereAccept = new QueryParams("CertKey:${CertKey}");
	//whereAccept.addString("ProjectNo", ProjectNo);
	whereAccept.addString("CertKey", CertKey);
	searchAccept.setWhere(whereAccept);
	//searchAccept.addOrderBy("_timestamp_long_", true);
	MapSearchResult resultAccept = searcher.search(searchAccept);
	if (MapSearchResult.isValid(resultAccept)) {
		// 获取结果集
		List<ResultData> resultDatasAccept = resultAccept.getItems();
		String id;
		Writer writer;
		UpdateQuery updateQuery;
		boolean success = true;
		for (int i = 0; i < resultDatasAccept.size(); i++) {
			id = resultDatasAccept.get(i).getPkValue();
			writer = Writer.getInstance();
			updateQuery = new UpdateQuery("pro_accept", id);
//			updateQuery.addString("OrgName", "123456");
			updateQuery.addString("CertKey", "5c7ff65cc69859aa92427829b90936bcc311cb985dad70fdb5a93c06ceb30e88");
			success = writer.modify(updateQuery);
		}
		
		json.put("result", success);
	}else{
		json.put("result", false);
	}
	return json.toJSONString();
	}
	
	
	
	/**
	 * 
	 * @param ProjectNo 办件编号
	 * @throws Exception
	 */
	@RequestMapping("updateCerkey")
	@ResponseBody
	public String updatec1(String CertKey){
	
		JSONObject json = new JSONObject();
	Searcher searcher = Searcher.getInstance();
	SearchQuery searchAccept= new SearchQuery();
	searchAccept.setSelect("*");
	searchAccept.setFrom("pro_accept");
	QueryParams whereAccept = new QueryParams("CertKey:${CertKey}");
	whereAccept.addString("CertKey", CertKey);
	searchAccept.setWhere(whereAccept);
	MapSearchResult resultAccept = searcher.search(searchAccept);
	if (MapSearchResult.isValid(resultAccept)) {
		// 获取结果集
		List<ResultData> resultDatasAccept = resultAccept.getItems();
		String id;
		Writer writer;
		UpdateQuery updateQuery;
		boolean success = true;
		for (int i = 0; i < resultDatasAccept.size(); i++) {
			id = resultDatasAccept.get(i).getPkValue();
			writer = Writer.getInstance();
			updateQuery = new UpdateQuery("pro_accept", id);
			updateQuery.addString("CertKey", "5c7ff65cc69859aa92427829b90936bcc311cb985dad70fdb5a93c06ceb30e88");
			success = writer.modify(updateQuery);
		}
		
		json.put("result", success);
	}else{
		json.put("result", false);
	}
	return json.toJSONString();
	}
	
	/**
	 * 修改投诉状态
	 * @param ProjectNo 办件编号
	 * @throws Exception
	 */
	@RequestMapping("updateComplainStatus")
	@ResponseBody
	public String updatec(HttpServletResponse res,String ProjectNo,String complaintStatus ){
		res.addHeader("Access-Control-Allow-Origin", "*");
		res.addHeader("Access-Control-Allow-Methods", "GET,POST");
		
		JSONObject json = new JSONObject();
        if(StringUtil.isEmpty(ProjectNo)){
        	json.put("result", false) ;
        	return json.toJSONString();
		}
        if(StringUtil.isEmpty(complaintStatus)){
        	complaintStatus = "1";
        }
	Searcher searcher = Searcher.getInstance();
	SearchQuery searchAccept= new SearchQuery();
	searchAccept.setSelect("*");
	searchAccept.setFrom("pro_accept");
	QueryParams whereAccept = new QueryParams("ProjectNo:${ProjectNo}");
	whereAccept.addString("ProjectNo", ProjectNo);
	searchAccept.setWhere(whereAccept);
	//searchAccept.addOrderBy("_timestamp_long_", true);
	MapSearchResult resultAccept = searcher.search(searchAccept);
	if (MapSearchResult.isValid(resultAccept)) {
		// 获取结果集
		List<ResultData> resultDatasAccept = resultAccept.getItems();
		String id;
		Writer writer;
		UpdateQuery updateQuery;
		boolean success = true;
		for (int i = 0; i < resultDatasAccept.size(); i++) {
			id = resultDatasAccept.get(i).getPkValue();
			writer = Writer.getInstance();
			updateQuery = new UpdateQuery("pro_accept", id);
//			updateQuery.addString("OrgName", "123456");
			updateQuery.addString("ComplaintStatus", complaintStatus);
			success = writer.modify(updateQuery);
		}
		
		json.put("result", success);
	}else{
		json.put("result", false);
	}
	return json.toJSONString();
	}

}
