package com.hanweb.demo.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hanweb.demo.controller.component.InfoNews;
import com.hanweb.demo.dao.InfoNewsDAO;

@Service
public class InfoNewsService {
	
	@Autowired
	private InfoNewsDAO infoNewsDAO;
	
	public void add(InfoNews infoNews) {
		infoNewsDAO.insert(infoNews);
	}
}
