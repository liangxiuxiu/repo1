package com.hanweb.elasticsearch.task;

import java.text.SimpleDateFormat;

import java.util.Calendar;

import org.quartz.JobDataMap;

import com.hanweb.common.datasource.DataSourceSwitch;
import com.hanweb.common.task.BaseTask;
import com.hanweb.common.task.TaskScheduleBuilder;
import com.hanweb.common.util.SpringUtil;
import com.hanweb.elasticsearch.service.EsDataService;


public class DeleteBanJian extends BaseTask {

	@Override
	protected void config() {
		setTaskId("DeleteBanJian");
		setTaskName("定期清理办件库中的数据");
		setTaskSchedule(TaskScheduleBuilder.getEveryHourSchedule(24));
//		setTaskSchedule(TaskScheduleBuilder.getEverySecondSchedule(5));
	}

	@Override
	protected void doWork(JobDataMap arg0) {
		System.out.println("定期清理办件库中的数据线程启动");
		long startTime = System.currentTimeMillis();
		
		Calendar calendar1 = Calendar.getInstance();
		  SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd");
		  calendar1.add(Calendar.DATE, -7);
		  String NewTime = sdf1.format(calendar1.getTime());
		//切换到网闸前置库
		DataSourceSwitch.change("qzkwz");
		//查询办件受理表中数据条数
		EsDataService esDataService = SpringUtil.getBean(EsDataService.class);
		//受理表中办件数量
		long acceptLong = esDataService.getDataLong("up_pro_accept");
		//过程表中办件数量
		long processLong = esDataService.getDataLong("up_pro_process");
		//结果表中办件数量
		long resultLong = esDataService.getDataLong("up_pro_result");
		//材料表中办件数量 
		long material = esDataService.getDataLong("up_pro_material");
		//
		//long specialProcedure = 
		boolean flag = false;
		if (acceptLong > 5000000) {
			//删除已经同步办件受理表的数据
			flag = esDataService.deleteAccept("1",NewTime);
		}
		if (processLong > 5000000) {
			//删除已经同步的办件过程表数据
			flag = esDataService.deleteProaccept("1", NewTime);
		}
		
		if (resultLong > 5000000) {
			//删除已经同步的办件结果表数据
			flag = esDataService.deleteResult("1",NewTime);
		}
		
		if (material > 5000000) {
			flag = esDataService.deleteMaterial("1", NewTime);
		}
		
		DataSourceSwitch.changeDefault();
		long endTime=System.currentTimeMillis(); 
		System.out.println("Es数据同步办件受理表程序运行时间： "+(endTime-startTime)+"ms");
	}

}
