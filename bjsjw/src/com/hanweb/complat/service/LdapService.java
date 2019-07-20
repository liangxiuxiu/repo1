package com.hanweb.complat.service;

import java.io.FileOutputStream;
import java.net.URL;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.xml.rpc.ParameterMode;

import org.apache.axis.client.Call;
import org.apache.axis.client.Service;
import org.apache.axis.encoding.XMLType;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.dom4j.Document;
import org.dom4j.DocumentException;
import org.dom4j.Element;
import org.dom4j.io.SAXReader;
import org.dom4j.io.XMLWriter;
import org.springframework.beans.factory.annotation.Autowired;

import com.hanweb.common.BaseInfo;
import com.hanweb.common.util.JsonUtil;
import com.hanweb.common.util.Md5Util;
import com.hanweb.common.util.StringUtil;
import com.hanweb.complat.controller.interfaces.ReceiveFormBean;
import com.hanweb.complat.dao.LdapDAO;
import com.hanweb.complat.entity.User;
import com.hanweb.jis.expansion.util.XMLProperties;
import com.hanweb.jis.expansion.webservice.Constants;

/**
 * JIS HTTP接口Service
 * 
 * @author ZhangC
 * 
 */
public class LdapService {

	protected Log logger = LogFactory.getLog(getClass());

	@Autowired
	private LdapDAO ldapDAO;

	/**
	 * 注册SSO接口
	 * 
	 * @param formBean
	 *            SSO配置文件XML对应的Bean
	 * @return
	 */
	public boolean register(ReceiveFormBean formBean) {
		XMLWriter writer = null;
		try {
			SAXReader saxReader = new SAXReader();
			String xmlFile = getXmlFile(formBean.getWeb());
			Document doc = saxReader.read(xmlFile);

			Element element = (Element) doc.selectSingleNode("/ldap/appname");
			if (element != null) {
				element.setText(formBean.getAppname());
			}
			element = (Element) doc.selectSingleNode("/ldap/enckey");
			if (element != null) {
				element.setText(formBean.getEnckey());
			}
			element = (Element) doc.selectSingleNode("/ldap/ldapurl");
			if (element != null) {
				element.setText(formBean.getLdapurl());
			}
			element = (Element) doc.selectSingleNode("/ldap/ssourl");
			if (element != null) {
				element.setText(formBean.getSsourl());
			}
			element = (Element) doc.selectSingleNode("/ldap/encrypttype");
			if (element != null) {
				element.setText(formBean.getEncrypttype());
			}
			writer = new XMLWriter(new FileOutputStream(xmlFile));
			writer.write(doc);
			return true;
		} catch (Exception e) {
			logger.error("SSO register error: write xml faild ", e);
			return false;
		} finally {
			if (writer != null) {
				try {
					writer.close();
				} catch (Exception e) {
				}
			}
		}
	}

	/**
	 * 将SSO 配置文件转换成Bean对象
	 * 
	 * @param formBean
	 * @return
	 */
	public ReceiveFormBean readXML(ReceiveFormBean formBean) {
		SAXReader saxReader = new SAXReader();
		Document doc;
		try {
			doc = saxReader.read(getXmlFile(formBean.getWeb()));
			Element element = (Element) doc.selectSingleNode("/ldap/enckey");
			if (element != null) {
				formBean.setEnckey(element.getText());
			}

			element = (Element) doc.selectSingleNode("/ldap/ldapurl");
			if (element != null) {
				formBean.setLdapurl(element.getText());
			}

			element = (Element) doc.selectSingleNode("/ldap/ssourl");
			if (element != null) {
				formBean.setSsourl(element.getText());
			}

			element = (Element) doc.selectSingleNode("/ldap/appname");
			if (element != null) {
				formBean.setAppname(element.getText());
			}

			element = (Element) doc.selectSingleNode("/ldap/encrypttype");
			if (element != null) {
				formBean.setEncrypttype(element.getText());
			}
		} catch (DocumentException e) {
			logger.error("read xml file error", e);
		}
		return formBean;
	}

