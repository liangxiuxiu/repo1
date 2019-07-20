package com.hanweb.elasticsearch.view;

import java.util.Locale;

import org.springframework.context.annotation.Configuration;
import org.springframework.core.Ordered;
import org.springframework.web.servlet.View;
import org.springframework.web.servlet.ViewResolver;

@Configuration
public class MyMeiVnViewResolver implements ViewResolver,Ordered {

	@Override
	public View resolveViewName(String viewName, Locale locale) throws Exception {
		if(viewName.startsWith("meinv:")){
			return new MyView();
		}else {
			return null;
		}
		//return null;
	}

	@Override
	public int getOrder() {
		return 0;
	}

}
