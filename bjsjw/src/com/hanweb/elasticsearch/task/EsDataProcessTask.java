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

public class EsDataProcessTask extends BaseTask {
    
	@Override
	protected void config() {
		setTaskId("EsDataProcessTask");
		setTaskName("Es数据同步办件Process表");
		setTaskSchedule(TaskScheduleBuilder.getEverySecondSchedule(3));
	}

	@Override
	protected void doWork(JobDataMap arg0) {
        
		System.out.println("过程信息线程开始");
		long startTime=System.currentTimeMillis(); 
		//切换到网闸办件外库
		DataSourceSwitch.change("qzkwz");
		//查询需要同步的办件数据
		final EsDataService esDataService = SpringUtil.getBean(EsDataService.class);
		
		//Integer acceptCount = esDataService.getAcceptCount("0");
		//判断结果表是否已同步完
		Integer resultCount = esDataService.getResultCount("0");
		if(resultCount != 0 ){
			//System.out.println("办件表还没有同步完");
			return ;
		}

		List<Map<String, Object>> processList = esDataService.getProcessList(StaticValues.BJCOUNT);
		ExecutorService executorService = null ;
		int processNum = 0;
		if(processList != null){
			processNum = processList.size();
		}
		if(processNum == StaticValues.BJCOUNT){
			executorService = Executors.newFixedThreadPool(20);
		}else if(processNum >0 && processNum<StaticValues.BJCOUNT){
			executorService = Executors.newFixedThreadPool(3);
		}else {
			System.out.println("过程线程没活了");
			return ;
		}
		System.out.println("来这里了");
		for (final Map<String, Object> map : processList) {
			executorService.execute(new Runnable() {
				
				@Override
				public void run() {
					DataSourceSwitch.change("qzkwz");

					 String type = Escommon.getType(map,"pro_process") ;
					    if(!"I".equalsIgnoreCase(type)){
					    	esDataService.updateProcess((Long)map.get("ID"));
					    }else {
							boolean flag = false;

					    	//向办件受理表中同步数据
							flag = ESController.addProcess(map);
							//判断该办件是否有结果
							boolean isData = Escommon.getStatus("pro_result", (String)(map.get("ProjectNo")));
							//修改办件受理表中办件状态
							if (flag){
								if(!isData){
									ESController.updateAcceptStatus((String)map.get("ProjectNo"),"2");
								}else {
									ESController.updateAcceptStatus((String)map.get("ProjectNo"),"3");
								}
								
							}
							if (flag) {
								esDataService.updateProcess((Long)map.get("ID"));
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
		long endTime=System.currentTimeMillis(); //获取结束时间
		System.out.println("Es数据同步办件过程表程序运行时间： "+(endTime-startTime)+"ms");
	
	}
}
