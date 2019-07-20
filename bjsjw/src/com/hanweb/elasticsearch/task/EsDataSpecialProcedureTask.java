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

public class EsDataSpecialProcedureTask extends BaseTask {

	@Override
	protected void config() {
		setTaskId("EsDataSpecialProcedureTask");
		setTaskName("Es数据同步办件SpecialProcedure表");
		setTaskSchedule(TaskScheduleBuilder.getEverySecondSchedule(3));
	}

	@Override
	protected void doWork(JobDataMap arg0) {
		System.out.println(Thread.currentThread().getName()+"特殊材料开始执行");
		//long startTime=System.currentTimeMillis();
		//切换到网闸办件外库
		DataSourceSwitch.change("qzkwz");
		//查询需要同步的办件数据
		final EsDataService esDataService = SpringUtil.getBean(EsDataService.class);

		List<Map<String, Object>> specialList = esDataService.getSpecialProcedureList(StaticValues.BJCOUNT);
		int specialNum = 0;
		if(specialList != null){
			specialNum = specialList.size() ;
		}
		ExecutorService executorService = null ;
		if(specialNum == StaticValues.BJCOUNT){
			executorService = Executors.newFixedThreadPool(8);

		}else if(specialNum >0 && specialNum < StaticValues.BJCOUNT){
			executorService = Executors.newFixedThreadPool(3);
		}else {
			return ;
		}
			
		for (final Map<String, Object> map : specialList) {
			executorService.execute(new Runnable() {
				
				@Override
				public void run() {
					DataSourceSwitch.change("qzkwz");

					String type = Escommon.getType(map,"pro_specialprocedure") ;
					if(!"I".equals(type)){
						 esDataService.updateSpecialProcedure((Long)map.get("ID"));
					}
					else {
						boolean flag = false;

						if (((String)map.get("Cd_source")).substring(0, 1).equals("P")) {
							flag = ESController.add_specialprocedure(map,((String)map.get("Cd_source")).substring(1, 3)+"0000");
						}else {
							flag = ESController.add_specialprocedure(map,((String)map.get("Cd_source")).substring(1, 3));
						}
						if (flag) {
							flag = esDataService.updateSpecialProcedure((Long)map.get("ID"));
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
	 //   System.out.println("Es数据同步办件过程表程序运行时间： "+(endTime-startTime)+"ms");
	
		//System.out.println(Thread.currentThread().getName()+"特殊材料执行完毕");



	}
}
