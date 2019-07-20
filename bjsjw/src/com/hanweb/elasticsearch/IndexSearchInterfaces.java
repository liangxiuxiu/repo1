package com.hanweb.elasticsearch;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;







import javax.servlet.http.HttpServletResponse;





//import org.apache.http.Consts;
//import org.apache.http.NameValuePair;
import org.apache.http.client.config.RequestConfig;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.springframework.beans.factory.annotation.Autowired;
//import org.apache.http.message.BasicNameValuePair;
//import org.apache.http.util.EntityUtils;
//import org.junit.BeforeClass;
//import org.junit.Test;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.hanweb.common.BaseInfo;
import com.hanweb.common.util.JsonUtil;
import com.hanweb.complat.dao.TaskDAO;
import com.hanweb.complat.dao.UserDAO;
import com.hanweb.elasticsearch.util.EncodeUtil;
import com.hanweb.searchcore.bean.MapSearchResult;
import com.hanweb.searchcore.bean.ResultData;
import com.hanweb.searchcore.client.Config;
import com.hanweb.searchcore.client.command.CmdResponse;
import com.hanweb.searchcore.client.command.IndexCmdFactory;
import com.hanweb.searchcore.client.command.IndexTableCmd;
import com.hanweb.searchcore.client.query.QueryParams;
import com.hanweb.searchcore.client.query.SearchQuery;
import com.hanweb.searchcore.client.query.UpdateQuery;
import com.hanweb.searchcore.client.search.Searcher;
import com.hanweb.searchcore.client.write.Writer;

import dm.jdbc.util.StringUtil;

/**
 * 办件列表接口
 * @author jiangzt
 *
 */
@Controller
@RequestMapping("elasticsearch/banjian")
public class IndexSearchInterfaces {
	
	@Autowired
	private UserDAO taskDAO;
	
	@RequestMapping("getTest")
	public void getTest() {
		
		taskDAO.getTask();
	}
	
	
	
	
	/**
	 * 初始化
	 */
//	public void init() {
//		String appPath = BaseInfo.getRealPath();
//		BaseInfo.initWithPath(appPath, "complat");
//		Config.init(appPath);
//	}
	
