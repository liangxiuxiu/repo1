package com.hanweb.complat.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hanweb.common.util.StringUtil;
import com.hanweb.common.util.log.LogWriter;
import com.hanweb.common.util.security.SecurityUtil;
import com.hanweb.complat.app.SystemMailSender;
import com.hanweb.complat.dao.UserDAO;
import com.hanweb.complat.entity.User;

/**
 * 另起一个service为了userservice干净些
 * 
 * @author 李杰
 *
 */
@Service
public class EmailService {

	@Autowired
	private UserDAO userDAO;

	@Autowired
	private UserService userService;

	/**
	 * 获得所有有email的用户id
	 * 
	 * @param ids
	 * @return
	 */
	public List<Integer> findUserIdHasEmail(String ids) {
		List<Integer> idList = StringUtil.toIntegerList(ids);
		return userDAO.findUserIdHasEmail(idList);
	}

	/**
	 * 重置所有用户的
	 * 
	 * @param iid
	 * @return
	 */
	public boolean modifyDynamicCodeAndSendEmail(Integer iid) {
		boolean success = false;
		try {
			User user = userService.findByIid(iid);
			String code = SecurityUtil.createAuthKey();
			success = SystemMailSender.send("申领/重置动态验证码密钥",
					"<h3>亲爱的用户：</h3><div>您已申请动态码密钥申领/重置服务，新的动态码密钥如下：</div><div><a href=\"#\" style=\"color:red;font-weight: bold;\">"
							+ code + "</a></div><h5>【注意】本邮件为系统自动发送，请不要回复。</h5>",
					user.getEmail());
			if (success) {
				userDAO.updateDynamicCode(iid, code);
			}
		} catch (Exception e) {
			LogWriter.error("rest DynamicCode email send error", e);
		}
		return success;
	}
}
