package com.hanweb.train;

import org.junit.Test;
import com.hanweb.common.util.StringUtil;
import com.hanweb.common.util.log.LogWriter;
import com.hanweb.common.validation.ValidationException;
import com.hanweb.common.validation.validate.BaseValidate;
import com.hanweb.common.validation.validate.Validate;

public class ValidationTest {
	
	@Test
	public void valid(){
		String username = "test@163.com";
		try {
			Validate.getInstance(username).require("用户名必须填写").regex("用户名必须是邮件", Validate.Regex.EMAIL);
		} catch (ValidationException e) {
			LogWriter.debug(e.getMessage());
		}
	}
	
	@Test
	public void valid1(){
		String username = "test_valid";
		try {
			Validate.getInstance(username).require("用户名必须填写").asserts("必须为test_valid", new BaseValidate<String>() {
				@Override
				public boolean validate(String t) {
					if(StringUtil.equals("test_valid", t)) {
						return true;
					}
					return false;
				}
			});
		} catch (ValidationException e) {
			LogWriter.debug(e.getMessage());
		}
	}
	
	@Test
	public void valid2(){
		int age = 17;
		try {
			Validate.getInstance(age).require("年龄必须填写").range("年龄必须在18~40之间", 18, 40);
		} catch (ValidationException e) {
			LogWriter.debug(e.getMessage());
		}
	}
}