	/**
	 * 获取办件列表
	 * @param CertKey 	身份证散列值
	 * @param OrgCode	组织机构代码
	 * @param AreaCode	区域代码
	 * @param Status	办件状态
	 * @param pagenum	
	 * @param pagesize
	 * @return
	 */
	@RequestMapping("list")
	@ResponseBody
	public String getList(HttpServletResponse res, String CertKey,String OrgCode,String AreaCode,String TaskName,
			String pagenum,String pagesize,String Status) {
	
		res.addHeader("Access-Control-Allow-Origin", "*");// 修改跨域设置
		res.addHeader("Access-Control-Allow-Methods", "GET,POST");// 请求方式
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		JSONObject json = new JSONObject();
		if(checkParams(CertKey,OrgCode,AreaCode)){
			json.put("result", "1");
			json.put("message", "参数有误");
			return json.toJSONString();
		}
		
		//初始化
//		init();
		
		SearchQuery searchQuery = new SearchQuery();
		searchQuery.setSelect("*");
		searchQuery.setFrom("pro_accept");
		searchQuery.setP(Integer.parseInt(pagenum));
		searchQuery.setOffset(Integer.parseInt(pagesize));
		QueryParams where;
		String params = "";
		if(StringUtil.isNotEmpty(CertKey)){
			params = "CertKey:${CertKey}";
			if(StringUtil.isNotEmpty(Status)){
				params = params+" AND Status:${Status}"	;
				where = new QueryParams(params);
				where.addString("CertKey", CertKey);
				if("3".equals(Status)){
					where.addString("Status", Status);
				}else{
					where.addArray("Status","1","2");
				}
				searchQuery.setWhere(where);
			}else{
				where = new QueryParams(params);
				where.addString("CertKey", CertKey);
				searchQuery.setWhere(where);
			}
		}else if(StringUtil.isNotEmpty(OrgCode)){
			params = "AreaCode:${AreaCode}";
			if(StringUtil.isNotEmpty(Status)){
				params = params+" AND Status:${Status}"	;
				where = new QueryParams(params);
				where.addString("AreaCode", OrgCode);
				if("3".equals(Status)){
					where.addString("Status", Status);
				}else{
					where.addArray("Status","1","2");
				}
				searchQuery.setWhere(where);
			}else if(StringUtil.isNotEmpty(TaskName)){
				params = params + " AND TaskName:${TaskName}";
				where = new QueryParams(params);
				where.addString("AreaCode", OrgCode);
				where.addStringLikeLeft("TaskName", TaskName);
				searchQuery.setWhere(where);
			}else {
				where = new QueryParams(params);
				where.addString("AreaCode", OrgCode);
				searchQuery.setWhere(where);
			}
		}else if(StringUtil.isNotEmpty(AreaCode)){
			params = "AreaCode:${AreaCode}";
			if(StringUtil.isNotEmpty(Status)){
				params = params+" AND Status:${Status}"	;
				where = new QueryParams(params);
				where.addString("AreaCode", AreaCode);
				if("3".equals(Status)){
					where.addString("Status", Status);
				}else{
					where.addArray("Status","1","2");
				}
				searchQuery.setWhere(where);
			}else if(StringUtil.isNotEmpty(TaskName)){
				params = params + " AND TaskName:${TaskName}";
				where = new QueryParams(params);
				where.addString("AreaCode", AreaCode);
				where.addStringLikeLeft("TaskName", TaskName);
				searchQuery.setWhere(where);
			}else {
				where = new QueryParams(params);
				where.addString("AreaCode", AreaCode);
				searchQuery.setWhere(where);
			}
		}else if(StringUtil.isNotEmpty(TaskName)){
			params = params+"TaskName:${TaskName}";
			if(StringUtil.isNotEmpty(Status)){
				params = params+" AND Status:${Status}"	;
				where = new QueryParams(params);
				//where.addStringLikeLeft("TaskName", TaskName);
				if("3".equals(Status)){
					where.addString("Status", Status);
				}else{
					where.addArray("Status","1","2");
				}
				searchQuery.setWhere(where);
			}else{
				where = new QueryParams(params);
				where.addStringLikeLeft("TaskName", TaskName);
				searchQuery.setWhere(where);
			}
		}
		//searchQuery.addOrderBy("_timestamp_long_", true);
		searchQuery.addOrderBy("ApplyDate", true);
		searchQuery.addOrderBy("_timestamp_long_", true);
		Searcher searcher = Searcher.getInstance();
		MapSearchResult result = searcher.search(searchQuery);
		if (MapSearchResult.isValid(result)) {
			// 符合条件的总记录数（无视分页），可以看成 count结果
			long total = result.getTotal();
			// 获取结果集（分页结果）
			List<ResultData> resultDatas = result.getItems();
			List datalist = new ArrayList();
			HashMap< String, String>  map= null;
			String url = "http://192.168.88.62:8088/fwmh/interfaces/evaluate/findCommitByProjectId.do";		
			for(ResultData data : resultDatas){
				String ProjectNo = data.getData().get("ProjectNo");
				map = new HashMap<String, String>();
	        	map.put("projectId",ProjectNo);
//	    		String info=doPost(url, map);
//	    		boolean isComment =(boolean) JSONObject.parseObject(info).get("result");
//				if(isComment){
//					data.getData().put("CommentStatus", "2");	
//				}else{
					data.getData().put("CommentStatus", "1");
//				}
				String timestamp = sdf.format(new Date(Long.parseLong(data.getData().get("_timestamp_long_"))));
				data.getData().put("_timestamp_long_", timestamp);
				String ApplyDate = sdf.format(new Date(Long.parseLong(data.getData().get("ApplyDate"))));
				data.getData().put("ApplyDate", ApplyDate);
				/*String PromiseDate = sdf.format(new Date(Long.parseLong(data.getData().get("PromiseDate"))));
				data.getData().put("PromiseDate", PromiseDate);*/
				String AcceptDate = sdf.format(new Date(Long.parseLong(data.getData().get("AcceptDate"))));
				data.getData().put("AcceptDate", AcceptDate);
				String StatusUncertain = data.getData().get("Status");
				String StratusTrue = this.getStatusTrue(StatusUncertain,ProjectNo,Status);
				data.getData().put("Status", StratusTrue);
				datalist.add(data.getData());
			}
			json.put("result", "0");
			json.put("data",datalist);
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
	 * 获取办件总数量
	 * @param CertKey 	身份证散列值
	 * @param OrgCode	组织机构代码
	 * @param AreaCode	区域代码
	 * @param Status	办件状态
	 * @param pagenum
	 * @param pagesize
	 * @return
	 */
	
	@RequestMapping("count")
	@ResponseBody
	public String getCount(HttpServletResponse res, String CertKey,String OrgCode,String AreaCode,String TaskName,
			String Status) {
		res.addHeader("Access-Control-Allow-Origin", "*");
		res.addHeader("Access-Control-Allow-Methods", "GET,POST");
		JSONObject json = new JSONObject();
		if(checkParams(CertKey,OrgCode,AreaCode)){
			json.put("result", "1");
			json.put("message", "参数有误");
			return json.toJSONString();
		}
		
		//初始化
//		init();
		
		SearchQuery searchQuery = new SearchQuery();
		searchQuery.setSelect("*");
		searchQuery.setFrom("pro_accept");
//		searchQuery.setP(Integer.parseInt(pagenum));
//		searchQuery.setOffset(Integer.parseInt(pagesize));
		QueryParams where;
		String params = "";
		if(StringUtil.isNotEmpty(CertKey)){
			params = "CertKey:${CertKey}";
			if(StringUtil.isNotEmpty(Status)){
				params = params+" AND Status:${Status}"	;
				where = new QueryParams(params);
				where.addString("CertKey", CertKey);
				if("3".equals(Status)){
					where.addString("Status", Status);
				}else{
					where.addArray("Status","1","2");
				}
				searchQuery.setWhere(where);
			}else{
				where = new QueryParams(params);
				where.addString("CertKey", CertKey);
				searchQuery.setWhere(where);
			}
		}else if(StringUtil.isNotEmpty(OrgCode)){
			params = " AreaCode:${AreaCode} ";
			if(StringUtil.isNotEmpty(Status)){
				params = params+" AND Status:${Status}"	;
				where = new QueryParams(params);
				where.addString("AreaCode", OrgCode);
				if("3".equals(Status)){
					where.addString("Status", Status);
				}else{
					where.addArray("Status","1","2");
				}
				searchQuery.setWhere(where);
			}else if(StringUtil.isNotEmpty(TaskName)){
				params = params + " AND TaskName:${TaskName} ";
				where = new QueryParams(params);
				where.addString("AreaCode", OrgCode);
				where.addStringLikeLeft("TaskName", TaskName);
				searchQuery.setWhere(where);
			}else {
				where = new QueryParams(params);
				where.addString("AreaCode", OrgCode);
				searchQuery.setWhere(where);
			}
		}else if(StringUtil.isNotEmpty(AreaCode)){
			params = " AreaCode:${AreaCode} ";
			if(StringUtil.isNotEmpty(Status)){
				params = params+" AND Status:${Status}"	;
				where = new QueryParams(params);
				where.addString("AreaCode", AreaCode);
				if("3".equals(Status)){
					where.addString("Status", Status);
				}else{
					where.addArray("Status","1","2");
				}
				searchQuery.setWhere(where);
			}else if(StringUtil.isNotEmpty(TaskName)){
				params = params + " AND TaskName:${TaskName} ";
				where = new QueryParams(params);
				where.addString("AreaCode", AreaCode);
				where.addStringLikeLeft("TaskName", TaskName);
				searchQuery.setWhere(where);
			}else {
				where = new QueryParams(params);
				where.addString("AreaCode", AreaCode);
				searchQuery.setWhere(where);
			}
		}else if(StringUtil.isNotEmpty(TaskName)){
			params = params+"TaskName:${TaskName}";
			if(StringUtil.isNotEmpty(Status)){
				params = params+" AND Status:${Status}"	;
				where = new QueryParams(params);
				where.addStringLikeLeft("TaskName", TaskName);
				if("3".equals(Status)){
					where.addString("Status", Status);
				}else{
					where.addArray("Status","1","2");
				}
				searchQuery.setWhere(where);
			}else{
				where = new QueryParams(params);
				where.addStringLikeLeft("TaskName", TaskName);
				searchQuery.setWhere(where);
			}
		}
		searchQuery.addOrderBy("_timestamp_long_", true);
		Searcher searcher = Searcher.getInstance();
		MapSearchResult result = searcher.search(searchQuery);
		if (MapSearchResult.isValid(result)) {
			// 符合条件的总记录数（无视分页），可以看成 count结果
			long total = result.getTotal();
			// 获取结果集（分页结果）
			List<ResultData> resultDatas = result.getItems();
			List datalist = new ArrayList();
			for(ResultData data : resultDatas){
				datalist.add(data.getData());
			}
			json.put("result", "0");
			json.put("count", total);
		}else{
			json.put("result", "1");
			json.put("message", "暂无数据");
		}
		return json.toJSONString();
	}
	
	
	/**
	 * 获取办件的详细信息
	 * @param ProjectNo 办件编号
	 * @return
	 */
	@RequestMapping("detail")
	@ResponseBody
	public String getDetail(String ProjectNo) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date  date1 = new Date();
		JSONObject json = new JSONObject();
		if(StringUtil.isEmpty(ProjectNo)){
			json.put("result", "1");
			json.put("message", "参数有误");
			return json.toJSONString();
		}

		//获取search客户端
		Searcher searcher = Searcher.getInstance();
		//办件过程信息查询
		SearchQuery searchProcess = new SearchQuery();
		searchProcess.setSelect("*");
		searchProcess.setFrom("pro_process");
		QueryParams whereProcess = new QueryParams("ProjectNo:${ProjectNo}");
		whereProcess.addString("ProjectNo", ProjectNo);
		searchProcess.setWhere(whereProcess);
		searchProcess.addOrderBy("_timestamp_long_", true);
		MapSearchResult resultProcess = searcher.search(searchProcess);
		if (MapSearchResult.isValid(resultProcess)) {
			// 获取结果集
			List<ResultData> resultDatasProcess = resultProcess.getItems();
			List dataProcess = new ArrayList();
			for(ResultData data : resultDatasProcess){
				if(StringUtil.isNotEmpty(data.getData().get("_timestamp_long_"))){
					String timestamp = sdf.format(new Date(Long.parseLong(data.getData().get("_timestamp_long_"))));
					data.getData().put("_timestamp_long_", timestamp);
				}
				if(StringUtil.isNotEmpty(data.getData().get("EventStartTime"))){
					String EventStartTime = sdf.format(new Date(Long.parseLong(data.getData().get("EventStartTime"))));
					data.getData().put("EventStartTime", EventStartTime);

				}
				
								
				if(StringUtil.isNotEmpty(data.getData().get("CreateDate"))){
					String CreateDate = sdf.format(new Date(Long.parseLong(data.getData().get("CreateDate"))));
					data.getData().put("CreateDate", CreateDate);
				}
				if(StringUtil.isNotEmpty(data.getData().get("EventEndTime"))){
					String EventEndTime = sdf.format(new Date(Long.parseLong(data.getData().get("EventEndTime"))));
					data.getData().put("EventEndTime", EventEndTime);

				}
				dataProcess.add(data.getData());
			}
			json.put("dataProcess", dataProcess);
		}
		//办件结果信息查询
		SearchQuery searchResult = new SearchQuery();
		searchResult.setSelect("*");
		searchResult.setFrom("pro_result");
		QueryParams whereResult = new QueryParams("ProjectNo:${ProjectNo}");
		whereResult.addString("ProjectNo", ProjectNo);
		searchResult.setWhere(whereResult);
		searchResult.addOrderBy("_timestamp_long_", true);
		MapSearchResult resultResult = searcher.search(searchResult);
		if (MapSearchResult.isValid(resultResult)) {
			// 获取结果集
			List<ResultData> resultDatasResult = resultResult.getItems();
			List dataResult = new ArrayList();
			for(ResultData data : resultDatasResult){
				if(StringUtil.isNotEmpty(data.getData().get("ResultTimespan"))){
					String ResultTimespan = sdf.format(new Date(Long.parseLong(data.getData().get("ResultTimespan"))));
					data.getData().put("ResultTimespan", ResultTimespan);
				}
				if(StringUtil.isNotEmpty(data.getData().get("ResultDate"))){
					String ResultDate = sdf.format(new Date(Long.parseLong(data.getData().get("ResultDate"))));
					data.getData().put("ResultDate", ResultDate);
				}
				if(StringUtil.isNotEmpty(data.getData().get("_timestamp_long_"))){
					String timestamp = sdf.format(new Date(Long.parseLong(data.getData().get("_timestamp_long_"))));
					data.getData().put("_timestamp_long_", timestamp);
				}
				
				dataResult.add(data.getData());
			}
			json.put("dataResult", dataResult);
		}

		//办件材料信息查询
		SearchQuery searchMaterial = new SearchQuery();
		searchMaterial.setSelect("*");
		searchMaterial.setFrom("pro_materialcatalogue");
		QueryParams whereMaterial = new QueryParams("ProjectNo:${ProjectNo}");
		whereMaterial.addString("ProjectNo", ProjectNo);
		searchMaterial.setWhere(whereMaterial);
		searchMaterial.addOrderBy("_timestamp_long_", true);
		MapSearchResult resultMaterial = searcher.search(searchMaterial);
		if (MapSearchResult.isValid(resultMaterial)) {
			// 获取结果集
			List<ResultData> resultDatasMaterial = resultMaterial.getItems();

			List dataMaterial = new ArrayList();
			for(ResultData data : resultDatasMaterial){
				if(StringUtil.isNotEmpty(data.getData().get("_timestamp_long_"))){
					String timestamp = sdf.format(new Date(Long.parseLong(data.getData().get("_timestamp_long_"))));
					data.getData().put("_timestamp_long_", timestamp);
				}
				
				dataMaterial.add(data.getData());
			}
			json.put("dataMaterial", dataMaterial);
		}
		

		//办件信息查询
		SearchQuery searchAccept= new SearchQuery();
		searchAccept.setSelect("*");
		searchAccept.setFrom("pro_accept");
		QueryParams whereAccept = new QueryParams("ProjectNo:${ProjectNo}");
		whereAccept.addString("ProjectNo", ProjectNo);
		searchAccept.setWhere(whereAccept);
		searchAccept.addOrderBy("_timestamp_long_", true);
		MapSearchResult resultAccept = searcher.search(searchAccept);
		if (MapSearchResult.isValid(resultAccept)) {
			// 获取结果集
			List<ResultData> resultDatasAccept = resultAccept.getItems();
			List dataAccept = new ArrayList();
			for(ResultData data : resultDatasAccept){
				if(StringUtil.isNotEmpty(data.getData().get("_timestamp_long_"))){
					String timestamp = sdf.format(new Date(Long.parseLong(data.getData().get("_timestamp_long_"))));
					data.getData().put("_timestamp_long_", timestamp);
				}
				if(StringUtil.isNotEmpty(data.getData().get("ApplyDate"))){
					String ApplyDate = sdf.format(new Date(Long.parseLong(data.getData().get("ApplyDate"))));
					data.getData().put("ApplyDate", ApplyDate);data.getData().get("ApplyDate");
				}
				if(StringUtil.isNotEmpty(data.getData().get("PromiseDate"))){
					String PromiseDate = sdf.format(new Date(Long.parseLong(data.getData().get("PromiseDate"))));
					data.getData().put("PromiseDate", PromiseDate);
				}
				if(StringUtil.isNotEmpty(data.getData().get("AcceptDate"))){
					String AcceptDate = sdf.format(new Date(Long.parseLong(data.getData().get("AcceptDate"))));
					data.getData().put("AcceptDate", AcceptDate);
				}
				
				dataAccept.add(data.getData());
				
				
			}
			json.put("dataAccept", dataAccept);
		}
		if(!MapSearchResult.isValid(resultProcess) && !MapSearchResult.isValid(resultResult) 
				&& !MapSearchResult.isValid(resultMaterial) && !MapSearchResult.isValid(resultAccept) ){
			json.put("result", "1");
			json.put("message", "暂无数据");
			return json.toJSONString();
		}else {
			json.put("result", "0");
			json.put("message", "查询成功");
		}
		
		return json.toJSONString();
	}
	
	/**
	 * 删除索引
	 * @param	tablename  索引名
	 * @throws Exception
	 */
	@RequestMapping("delete")
	@ResponseBody
	public String removeTable(String tablename){
		JSONObject json = new JSONObject();
		//初始化
//		init();
		IndexTableCmd indexTableCmd = IndexCmdFactory.getIndexTableCmd();
		CmdResponse cmdResponse = indexTableCmd.remove(tablename);
		json.put("result", cmdResponse);
		return json.toJSONString();
//		return null;
	}
	
//	/**
//	 * 修改评价状态
//	 * @param ProjectNo 办件编号
//	 * @throws Exception
//	 */
//	@RequestMapping("updateCommentStatus")
//	@ResponseBody
//	public String updateCommentStatus(String ProjectNo){
//		JSONObject json = new JSONObject();
//		if(StringUtil.isEmpty(ProjectNo)){
//			json.put("result", "1");
//			json.put("message", "参数有误");
//			return json.toJSONString();
//		}
//		//初始化
//		init();
//		//办件信息查询
//		//获取search客户端
//		Searcher searcher = Searcher.getInstance();
//		SearchQuery searchAccept= new SearchQuery();
//		searchAccept.setSelect("*");
//		searchAccept.setFrom("pro_accept");
//		QueryParams whereAccept = new QueryParams("ProjectNo:${ProjectNo}");
//		whereAccept.addString("ProjectNo", ProjectNo);
//		searchAccept.setWhere(whereAccept);
//		searchAccept.addOrderBy("_timestamp_long_", true);
//		MapSearchResult resultAccept = searcher.search(searchAccept);
//		if (MapSearchResult.isValid(resultAccept)) {
//			// 获取结果集
//			List<ResultData> resultDatasAccept = resultAccept.getItems();
//			String id = resultDatasAccept.get(0).getPkValue();
//			Writer writer = Writer.getInstance();
//			UpdateQuery updateQuery = new UpdateQuery("pro_accept", id);
//			updateQuery.addString("CommentStatus", "2");
//			boolean success = writer.modify(updateQuery);
//			json.put("result", success);
//		}else{
//			json.put("result", false);
//		}
//		return json.toJSONString();
//	}
	
	
	@RequestMapping("upCertKey")
	@ResponseBody
	public String upCertKey(String ProjectNo, String certKey){
		JSONObject json = new JSONObject();
		if(StringUtil.isEmpty(ProjectNo)){
			json.put("result", "1");
			json.put("message", "参数有误");
			return json.toJSONString();
		}
		//初始化
//		init();
		//办件信息查询
		//获取search客户端
		Searcher searcher = Searcher.getInstance();
		SearchQuery searchAccept= new SearchQuery();
		searchAccept.setSelect("*");
		searchAccept.setFrom("pro_accept");
		QueryParams whereAccept = new QueryParams("ProjectNo:${ProjectNo}");
		whereAccept.addString("ProjectNo", ProjectNo);
		searchAccept.setWhere(whereAccept);
		searchAccept.addOrderBy("_timestamp_long_", true);
		MapSearchResult resultAccept = searcher.search(searchAccept);
		if (MapSearchResult.isValid(resultAccept)) {
			// 获取结果集
			List<ResultData> resultDatasAccept = resultAccept.getItems();
			System.out.println(resultDatasAccept.size());
			String id = resultDatasAccept.get(0).getPkValue();
			Writer writer = Writer.getInstance();
			UpdateQuery updateQuery = new UpdateQuery("pro_accept", id);
			updateQuery.addString("CertKey", certKey);
			boolean success = writer.modify(updateQuery);
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
	@RequestMapping("updateComplaintStatus")
	@ResponseBody
	public String updateComplaintStatus(String ProjectNo,String ResultCetrNo){
		JSONObject json = new JSONObject();
		if(StringUtil.isEmpty(ProjectNo)){
			json.put("result", "1");
			json.put("message", "参数有误");
			return json.toJSONString();
		}
		//初始化
//		init();
		//办件信息查询
		//获取search客户端
		Searcher searcher = Searcher.getInstance();
		SearchQuery searchAccept= new SearchQuery();
		searchAccept.setSelect("*");
		searchAccept.setFrom("pro_result");
		QueryParams whereAccept = new QueryParams("ProjectNo:${ProjectNo}");
		whereAccept.addString("ProjectNo", ProjectNo);
		searchAccept.setWhere(whereAccept);
		//searchAccept.addOrderBy("_timestamp_long_", true);
		MapSearchResult resultAccept = searcher.search(searchAccept);
		if (MapSearchResult.isValid(resultAccept)) {
			// 获取结果集
			List<ResultData> resultDatasAccept = resultAccept.getItems();
			String id = resultDatasAccept.get(0).getPkValue();
			Writer writer = Writer.getInstance();
			UpdateQuery updateQuery = new UpdateQuery("pro_result", id);
			updateQuery.addString("ResultCetrNo", ResultCetrNo);
			boolean success = writer.modify(updateQuery);
			json.put("result", success);
		}else{
			json.put("result", false);
		}
		return json.toJSONString();
	}
	
	public boolean checkParams(String CertKey,String OrgCode,String AreaCode){
		if(StringUtil.isNotEmpty(CertKey) && StringUtil.isEmpty(OrgCode) && StringUtil.isEmpty(AreaCode)){
			return false;
		}else if(StringUtil.isEmpty(CertKey) && StringUtil.isNotEmpty(OrgCode) && StringUtil.isEmpty(AreaCode)){
			return false;
		}else if(StringUtil.isEmpty(CertKey) && StringUtil.isEmpty(OrgCode) && StringUtil.isNotEmpty(AreaCode)){
			return false;
		}else{
			return true;
		}
	}
	
	
	
	public static RequestConfig config = RequestConfig.custom()
			.setConnectTimeout(10 * 1000).setSocketTimeout(10 * 1000)
			.setConnectionRequestTimeout(1000).build();

}
