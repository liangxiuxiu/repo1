package com.hanweb.elasticsearch.util;

import java.util.Date;

import java.util.Map;

import com.hanweb.searchcore.client.query.InsertQuery;
import com.hanweb.searchcore.client.write.Writer;
import com.hanweb.searchcore.entity.IndexColumn;
import com.hanweb.searchcore.entity.IndexColumnType;

public class EncodeUtil {
	
	 public static String unicode(String source){
	        StringBuffer sb = new StringBuffer();
	        char [] source_char = source.toCharArray();
	        String unicode = null;
	        for (int i=0;i<source_char.length;i++) {
	            unicode = Integer.toHexString(source_char[i]);
	            if (unicode.length() <= 2) {
	                unicode = "00" + unicode;
	            }
	            sb.append("\\u" + unicode);
	        }
	        System.out.println(sb);
	        return sb.toString();
	    }
	     
	    public static String decodeUnicode(String unicode) {     
	        StringBuffer sb = new StringBuffer();
	          
	        String[] hex = unicode.split("\\\\u");
	      
	        for (int i = 1; i < hex.length; i++) {
	            int data = Integer.parseInt(hex[i], 16);
	            sb.append((char) data);
	        }
	        return sb.toString();  
	     } 
	    
	    public static String getType(Object o) {
	        return o.getClass().getName().toString();
	    }

	    //
		public static void addProProcess(Map<String, Object> task) {
			Writer writer = Writer.getInstance();
			InsertQuery insertQuery = new InsertQuery("pro_process","");
			insertQuery.addString("ProjectNo", String.valueOf(task.get("ProjectNo")));
			String EventName = String.valueOf(task.get("EventName"));
			EventName = EventName.replace("1", "通过")
					.replace("2", "退回")
					.replace("3", "其他");
			insertQuery.addString("EventName", EventName);
			insertQuery.addString("ProcessName", String.valueOf(task.get("ProcessName")));
			insertQuery.addString("NextProcessName", String.valueOf(task.get("NextProcessName")));
			insertQuery.addString("HandleExplain", String.valueOf(task.get("HandleExplain")));
			insertQuery.addDateTime("EventStartTime", (Date)(task.get("EventStartTime")));
			insertQuery.addDateTime("EventEndTime", (Date)(task.get("EventEndTime")));
			insertQuery.addDateTime("CreateDate", (Date)(task.get("CreateDate")));
			insertQuery.addString("Remark", String.valueOf(task.get("Remark")));
			System.out.println(writer.add(insertQuery));
			//"ProjectNo", "办件编号", IndexColumnType.STRING));
//			//业务动作(1通过, 2退回, 3其他)
//			indexTable.addColumn(new IndexColumn("", "业务动作", IndexColumnType.STRING));
//			indexTable.addColumn(new IndexColumn("", "办理环节名称", IndexColumnType.STRING));
////			indexTable.addColumn(new IndexColumn("", "下一环节名称", IndexColumnType.STRING));
//			indexTable.addColumn(new IndexColumn("", "审批意见", IndexColumnType.STRING));
//			indexTable.addColumn(new IndexColumn("", "环节开始时间", IndexColumnType.DATE));
//			indexTable.addColumn(new IndexColumn("", "环节结束时间", IndexColumnType.DATE));
//			indexTable.addColumn(new IndexColumn("", "数据产生时间", IndexColumnType.DATE));
//			indexTable.addColumn(new IndexColumn("", "备注", 
			
		}

		public static void addProResult(Map<String, Object> resultMap) {
			Writer writer = Writer.getInstance();
			InsertQuery insertQuery = new InsertQuery("pro_result","");
			insertQuery.addString("ProjectNo", String.valueOf(resultMap.get("ProjectNo")));
		
			insertQuery.addString("HandleUserName", String.valueOf(resultMap.get("HandleUserName")));
			insertQuery.addDateTime("ResultDate", (Date)(resultMap.get("ResultDate")));
			insertQuery.addString("ResultCetrNo", String.valueOf(resultMap.get("ResultCetrNo")));
			insertQuery.addString("IsDeliveryResults", String.valueOf(resultMap.get("IsDeliveryResults")));
			insertQuery.addString("Satisfaction", String.valueOf(resultMap.get("Satisfaction")));
			insertQuery.addString("ResultType", String.valueOf(resultMap.get("ResultType")));
			insertQuery.addString("RowGuid", String.valueOf(resultMap.get("RowGuid")));
			insertQuery.addString("ResultsElectronicFile", String.valueOf(resultMap.get("ResultsElectronicFile")));
			insertQuery.addString("ResultExplain", String.valueOf(resultMap.get("ResultExplain")));
			insertQuery.addString("Remark", String.valueOf(resultMap.get("Remark")));
			insertQuery.addString("Cd_operation", String.valueOf(resultMap.get("Cd_operation")));
			insertQuery.addString("Cd_batch", String.valueOf(resultMap.get("Cd_batch")));
			insertQuery.addDateTime("Cd_time", (Date)(resultMap.get("Cd_time")));
			insertQuery.addString("Cd_source", String.valueOf(resultMap.get("Cd_source")));
			insertQuery.addString("Remark", String.valueOf(resultMap.get("Remark")));
			writer.add(insertQuery);
			
		}

