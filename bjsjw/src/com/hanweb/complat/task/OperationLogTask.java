package com.hanweb.complat.task;

import org.quartz.JobDataMap;

import com.hanweb.common.task.BaseTask;
import com.hanweb.common.task.TaskScheduleBuilder;

public class OperationLogTask extends BaseTask {

	@Override
	protected void config() {
		setTaskId("log_write");
		setTaskName("操作日志");
		setTaskSchedule(TaskScheduleBuilder.getEveryMinuteSchedule(1));
	}

	@Override
	protected void doWork(JobDataMap dataMap) {

	}
}
