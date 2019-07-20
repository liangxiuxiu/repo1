package com.hanweb.complat.cache;

import javax.xml.namespace.QName;
import javax.xml.rpc.ParameterMode;
import javax.xml.rpc.ServiceException;

import org.apache.axis.client.Call;
import org.apache.axis.client.Service;
import org.apache.axis.encoding.XMLType;

import com.alibaba.fastjson.JSONObject;

public class Test {
	
	public static void main(String[] args) {
		 String endpoint = "http://localhost:8081/wsServeice?xsd=1";
		   Service service = new Service();  
		   System.out.println("=============1==================service "+service); 
		         try{  
		             Call call = (Call)service.createCall();  
		             System.out.println("=============2==================call "+call); 
		             //设置url  
		             call.setTargetEndpointAddress(endpoint);  
		             //注册服务端命名空间   
		             call.setOperationName(new QName("http://impl.hanweb.com/","sayHello"));//WSDL里面描述的接口名称
		             //设置返回值类型，这里返回的list  
		             call.setReturnClass(String.class);  
		             //设置输入参数，data1、data2需要根据wsdl中的名称来填，如果输入参数为map或list 中间参数为XMLType.XSD_HEXBINARY  
		             call.addParameter("name", XMLType.XSD_STRING, ParameterMode.IN);  
		             String reqXml = "<reqXml><SCHOOL_CODE>02900000013</SCHOOL_CODE><STUDENT_CODE>2018081706</STUDENT_CODE><REQUEST_CODE>10001</REQUEST_CODE></reqXml>";
		             Object[] param = new Object[]{"11"};  
		             String returnxml = (String)call.invoke(param);  
		             System.out.println( returnxml);  
		         }catch(Exception e){  
		             e.printStackTrace();  
		         } 
	}		         
}