		public static void addProAccept(Map<String, Object> resultMap) {
			Writer writer = Writer.getInstance();
			InsertQuery insertQuery = new InsertQuery("pro_accept","");
			insertQuery.addString("ProjectNo", String.valueOf(resultMap.get("ProjectNo")));
			insertQuery.addString("CertKey", String.valueOf(resultMap.get("CertKey")));
			insertQuery.addString("Status", String.valueOf(resultMap.get("Status")));

			insertQuery.addString("TaskCode", String.valueOf(resultMap.get("TaskCode")));
			insertQuery.addDateTime("ApplyDate", (Date)(resultMap.get("ApplyDate")));
			insertQuery.addString("TaskName", String.valueOf(resultMap.get("TaskName")));
			insertQuery.addString("Address", String.valueOf(resultMap.get("Address")));
			insertQuery.addString("ProjectName", String.valueOf(resultMap.get("ProjectName")));
			insertQuery.addString("ApplyerName", String.valueOf(resultMap.get("ApplyerName")));
			insertQuery.addString("ApplyerType", String.valueOf(resultMap.get("ApplyerType")));
			insertQuery.addString("ApplyerPageType", String.valueOf(resultMap.get("ApplyerPageType")));
			insertQuery.addString("ApplyerPageCode", String.valueOf(resultMap.get("ApplyerPageCode")));
			insertQuery.addString("ApplyerPageKey", String.valueOf(resultMap.get("ApplyerPageKey")));
			insertQuery.addString("ApplyType", String.valueOf(resultMap.get("ApplyType")));
			insertQuery.addString("Legal", String.valueOf(resultMap.get("Legal")));
			
			insertQuery.addString("ContactName", String.valueOf(resultMap.get("ContactName")));
			insertQuery.addString("ContactType", String.valueOf(resultMap.get("ContactType")));
			insertQuery.addString("ContactCode", String.valueOf(resultMap.get("ContactCode")));
			
			insertQuery.addString("ContactMobile", String.valueOf(resultMap.get("ContactMobile")));
			insertQuery.addString("ZipCode", String.valueOf(resultMap.get("ZipCode")));
			insertQuery.addString("HandleUserName", String.valueOf(resultMap.get("HandleUserName")));
			insertQuery.addString("AcceptDocNo", String.valueOf(resultMap.get("AcceptDocNo")));
			insertQuery.addString("TargetOrgName", String.valueOf(resultMap.get("TargetOrgName")));
			insertQuery.addString("OrgName", String.valueOf(resultMap.get("OrgName")));
			insertQuery.addString("LocalCatalogCode", String.valueOf(resultMap.get("LocalCatalogCode")));
			insertQuery.addString("LocalTaskCode", String.valueOf(resultMap.get("LocalTaskCode")));
			insertQuery.addString("OrgCode", String.valueOf(resultMap.get("OrgCode")));
			insertQuery.addString("RowGuid", String.valueOf(resultMap.get("RowGuid")));
			insertQuery.addString("CatalogCode", String.valueOf(resultMap.get("CatalogCode")));
			insertQuery.addString("TaskHandleItem", String.valueOf(resultMap.get("TaskHandleItem")));
			
			insertQuery.addInt("TaskVersion", (Integer) resultMap.get("TaskVersion"));
			insertQuery.addString("ProjectType", String.valueOf(resultMap.get("ProjectType")));
			insertQuery.addString("Cd_operation", String.valueOf(resultMap.get("Cd_operation")));
			insertQuery.addString("Cd_batch", String.valueOf(resultMap.get("Cd_batch")));
			insertQuery.addString("DataSource", String.valueOf(resultMap.get("DataSource")));
			insertQuery.addString("Cd_source", String.valueOf(resultMap.get("Cd_source")));
			insertQuery.addDateTime("AcceptDate", (Date)(resultMap.get("AcceptDate")));
			insertQuery.addDateTime("PromiseDate", (Date)(resultMap.get("PromiseDate")));

			insertQuery.addDateTime("Cd_time", (Date)(resultMap.get("Cd_time")));

			writer.add(insertQuery);
			
		}

		public static void addProMaterial(Map<String, Object> resultMap) {
			Writer writer = Writer.getInstance();
			InsertQuery insertQuery = new InsertQuery("pro_materialcatalogue","");
			insertQuery.addString("ProjectNo", String.valueOf(resultMap.get("ProjectNo")));
		
			insertQuery.addString("Remark", String.valueOf(resultMap.get("Remark")));
			insertQuery.addString("GetType", String.valueOf(resultMap.get("GetType")));
			insertQuery.addString("GetNum", String.valueOf(resultMap.get("GetNum")));
			insertQuery.addString("MaterialAttachName", String.valueOf(resultMap.get("MaterialAttachName")));
			insertQuery.addString("MaterialName", String.valueOf(resultMap.get("MaterialName")));
			insertQuery.addString("RowGuid", String.valueOf(resultMap.get("RowGuid")));
			insertQuery.addString("MaterialAttachGuid", String.valueOf(resultMap.get("MaterialAttachGuid")));
			insertQuery.addString("Cd_operation", String.valueOf(resultMap.get("Cd_operation")));
			insertQuery.addString("Cd_batch", String.valueOf(resultMap.get("Cd_batch")));
			insertQuery.addString("DataSource", String.valueOf(resultMap.get("DataSource")));
			insertQuery.addString("Cd_source", String.valueOf(resultMap.get("Cd_source")));
			insertQuery.addDateTime("Cd_time", (Date)(resultMap.get("Cd_time")));

			writer.add(insertQuery);
			
		}

}
