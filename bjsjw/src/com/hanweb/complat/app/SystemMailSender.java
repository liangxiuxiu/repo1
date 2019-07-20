package com.hanweb.complat.app;

import org.apache.commons.lang.ArrayUtils;
import org.apache.commons.mail.EmailException;

import com.hanweb.common.BaseInfo;
import com.hanweb.common.util.MailSend;
import com.hanweb.common.util.Properties;
import com.hanweb.common.util.StringUtil;
import com.hanweb.common.util.log.LogWriter;
import com.hanweb.complat.exception.OperationException;

/**
 * 系统邮件封装
 * 
 * @author 李杰
 *
 */
public class SystemMailSender {

	private static Properties emailProp = null;

	static {
		loadProp();
	}

	/**
	 * load email prop
	 */
	public static void loadProp() {
		emailProp = new Properties(BaseInfo.getRealPath() + "/WEB-INF/config/mail_server.properties");
	}

	/**
	 * 发送邮件
	 * 
	 * @param subject
	 * @param content
	 * @param to
	 */
	public static boolean send(String subject, String content, String... tos) {
		String emailHost = emailProp.getString("resetpwd.host");
		String emailUser = emailProp.getString("resetpwd.user");
		String emailPwd = emailProp.getString("resetpwd.pwd");
		String form = emailProp.getString("resetpwd.form");
		String formNickname = emailProp.getString("resetpwd.form.nickname");
		if (StringUtil.isEmpty(formNickname)) {
			formNickname = "admin";
		}
		boolean success = false;
		if (StringUtil.isNotEmpty(emailHost) && StringUtil.isNotEmpty(emailUser) && StringUtil.isNotEmpty(emailPwd)) {
			MailSend mailSend = new MailSend();
			mailSend.setHostName(emailHost);
			mailSend.setAuthentication(emailUser, emailPwd);
			mailSend.setFrom(form, formNickname);

			mailSend.setSubject(subject);
			if (ArrayUtils.isNotEmpty(tos)) {
				for (String to : tos) {
					mailSend.addTo(to);
				}
			}
			mailSend.setHtmlMsg(content);
			try {
				mailSend.send();
				success = true;
			} catch (EmailException e) {
				LogWriter.error("send mail error", e);
			}
		} else {
			LogWriter.error("send mail error: emailHost/emailUser/emailPwd is empty");
			throw new OperationException("");
		}
		return success;
	}
}
