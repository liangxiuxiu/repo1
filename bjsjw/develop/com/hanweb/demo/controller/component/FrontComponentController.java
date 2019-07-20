package com.hanweb.demo.controller.component;

import java.io.File;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.hanweb.common.BaseInfo;
import com.hanweb.common.util.FileUtil;
import com.hanweb.common.util.JsonUtil;
import com.hanweb.common.util.StringUtil;
import com.hanweb.common.util.VerifyCode;
import com.hanweb.common.util.mvc.ControllerUtil;
import com.hanweb.common.util.mvc.JsonResult;
import com.hanweb.common.util.mvc.MultipartFileInfo;
import com.hanweb.common.util.mvc.ResultState;
import com.hanweb.common.view.multifileupload.MultifileUploadConfig;
import com.hanweb.common.view.tree.Tree;
import com.hanweb.common.view.tree.TreeNode;
import com.hanweb.demo.service.InfoNewsService;

@Controller
@RequestMapping("demo/component/front")
public class FrontComponentController {

	@RequestMapping("showlist")
	public ModelAndView showList(String treeNodeName) {
		ModelAndView modelAndView = new ModelAndView("/demo/component/front/list");
		modelAndView.addObject("treeNodeName", treeNodeName);
		return modelAndView;
	}
	
	@RequestMapping("form")
	public ModelAndView form(String treeNodeName){
		ModelAndView modelAndView = new ModelAndView("/demo/component/front/form");
		modelAndView.addObject("treeNodeName", treeNodeName);
		return modelAndView;
	}
	
	@RequestMapping("form-item")
	public ModelAndView formItem(String treeNodeName) {
		ModelAndView modelAndView = new ModelAndView("/demo/component/front/form-item");
		modelAndView.addObject("treeNodeName", treeNodeName);
		
		// 组织多文件上传的配置
		MultifileUploadConfig uploadConfig = new MultifileUploadConfig();
		// 是否选择后立刻上传
		uploadConfig.setAutoStart(true);
		// 是否可以连续添加文件，点击上传按钮之后是否可以继续添加文件
		uploadConfig.setContinuous(false);
		// 添加头
		uploadConfig.addHeader("cookie", "xxxxx");
		// 文件上传的url
		uploadConfig.setUploadUrl("do_upload.do");
		// 添加过滤，多个类型用分号分割
		uploadConfig.setFilter("请选择", "*.txt;*.doc;*.jpg");
		// 可上传文件个数
		uploadConfig.setLimit(5);
		// 每个文件的最大大小
		uploadConfig.setFileSize("10mb");
		// 添加文件后回调function(up, file)
		uploadConfig.setOnAdded("addUploadFile");
		// 删除文件后的回调function(up, file)
		uploadConfig.setOnRemoved("removeUploadFile");
		// 上传后回调function(up, file, json)
		uploadConfig.setAfterUpload("afterUpload");
		// 上传完成回调function(up, file)
		uploadConfig.setCompleteUpload("completeUpload");
		// 上传失败的回调函数function(up, file, errorCode, errorMsg, errorString)
		uploadConfig.setError("uploadError");
		modelAndView.addObject("uploadConfig", uploadConfig);
		return modelAndView;
	}
	
	@RequestMapping("do_upload")
	@ResponseBody
	public String doFileUpload(MultipartFile file){
		String fileId = StringUtil.getUUIDString();
		String fileName = fileId + "." + MultipartFileInfo.getInstance(file).getFileType();
		String path = BaseInfo.getRealPath() + "/temp/" + fileName;
		JsonResult jsonResult = JsonResult.getInstance();
		jsonResult.setSuccess(ControllerUtil.writeMultipartFileToFile(new File(path), file));
		jsonResult.addParam("fileName", fileName);
		return JsonUtil.objectToString(jsonResult);
	}
	
	@RequestMapping("remove_file")
	@ResponseBody
	public JsonResult removeFile(String fileName){
		String path = BaseInfo.getRealPath() + "/temp/" + fileName;
		JsonResult jsonResult = JsonResult.getInstance();
		jsonResult.setSuccess(FileUtil.deleteFile(path));
		return jsonResult;
	}
	
	@RequestMapping("verifyCode")
	@ResponseBody
	public String showVerifyCode(HttpSession session, HttpServletResponse response) {
		return VerifyCode.generate(response, "verifyCode");
	}
	
	@RequestMapping("verifyCode1")
	@ResponseBody
	public String showVerifyCode1(HttpSession session, HttpServletResponse response) {
		return VerifyCode.generate(response, "verifyCode", false);
	}
	
	@RequestMapping("tree")
	@ResponseBody
	public String tree(String treeNodeName) {
		// 创建一个节点list
		Tree tree = Tree.getInstance("treeFrame");
		// 插入一个根节点
		// 使用Tree.addTreeNode增加节点
		// 使用TreeNode.getInstance创建节点
		tree.addNode(TreeNode.getInstance("cities", null, "全国城市"));

		// 插入子节点
		tree.addNode(TreeNode.getInstance("beijing", "cities", "北京", "http://www.beijing.gov.cn/"));
		tree.addNode(TreeNode.getInstance("tianjin", "cities", "天津", "http://www.tj.gov.cn/"));
		tree.addNode(TreeNode.getInstance("nanjing", "cities", "南京", "http://www.nanjing.gov.cn/index.html"));


		// 插入子节点 带链接
		tree.addNode(TreeNode.getInstance("jianye", "nanjing", "建邺区"));

		return tree.parse();
	}
	
	@Autowired
	private InfoNewsService infoNewsService;
	
	@RequestMapping("infonews/add_submit")
	@ResponseBody
	public JsonResult submitAdd(InfoNews infoNews) {
		JsonResult jsonResult = JsonResult.getInstance();
		try {
			infoNewsService.add(infoNews);
			jsonResult.set(ResultState.ADD_SUCCESS);
		}catch(Exception e) {
			jsonResult.set(ResultState.ADD_FAIL);
		}
		return jsonResult;
	}
}