	/**
	 * 验证操作
	 * 
	 * @param formBean
	 * @return
	 */
	public boolean checkValidate(ReceiveFormBean formBean) {
		try {
			User userOg = getUserFromBean(formBean);
			if (formBean.getModifyuser().equalsIgnoreCase("F")) { // 不验证
				return true;
			}
			User user = findUserByLoginName(userOg.getLoginName());
			if (formBean.getModifyuser().equalsIgnoreCase("T")) { // 支持新增修改
				if(StringUtil.equals(userOg.getLoginName(), "admin")){// 如果是admin，不做新增和修改
					return true;
				}
				if (user == null || user.getIid() == 0) { // 新增
					addUserInfo(userOg);
				} 
				/**
				 * sso登录不允许修改已有用户
				 */
//				else { // 修改
//					userOg.setIid(user.getIid());
//					modifyUserInfo(userOg);
//				}
			} 
			return true;
		} catch (Exception e) {
			logger.error("checkValidate error：", e);
			return false;
		}
	}

	/**
	 * 修改用户
	 * 
	 * @param user
	 */
	public void modifyUserInfo(User user) {
		user.setPwd(Md5Util.md5encode(user.getPwd()));
		ldapDAO.updateUser(user);
		//
		// UserDetail userDetail = user.getUserDetail();
		// userDetail.setUserId(user.getIid());
		// ldapDao.updateUserDetail(userDetail);
	}

	/**
	 * 添加用户
	 * 
	 * @param user
	 */
	public void addUserInfo(User user) {
		user.setPwd(Md5Util.md5encode(user.getPwd()));
		int iid = ldapDAO.insert(user);
		if (iid <= 0) {
			return;
		}
		// UserDetail userDetail = user.getUserDetail();
		// userDetail.setUserId(iid);
		// ldapDao.insertUserDetail(userDetail);
		return;
	}

	/**
	 * 用户删除，置为失效
	 * 
	 * @param formBean
	 * @return
	 */
	public boolean removeUser(ReceiveFormBean formBean) {
		User user = findUserByLoginName(formBean.getLoginuser());
		if (user == null || user.getIid() == 0) {
			return false;
		}
		return ldapDAO.disableUser(user);
	}

	/**
	 * 通过登录名获得用户
	 * 
	 * @param loginName
	 *            登录名
	 * @return
	 */
	public User findUserByLoginName(String loginName) {
		return ldapDAO.findUserByLoginName(loginName);
	}

	/**
	 * 获取配置文件路径
	 * @param web 内外网
	 * @return
	 */
	public String getXmlFile(String web){
		String xmlfile = BaseInfo.getRealPath();
        if("0".equals(web)){
            xmlfile += "/WEB-INF/config/ldapconf.xml";
        }else{
            xmlfile += "/WEB-INF/config/ldapconfWeb.xml";
        }
        return xmlfile;
	}

	/**
	 * 将接收的formBean转换成用户对象
	 * 
	 * @param formBean
	 * @return
	 */
	private User getUserFromBean(ReceiveFormBean formBean) {
		User user = new User();
		user.setLoginName(formBean.getLoginuser());
		user.setPwd(formBean.getLoginpass());
		user.setName(formBean.getT_name());
		user.setSex("女".equals(formBean.getSex()) ? 0 : 1);
		user.setEmail(formBean.getEmail());
		user.setMobile(formBean.getMobile());
		user.setAddress(formBean.getAddress());
		return user;
	}
	
