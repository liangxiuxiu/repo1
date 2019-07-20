package com.hanweb.elasticsearch.task;



import java.util.List;

import java.util.Map;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;


import org.quartz.JobDataMap;

import com.hanweb.common.datasource.DataSourceSwitch;
import com.hanweb.common.task.BaseTask;
import com.hanweb.common.task.TaskScheduleBuilder;
import com.hanweb.common.util.SpringUtil;
import com.hanweb.complat.constant.StaticValues;
import com.hanweb.elasticsearch.common.Escommon;
import com.hanweb.elasticsearch.controller.ESController;
import com.hanweb.elasticsearch.service.EsDataService;


public class EsDataAcceptTask extends BaseTask {
	


	@Override
	protected void config() {
		setTaskId("EsDataAcceptTask");
		setTaskName("Es数据同步办件受理表");
		setTaskSchedule(TaskScheduleBuilder.getEverySecondSchedule(3));
	}

	@Override
	protected void doWork(JobDataMap arg0) {
		System.out.println(Thread.currentThread().getName()+"--办件受理信息数据同步线程开始");
		long startTime=System.currentTimeMillis();   //获取开始时间
		//切换到网闸办件外库
		DataSourceSwitch.change("qzkwz");
		//查询需要同步的办件数据
		final EsDataService esDataService = SpringUtil.getBean(EsDataService.class);
		
		List<Map<String, Object>> acceptList = esDataService.getAcceptList(StaticValues.BJCOUNT);
		int acceptNum = 0 ;
		if(acceptList != null){
			acceptNum = acceptList.size() ;
		}
		 
		ExecutorService executorService = null ;
		if(acceptNum == StaticValues.BJCOUNT){
			executorService = Executors.newFixedThreadPool(20);
			System.out.println("我是20");

		}else if(acceptNum > 0 && acceptNum < StaticValues.BJCOUNT){
			executorService = Executors.newFixedThreadPool(3);
		}else {
		//	System.out.println("受理线程没活了");
			return ;
		}
	
		
		for (final Map<String, Object> map : acceptList) {
			executorService.execute(new Runnable(){

				@Override
				public void run() {
					DataSourceSwitch.change("qzkwz");
					String type = Escommon.getType(map,"pro_accept") ;
					
				    if(!"I".equalsIgnoreCase(type)){//如果type返回的不是“I”,则退出进入下一层循环
				    	esDataService.updateAccept((Long)map.get("ID"));//反写受理表
				    	
				    }else {
					    boolean flag = false;
						if (((String)map.get("Cd_source")).substring(0, 1).equals("P")) {
							flag = ESController.add(map,((String)map.get("Cd_source")).substring(1, 3)+"0000");
						}else {
							flag = ESController.add(map,((String)map.get("Cd_source")).substring(1, 3));
						}
						if (flag) {
							flag = esDataService.updateAccept((Long)map.get("ID"));
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
		
		//	DataSourceSwitch.changeDefault();
		long endTime=System.currentTimeMillis(); 
		System.out.println("受理表程序运行时间： "+(endTime-startTime)+"ms");
		
	}
	
	
}
