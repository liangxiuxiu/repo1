package com.hanweb.complat.listener;


import javax.servlet.ServletContextEvent;

import javax.servlet.ServletContextListener;

import com.hanweb.elasticsearch.task.*;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.web.context.ContextLoaderListener;

import com.hanweb.common.BaseInfo;
import com.hanweb.common.datasource.DataSourceConfig;
import com.hanweb.common.datasource.DataSourceManager;
import com.hanweb.common.task.TaskManager;
import com.hanweb.common.util.NumberUtil;
import com.hanweb.common.util.Properties;
import com.hanweb.complat.task.OperationLogTask;
import com.hanweb.complat.task.ResetPwdTask;
import com.hanweb.complat.task.SetESDataTask;
import com.hanweb.complat.task.TempFileTask;
import com.hanweb.jis.expansion.webservice.Constants;

/**
 * 平台监听
 * 
 * @author 李杰
 * 
 */
public class SystemListener extends ContextLoaderListener implements ServletContextListener {
	/**
     * 
     */
	protected final Log logger = LogFactory.getLog(SystemListener.class);

	@Override
	public void contextInitialized(ServletContextEvent event) {
		// 初始化jis
		Constants.setSysPath(BaseInfo.getRealPath());
		// 判断是否已经注册并初始化过
		if (BaseInfo.isPrepared()) {
			initApplication();
		}
		//加载办件前置库连接信息
		loadDataBaseProp(new Properties(BaseInfo.getRealPath() + "/WEB-INF/config/extend_db/task.properties"), "qzkwz", String.valueOf(BaseInfo.MYSQL));

	
	}

	/**
	 * initApplication:(具体应用需要初始化的内容在此实现).
	 */
	public void initApplication() {
		TaskManager.addTask(

				/*new EsDataAcceptTask(),
				new EsDataProcessTask(),
			    new EsDataResultTask(),
				new EsDataMaterialTask(),
				new EsDataSpecialProcedureTask()*/
				//定时任务删除表中已经同步的数据,保证同步的数据同步的效率
				//new DeleteBanJian()
				);
	}

	
	/**
     * 加载数据库连接信息
     * @param prop      保存连接信息的配置文件
     * @param alias     连接池别名
     * @param dbType    数据库类型
     */
    public void loadDataBaseProp(Properties prop, String alias, String dbType){
        String ip = prop.getString("ip");
        String port = prop.getString("port");
        String dbname = prop.getString("dbname");
        String username = prop.getString("username");
        String password = prop.getString("password");
        String trace = prop.getString("trace");
        int max = NumberUtil.getInt(prop.getString("maximumConnectionCount"));
        int min = NumberUtil.getInt(prop.getString("minimumConnectionCount"));
        DataSourceConfig config = new DataSourceConfig(alias, ip, port, dbname, username, password,
                dbType);
        if ("true".equals(trace)) {
            config.setTrace(true);
        }
        config.setMaximumConnectionCount(max);
        config.setMinimumConnectionCount(min);
        DataSourceManager.addDataSource(config);
    }
   
}
