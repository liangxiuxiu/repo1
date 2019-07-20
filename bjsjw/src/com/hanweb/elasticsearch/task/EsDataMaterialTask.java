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

public class EsDataMaterialTask extends BaseTask {

	@Override
	protected void config() {
		setTaskId("EsDataMaterialTask");
		setTaskName("Es数据同步办件Material表");
		setTaskSchedule(TaskScheduleBuilder.getEverySecondSchedule(3));
	}

	@Override
	protected void doWork(JobDataMap arg0) {
		System.out.println(Thread.currentThread().getName()+"办件材料线程开始同步");
	//	long startTime=System.currentTimeMillis(); 
		//切换到网闸办件外库
		DataSourceSwitch.change("qzkwz");
		//查询需要同步的办件数据
		final EsDataService esDataService = SpringUtil.getBean(EsDataService.class);
		List<Map<String, Object>> materialList = esDataService.getMaterialList(StaticValues.BJCOUNT);
		int materNum = 0 ;
		if(materialList != null){
			materNum = materialList.size() ;
		}
		ExecutorService executorService = null ;
		if(materNum == 500){
			executorService = Executors.newFixedThreadPool(2);

		}else if(materNum > 0 && materNum < StaticValues.BJCOUNT){
			executorService = Executors.newFixedThreadPool(1);
		}else {
			//System.out.println("特殊材料---没有活干了");
			return ;
		}
		for (final Map<String, Object> map : materialList) {
			executorService.execute(new Runnable() {
				
				@Override
				public void run() {
					DataSourceSwitch.change("qzkwz");

					   String type = Escommon.getType(map,"pro_materialcatalogue") ;
					    if(!"I".equals(type)){
					    	esDataService.updateMaterial((Long)map.get("ID")) ;
					    }else {
							boolean flag = false;
							flag = ESController.addMaterial(map);
							if (flag) {
								flag = esDataService.updateMaterial((Long)map.get("ID"));
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
	//	long endTime=System.currentTimeMillis(); //获取结束时间
		//System.out.println("Es数据同步办件过程表程序运行时间： "+(endTime-startTime)+"ms");
	}
}
