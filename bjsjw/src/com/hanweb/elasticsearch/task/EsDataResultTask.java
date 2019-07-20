package com.hanweb.elasticsearch.task;

import com.hanweb.common.datasource.DataSourceSwitch;
import com.hanweb.common.task.BaseTask;
import com.hanweb.common.task.TaskScheduleBuilder;
import com.hanweb.common.util.SpringUtil;
import com.hanweb.complat.constant.StaticValues;
import com.hanweb.elasticsearch.common.Escommon;
import com.hanweb.elasticsearch.controller.ESController;
import com.hanweb.elasticsearch.service.EsDataService;

import org.quartz.JobDataMap;

import java.util.List;
import java.util.Map;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

public class EsDataResultTask extends BaseTask {

	@Override
	protected void config() {
		setTaskId("EsDataResultTask");
		setTaskName("Es数据同步办件Result表");
		setTaskSchedule(TaskScheduleBuilder.getEverySecondSchedule(3));
	}

	@Override
	protected void doWork(JobDataMap arg0) {
		
		System.out.println(Thread.currentThread().getName()+"办件结果表线程开始同步");
		//long startTime=System.currentTimeMillis(); 
		//切换到网闸办件外库
		DataSourceSwitch.change("qzkwz");
		//查询需要同步的办件数据
		final EsDataService esDataService = SpringUtil.getBean(EsDataService.class);
		//判断办件受理表是否已同步
		Integer acceptCount = esDataService.getAcceptCount("0");
		if(acceptCount != 0){
			//System.out.println("办件表还没有同步完");
			return ;
		}
		List<Map<String, Object>> resultList = esDataService.getResultList(StaticValues.BJCOUNT);
		int resultNum = 0;
		if(resultList != null){
			resultNum = resultList.size() ;
		} 
		ExecutorService executorService = null ;
		if(resultNum == StaticValues.BJCOUNT){
			executorService = Executors.newFixedThreadPool(20);

		}else if(resultNum >0 && resultNum<StaticValues.BJCOUNT) {
			executorService = Executors.newFixedThreadPool(3);
		}else {
			//System.out.println("办件结果线程没活了");
			return ;
		}
		for (final Map<String, Object> map : resultList) {
			executorService.execute(new Runnable() {
				
				@Override
				public void run() {
					DataSourceSwitch.change("qzkwz");

					    String type = Escommon.getType(map,"pro_result") ;
					    if(!"I".equals(type)){
					    	esDataService.updateResult((Long)map.get("ID"));
					    
					    }else {
							boolean flag = false;
							//添加结果数据
							flag = ESController.addResult(map);
							if (flag) {
								//修改受理表办件状态
								ESController.updateAcceptStatus((String)map.get("ProjectNo"),"3");
							}
							if (flag) {
								flag = esDataService.updateResult((Long)map.get("ID"));
							}
					    }
					
				}
			});
			
		}
		executorService.shutdown();
		while (true){
			if(executorService.isTerminated()){
				break ;
			}else {
				try {
					Thread.sleep(200);
				} catch (InterruptedException e) {
					e.printStackTrace();
				}
			}
			
		}
		
		DataSourceSwitch.changeDefault();
		//long endTime=System.currentTimeMillis(); //获取结束时间
		//System.out.println("Es数据同步办件结果表程序运行时间： "+(endTime-startTime)+"ms");
	}
}
