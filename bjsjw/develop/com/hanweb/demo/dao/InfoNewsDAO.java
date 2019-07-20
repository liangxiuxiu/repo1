package com.hanweb.demo.dao;

import org.springframework.stereotype.Repository;

import com.hanweb.common.basedao.BaseJdbcDAO;
import com.hanweb.demo.controller.component.InfoNews;

@Repository
public class InfoNewsDAO extends BaseJdbcDAO<Integer, InfoNews> {

}