	/**
	 * 根据ticket获取token json字符串
	 * @param ticket
	 * @return
	 */
	public String getToken(String ticket) {
		try {
			int overtime = 60 * 1000; ///超时时间，默认60秒
			String oprName = "ticketValidate";
			List<Object> value = new ArrayList<Object>();
			XMLProperties xml = new XMLProperties(Constants.JISXMLPATH);
			String jisurl = xml.getAttributes("/root/inner/app", "jisurl");
			String appmark = xml.getAttributes("/root/inner/app", "appmark");
			String enckey = xml.getAttributes("/root/inner/app", "enckey");
			SimpleDateFormat f = new SimpleDateFormat("yyyyMMddHHmmss");  
	        Date date = new Date();  
	        String time = f.format(date);  
	        String sign = Md5Util.encode(appmark+enckey+time);
			Service service = new Service();
			Call call = (Call) service.createCall();
			call.setTargetEndpointAddress(new URL(jisurl+"services/WSAuth?wsdl"));
			call.setTimeout(overtime);
			call.addParameter("appmark", XMLType.XSD_STRING, ParameterMode.IN);
			value.add(appmark);
			call.addParameter("ticket", XMLType.XSD_STRING, ParameterMode.IN);
			value.add(ticket);
			call.addParameter("time", XMLType.XSD_STRING, ParameterMode.IN);
			value.add(time);
			call.addParameter("sign", XMLType.XSD_STRING, ParameterMode.IN);
			value.add(sign);
			call.setReturnType(XMLType.XSD_STRING);
			call.setOperationName(oprName);
			Object result = call.invoke(value.toArray());
			call = null;
			String jsonResult = (String)result;
			System.out.println(jsonResult);
			Map<String, String> map = JsonUtil.StringToObject(jsonResult, Map.class);
			String token = map.get("token");
			if(StringUtil.isNotEmpty(token)){
				return token;
			}else{
				String errormsg = map.get("errormsg");
				//return errormsg;
				logger.error("调用出错：Error:"+errormsg);
				return "";
			}
			
		} catch (Exception e) {
			logger.error("getCall  Error:" + e);;
			return "";
		}
		
	}
	
	/**
	 * 根据token获取 用户信息
	 * @param token
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public String getUserInfo(String token) {
		try {
			int overtime = 60 * 1000; ///超时时间，默认60秒
			String oprName = "findUserByToken";
			List<Object> value = new ArrayList<Object>();
			XMLProperties xml = new XMLProperties(Constants.JISXMLPATH);
			String jisurl = xml.getAttributes("/root/inner/app", "jisurl");
			String appmark = xml.getAttributes("/root/inner/app", "appmark");
			String enckey = xml.getAttributes("/root/inner/app", "enckey");
			SimpleDateFormat f = new SimpleDateFormat("yyyyMMddHHmmss");  
	        Date date = new Date();  
	        String time = f.format(date);  
	        String sign = Md5Util.encode(appmark+enckey+time);
			Service service = new Service();
			Call call = (Call) service.createCall();
			call.setTargetEndpointAddress(new URL(jisurl+"services/WSAuth?wsdl"));
			call.setTimeout(overtime);
			call.addParameter("appmark", XMLType.XSD_STRING, ParameterMode.IN);
			value.add(appmark);
			call.addParameter("token", XMLType.XSD_STRING, ParameterMode.IN);
			value.add(token);
			call.addParameter("time", XMLType.XSD_STRING, ParameterMode.IN);
			value.add(time);
			call.addParameter("sign", XMLType.XSD_STRING, ParameterMode.IN);
			value.add(sign);
			call.setReturnType(XMLType.XSD_STRING);
			call.setOperationName(oprName);
			Object result = call.invoke(value.toArray());
			call = null;
			String jsonResult = (String)result;
			System.out.println("userInfo== "+jsonResult);
			Map<String, String> map = JsonUtil.StringToObject(jsonResult, Map.class);
			String loginname = map.get("loginname");
			if(StringUtil.isNotEmpty(loginname)){
				return loginname;
			}else{
				String errormsg = map.get("errormsg");
				//return errormsg;
				logger.error("调用出错：Error:"+errormsg);
				return "";
			}
			
		} catch (Exception e) {
			logger.error("getCall  Error:" + e);;
			return "";
		}
	}
}
