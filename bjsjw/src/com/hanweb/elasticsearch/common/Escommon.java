package com.hanweb.elasticsearch.common;

import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import com.hanweb.common.util.StringUtil;
import com.hanweb.elasticsearch.controller.ESController;
import com.hanweb.elasticsearch.util.FilterUtil;
import com.hanweb.searchcore.bean.MapSearchResult;
import com.hanweb.searchcore.bean.ResultData;
import com.hanweb.searchcore.client.query.DeleteQuery;
import com.hanweb.searchcore.client.query.QueryParams;
import com.hanweb.searchcore.client.query.SearchQuery;
import com.hanweb.searchcore.client.query.UpdateQuery;
import com.hanweb.searchcore.client.search.Searcher;
import com.hanweb.searchcore.client.write.Writer;

public class Escommon {
	
	public static boolean hasDataByProjectNo(String ProjectNo,String table,String CertKey,String bjStatus){
		boolean flag = false ;
		if(StringUtil.isEmpty(ProjectNo)){
			return  flag ;
		}
		//根据办件号查询es中是否有数据
		Searcher searcher = Searcher.getInstance();
		SearchQuery searchAccept= new SearchQuery();
		searchAccept.setSelect("*");
		searchAccept.setFrom(table);
		QueryParams whereAccept = new QueryParams("ProjectNo:${ProjectNo}");
		whereAccept.addString("ProjectNo", ProjectNo);
		searchAccept.setWhere(whereAccept);
		MapSearchResult resultAccept = searcher.search(searchAccept);
		if (MapSearchResult.isValid(resultAccept)) {
			flag = true;
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
				updateQuery.addString("CertKey", CertKey);
				updateQuery.addString("Status", bjStatus);
				success = writer.modify(updateQuery);
			
			}
			
			
		}
		return flag ;
	}
	public static String getType(Map<String, Object> task,String table){
		String type = (String)task.get("Cd_operation") ;
		if("U".equalsIgnoreCase(type)){
			//修改es
			if("pro_accept".equals(table)){
				return upDateAccept(table,task);
			}else if("pro_process".equals(table)){
				return upDateProcess(table,task);
			}else if("pro_result".equals(table)){
				return upDateResult(table,task);
			}else if("pro_materialcatalogue".equals(table)){
				return upDateMaterial(table,task);
			}else if("pro_specialprocedure".equals(table)){
				return upDateSpecial(table,task);
			}
			
		}else if ("D".equalsIgnoreCase(type)){
			//删除
			removeByProjectNo(table,(String) task.get("RowGuid")) ;
			return type ;
		}
		return type;
		
	}	
	public static void removeByProjectNo(String tableName, String RowGuid) {
	
		Writer writer = Writer.getInstance();
		// 根据query语法删除
		QueryParams params = new QueryParams("RowGuid:${RowGuid}");
		params.addString("RowGuid", RowGuid);
		DeleteQuery deleteQuery = new DeleteQuery(tableName, params);
		boolean success = writer.remove(deleteQuery);
		
		//return success;
	}
	//修改受理表
	public static String upDateAccept(String tableName, Map<String, Object> task) {
		String RowGuid = (String)task.get("RowGuid") ;
		MapSearchResult resultAccept = getSearchResult(tableName,RowGuid) ;
		if(MapSearchResult.isValid(resultAccept)){
			List<ResultData> resultDatasAccept = resultAccept.getItems();
			String id;
			Writer writer;
			UpdateQuery updateQuery;
			boolean success = true;
			for (int i = 0; i < resultDatasAccept.size(); i++) {
				id = resultDatasAccept.get(i).getPkValue();
				writer = Writer.getInstance();
				String ApplyerType = (String)task.get("ApplyerType");
				ApplyerType = ApplyerType.replace("1", "自然人")
										.replace("2", "企业法人")
										.replace("3", "事业法人")
										.replace("4", "社团法人")
										.replace("5", "行政机关")
										.replace("6", "其他组织");
				String ApplyType = (String)task.get("ApplyType");
				ApplyType = ApplyType.replace("1", "窗口办理")
									.replace("2", "网上办理")
									.replace("3", "快递申请");
				
				String ProjectType = (String)task.get("ProjectType");
				ProjectType = ProjectType.replace("1", "即办件")
										.replace("2", "承诺件");
				updateQuery = new UpdateQuery(tableName, id);
				updateQuery.addString("ProjectName", (String)task.get("ProjectName"));
				updateQuery.addString("TaskName", (String)task.get("TaskName"));
				updateQuery.addString("TaskCode", (String)task.get("TaskCode"));
				updateQuery.addString("ApplyerName", (String)task.get("ApplyerName"));
				updateQuery.addString("ApplyerType", ApplyerType);
				updateQuery.addString("ApplyerPageType", (String)task.get("ApplyerPageType"));
				if(StringUtil.isNotEmpty((String)task.get("ApplyerPageKey"))){
					updateQuery.addString("CertKey", (String)task.get("ApplyerPageKey"));
				}
				updateQuery.addString("ApplyType", ApplyType);
				updateQuery.addString("ProjectType", ProjectType);
				updateQuery.addString("ContactName", (String)task.get("ContactName"));
				updateQuery.addString("ContactMobile", (String)task.get("ContactMobile"));
				updateQuery.addString("ApplyerPageKey", (String)task.get("ApplyerPageKey"));
				updateQuery.addString("Address", (String)task.get("Address"));
				updateQuery.addString("legal", (String)task.get("legal"));
				updateQuery.addString("OrgCode", (String)task.get("OrgCode"));
				//updateQuery.addString("AreaCode", areaCode);
				updateQuery.addString("OrgName", (String)task.get("OrgName"));
				updateQuery.addDate("AcceptDate", (Date)task.get("AcceptDate"));
				updateQuery.addDate("ApplyDate", (Date)task.get("ApplyDate"));
				updateQuery.addDate("PromiseDate", (Date)task.get("PromiseDate"));
				updateQuery.addString("TargetOrgName", (String)task.get("TargetOrgName"));
				updateQuery.addString("AcceptDocNo", (String)task.get("AcceptDocNo"));
				updateQuery.addString("ZipCode", (String)task.get("ZipCode"));
				success = writer.modify(updateQuery);
			
			}
			return "U";
		}else {
			return "I" ;
		}
		
	}
    public static String upDateProcess(String tableName, Map<String, Object> task) {
		MapSearchResult resultAccept = getSearchResult(tableName,(String)task.get("RowGuid")) ;
		if(MapSearchResult.isValid(resultAccept)){
			List<ResultData> resultDatasAccept = resultAccept.getItems();
			String id;
			Writer writer;
			UpdateQuery updateQuery;
			boolean success = true;
			for (int i = 0; i < resultDatasAccept.size(); i++) {
				id = resultDatasAccept.get(i).getPkValue();
				writer = Writer.getInstance();
				String EventName = String.valueOf(task.get("EventName"));
				EventName = EventName.replace("1", "通过")
						.replace("2", "退回")
						.replace("3", "其他");
				updateQuery = new UpdateQuery(tableName, id);
				updateQuery.addString("EventName", EventName);
				updateQuery.addString("ProcessName", String.valueOf(task.get("ProcessName")));
				updateQuery.addString("HandleUserName", String.valueOf(task.get("HandleUserName")));
				updateQuery.addString("HandleExplain", String.valueOf(task.get("HandleExplain")));
				updateQuery.addDateTime("EventStartTime", (Date)(task.get("EventStartTime")));
				updateQuery.addDateTime("EventEndTime", (Date)(task.get("EventEndTime")));
				updateQuery.addDateTime("CreateDate", (Date)(task.get("CreateDate")));
				updateQuery.addString("Remark", String.valueOf(task.get("Remark")));
				
				updateQuery.addString("RowGuid", String.valueOf(task.get("RowGuid")));
				updateQuery.addDateTime("Cd_time", (Date)(task.get("Cd_time")));
				updateQuery.addDateTime("update_time", (Date)(task.get("update_time")));
				updateQuery.addString("Cd_batch", String.valueOf(task.get("Cd_batch")));
				updateQuery.addString("DataSource", String.valueOf(task.get("DataSource")));
				updateQuery.addString("Cd_source", String.valueOf(task.get("Cd_source")));
				success = writer.modify(updateQuery);

			
			}
			return "U";
		}else {
			return "I" ;
		}
	}
    public static String upDateResult(String tableName, Map<String, Object> task) {
		MapSearchResult resultAccept = getSearchResult(tableName,(String)task.get("RowGuid")) ;
		if(MapSearchResult.isValid(resultAccept)){
			List<ResultData> resultDatasAccept = resultAccept.getItems();
			String id;
			Writer writer;
			UpdateQuery updateQuery;
			boolean success = true;
			for (int i = 0; i < resultDatasAccept.size(); i++) {
				id = resultDatasAccept.get(i).getPkValue();
				writer = Writer.getInstance();
			
				updateQuery = new UpdateQuery(tableName, id);
				updateQuery.addString("HandleUserName", String.valueOf(task.get("HandleUserName")));
				updateQuery.addDateTime("ResultDate", (Date)(task.get("ResultDate")));
				updateQuery.addString("ResultType", String.valueOf(task.get("ResultType")));
				updateQuery.addString("Satisfaction", String.valueOf(task.get("Satisfaction")));
				updateQuery.addString("ResultCetrName", String.valueOf(task.get("ResultCetrName")));
				updateQuery.addString("ResultCetrNo", String.valueOf(task.get("ResultCetrNo")));
				updateQuery.addString("ResultExplain", String.valueOf(task.get("ResultExplain")));
				updateQuery.addString("IsDeliveryResults", String.valueOf(task.get("IsDeliveryResults")));
				updateQuery.addString("Remark", String.valueOf(task.get("Remark")));
				success = writer.modify(updateQuery);

			
			}
			return "U";
		}else {
			return "I" ;
		}

   	}
    public static String upDateMaterial(String tableName, Map<String, Object> task) {
		MapSearchResult resultAccept = getSearchResult(tableName,(String)task.get("RowGuid")) ;
		if(MapSearchResult.isValid(resultAccept)){
			List<ResultData> resultDatasAccept = resultAccept.getItems();
			String id;
			Writer writer;
			UpdateQuery updateQuery;
			boolean success = true;
			for (int i = 0; i < resultDatasAccept.size(); i++) {
				id = resultDatasAccept.get(i).getPkValue();
				writer = Writer.getInstance();
				updateQuery = new UpdateQuery(tableName, id);

				updateQuery.addString("MaterialName", String.valueOf(task.get("MaterialName")));
				updateQuery.addString("GetType", String.valueOf(task.get("GetType")));
				updateQuery.addString("GetNum", String.valueOf(task.get("GetNum")));
				updateQuery.addString("MaterialAttachName", String.valueOf(task.get("MaterialAttachName")));
				updateQuery.addString("Remark", String.valueOf(task.get("Remark")));
				success = writer.modify(updateQuery);

			
			}
			return "U";
		}else {
			return "I" ;
		}
   	}
    public static String upDateSpecial(String tableName, Map<String, Object> task) {
		MapSearchResult resultAccept = getSearchResult(tableName,(String)task.get("RowGuid")) ;
		if(MapSearchResult.isValid(resultAccept)){
			List<ResultData> resultDatasAccept = resultAccept.getItems();
			String id;
			Writer writer;
			UpdateQuery updateQuery;
			boolean success = true;
			for (int i = 0; i < resultDatasAccept.size(); i++) {
				id = resultDatasAccept.get(i).getPkValue();
				writer = Writer.getInstance();
				updateQuery = new UpdateQuery(tableName, id);

				updateQuery.addString("SpecialType", (String)task.get("SpecialType"));
				updateQuery.addString("SpecialName", (String)task.get("SpecialName"));
				updateQuery.addDateTime("SpecialTime", (Date)task.get("SpecialTime"));
				updateQuery.addString("SpecialReason", (String)task.get("SpecialReason"));
				updateQuery.addString("ApplyerUserName", (String)task.get("ApplyerUserName"));
				updateQuery.addDateTime("EndTime", (Date)task.get("EndTime"));
				
				updateQuery.addString("Result", (String)task.get("Result"));
				updateQuery.addString("SpecialExplain", (String)task.get("SpecialExplain"));
				updateQuery.addString("HandleUser", (String)task.get("HandleUser"));
				updateQuery.addString("Remark", (String)task.get("Remark"));
				updateQuery.addString("Cd_operation", (String)task.get("Cd_operation"));

				updateQuery.addDateTime("Cd_time", (Date)task.get("Cd_time"));
				updateQuery.addString("Cd_batch", (String)task.get("Cd_batch"));
			
				updateQuery.addString("DataSource", (String)task.get("DataSource"));
				updateQuery.addString("Cd_source", (String)task.get("Cd_source"));
				updateQuery.addString("RowGuid", (String)task.get("RowGuid"));
				success = writer.modify(updateQuery);

			
			}
			return "U";
		}else {
			return "I" ;
		}
	}
    public static MapSearchResult getSearchResult(String tableName, String RowGuid){
    	Searcher searcher = Searcher.getInstance();
		SearchQuery searchAccept= new SearchQuery();
		searchAccept.setSelect("*");
		searchAccept.setFrom(tableName);
		QueryParams whereAccept = new QueryParams("RowGuid:${RowGuid}");
		whereAccept.addString("RowGuid", RowGuid);
		searchAccept.setWhere(whereAccept);
		MapSearchResult resultAccept = searcher.search(searchAccept);
		return resultAccept ;
    }
    
//    public static MapSearchResult getSearch(String tableName, String Iid){
//    	Searcher searcher = Searcher.getInstance();
//		SearchQuery searchAccept= new SearchQuery();
//		searchAccept.setSelect("*");
//		searchAccept.setFrom(tableName);
//		QueryParams whereAccept = new QueryParams("Iid:${Iid}");
//		whereAccept.addString("Iid", Iid);
//		searchAccept.setWhere(whereAccept);
//		MapSearchResult resultAccept = searcher.search(searchAccept);
//		//System.out.println("是否有结果："+MapSearchResult.isValid(resultAccept));
//		return resultAccept ;
//    }
    
    public static boolean  getStatus(String table ,String ProjectNo){
    	boolean flag  = false ;
    	MapSearchResult resultAccept  = getSearchResult(table,ProjectNo) ;
    	if(MapSearchResult.isValid(resultAccept)){
		    flag  = true ;
        }
    	return flag ;
    
    }
   
}
