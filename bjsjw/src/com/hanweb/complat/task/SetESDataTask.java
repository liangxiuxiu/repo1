package com.hanweb.complat.task;

import org.quartz.JobDataMap;

import com.hanweb.common.BaseInfo;
import com.hanweb.common.task.BaseTask;
import com.hanweb.common.task.TaskScheduleBuilder;
import com.hanweb.searchcore.client.Config;

/**
 * 项目启动初始化es（据说已封装好）
 * @author jiangzt
 *
 */
public class SetESDataTask extends BaseTask {
	
	@Override
	protected void config() {
		setTaskId("setesdatatask");
		setTaskName("数据导入es");
		//项目启动就执行
		setTaskSchedule(TaskScheduleBuilder.getOnceSchedule());
	}

	@Override
	protected void doWork(JobDataMap dataMap) {
		this.init();
		//判断索引是否存在，不存在创建索引
	}
	public void init() {
		String appPath = BaseInfo.getRealPath();
		BaseInfo.initWithPath(appPath, "complat");
		Config.init(appPath);
	}
	
}
