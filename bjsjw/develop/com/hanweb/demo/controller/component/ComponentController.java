package com.hanweb.demo.controller.component;

import java.io.File;
import java.util.Arrays;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.hanweb.common.BaseInfo;
import com.hanweb.common.util.DateUtil;
import com.hanweb.common.util.StringUtil;
import com.hanweb.common.util.VerifyCode;
import com.hanweb.common.util.mvc.ControllerUtil;
import com.hanweb.common.util.mvc.FileResource;
import com.hanweb.common.util.mvc.MultipartFileInfo;
import com.hanweb.common.util.mvc.Script;
import com.hanweb.common.view.tree.Tree;
import com.hanweb.common.view.tree.TreeNode;

@Controller("demo")
@RequestMapping("manager/demo/component")
public class ComponentController {
	
	@RequestMapping("tree")
	public ModelAndView tree(String treeNodeName) {
		ModelAndView modelAndView = new ModelAndView("/demo/component/tree");
		// 创建一个节点list
		Tree tree = Tree.getInstance();
		// 插入一个根节点
		// 使用Tree.addTreeNode增加节点
		// 使用TreeNode.getInstance创建节点
		tree.addNode(TreeNode.getInstance("cities", null, "全国城市"));

		// 插入子节点
		tree.addNode(TreeNode.getInstance("beijing", "cities", "北京(无链接)"));
		tree.addNode(TreeNode.getInstance("tianjin", "cities", "天津(无链接)"));
		tree.addNode(TreeNode.getInstance("nanjing", "cities", "南京(无链接)"));

		// 插入子节点 带链接
		tree.addNode(TreeNode.getInstance("jianye", "nanjing", "建邺区"));

		// 将节点list转换为json数据
		// 将节点的json数据带入 view (jsp)
		modelAndView.addObject("tree", tree.parse());
		modelAndView.addObject("treeNodeName", treeNodeName);
		return modelAndView;
	}

	@RequestMapping("calendar")
	public ModelAndView calendar(String treeNodeName) {
		ModelAndView modelAndView = new ModelAndView("/demo/component/calendar");
		modelAndView.addObject("currentDate", DateUtil.getCurrDate(DateUtil.YYYY_MM_DD));
		modelAndView.addObject("treeNodeName", treeNodeName);
		return modelAndView;
	}

	@RequestMapping("checkpwd")
	public ModelAndView checkpwd(String treeNodeName) {
		ModelAndView modelAndView = new ModelAndView("/demo/component/checkpwd");
		modelAndView.addObject("treeNodeName", treeNodeName);
		return modelAndView;
	}

	@RequestMapping("dialog")
	public ModelAndView dialog(String treeNodeName) {
		ModelAndView modelAndView = new ModelAndView("/demo/component/dialog");
		modelAndView.addObject("treeNodeName", treeNodeName);
		return modelAndView;
	}

	@RequestMapping("btn")
	public ModelAndView btn(String treeNodeName) {
		ModelAndView modelAndView = new ModelAndView("/demo/component/btn");
		modelAndView.addObject("treeNodeName", treeNodeName);
		return modelAndView;
	}

	@RequestMapping("loadmask")
	public ModelAndView loadmask(String treeNodeName) {
		ModelAndView modelAndView = new ModelAndView("/demo/component/loadmask");
		modelAndView.addObject("treeNodeName", treeNodeName);
		return modelAndView;
	}

	@RequestMapping("tip")
	public ModelAndView tip(String treeNodeName) {
		ModelAndView modelAndView = new ModelAndView("/demo/component/tip");
		modelAndView.addObject("treeNodeName", treeNodeName);
		return modelAndView;
	}

	@RequestMapping("validity")
	public ModelAndView validity(String treeNodeName) {
		ModelAndView modelAndView = new ModelAndView("/demo/component/validity");
		modelAndView.addObject("treeNodeName", treeNodeName);
		return modelAndView;
	}

	@RequestMapping("autoCheck")
	public ModelAndView autoCheck(String treeNodeName) {
		ModelAndView modelAndView = new ModelAndView("/demo/component/autocheck");
		// 性别
		modelAndView.addObject("sex", true);

		// 已选择的id
		Integer[] ids = { 1, 3, 6 };
		modelAndView.addObject("selectIds", Arrays.asList(ids));

		// 学历
		int degree = 3;
		modelAndView.addObject("degree", degree);

		modelAndView.addObject("treeNodeName", treeNodeName);
		return modelAndView;
	}

	@RequestMapping("fileupload_show")
	public ModelAndView showFileUpload(String treeNodeName) {
		ModelAndView modelAndView = new ModelAndView("/demo/component/fileupload_opr");
		modelAndView.addObject("url", "fileupload_submit.do");
		modelAndView.addObject("treeNodeName", treeNodeName);
		return modelAndView;
	}

	@RequestMapping("fileupload_submit")
	@ResponseBody
	public String submitFileUpload(MultipartFile file) {
		Script script = Script.getInstanceWithJsLib();
		// 可以用MultipartFileInfo获取上传文件信息
		MultipartFileInfo info = MultipartFileInfo.getInstance(file);
		script.addScript("parent.result", info.getFileName(), info.getFileFullName(),
				info.getFileType(), info.getSize());

		// 由于文件目前属于暂存状态，我们需要把文件拷贝到我们需要的位置
		String newFileName = StringUtil.getUUIDString() + "." + info.getFileType();
		File desFile = new File(BaseInfo.getRealPath() + "/tmp/" + newFileName);
		// 开始拷贝
		ControllerUtil.writeMultipartFileToFile(desFile, file);

		String filePath = desFile.getAbsolutePath();
		String downloadPath = "download.do?fileName=" + newFileName + "&oldName="
				+ info.getFileFullName();
		script.addScript("parent.display", filePath, downloadPath);
		return script.getScript();
	}

	@RequestMapping(value = "multifileupload_show")
	public ModelAndView showMultifileUpload(String treeNodeName) {
		ModelAndView modelAndView = new ModelAndView("/demo/component/multifileupload_opr");
		modelAndView.addObject("formUrl", "result.do");
		modelAndView.addObject("uploadUrl", BaseInfo.getContextPath()
				+ "/manager/component/multifileupload.do");
		modelAndView.addObject("treeNodeName", treeNodeName);
		return modelAndView;
	}

	@RequestMapping("download")
	public FileResource downloadFile(HttpServletRequest request, String fileName, String oldName) {
		File desFile = new File(BaseInfo.getRealPath() + "/tmp/" + fileName);
		return ControllerUtil.getFileResource(desFile, oldName);
	}

	@RequestMapping("tabs")
	public ModelAndView tabs(String treeNodeName) {
		ModelAndView modelAndView = new ModelAndView("/demo/component/tabs");
		modelAndView.addObject("treeNodeName", treeNodeName);
		return modelAndView;
	}

	@RequestMapping("dialogopr")
	public ModelAndView dialogopr() {
		ModelAndView modelAndView = new ModelAndView("/demo/component/dialogopr");
		return modelAndView;
	}

	@RequestMapping("pageopr")
	public ModelAndView pageopr(String treeNodeName) {
		ModelAndView modelAndView = new ModelAndView("/demo/component/pageopr");
		modelAndView.addObject("treeNodeName", treeNodeName);
		return modelAndView;
	}

	@RequestMapping("list")
	public ModelAndView list(String treeNodeName) {
		ModelAndView modelAndView = new ModelAndView("/demo/component/list");
		modelAndView.addObject("treeNodeName", treeNodeName);
		return modelAndView;
	}

	@RequestMapping("code")
	public ModelAndView code(String treeNodeName) {
		ModelAndView modelAndView = new ModelAndView("/demo/component/code");
		modelAndView.addObject("treeNodeName", treeNodeName);
		return modelAndView;
	}
	
	@RequestMapping("verifyCode")
	@ResponseBody
	public String showVerifyCode(HttpSession session, HttpServletResponse response) {
		return VerifyCode.generate(response, "verifyCode");
	}

	@RequestMapping("message")
	public ModelAndView message(String treeNodeName) {
		ModelAndView modelAndView = new ModelAndView("/demo/component/message");
		modelAndView.addObject("treeNodeName", treeNodeName);
		return modelAndView;
	}

	@RequestMapping(value = "editor")
	public ModelAndView editor(String treeNodeName) {
		ModelAndView modelAndView = new ModelAndView("demo/component/editor");
		modelAndView.addObject("treeNodeName", treeNodeName);
		return modelAndView;
	}

	@RequestMapping(value = "iconfont")
	public ModelAndView iconfont(String treeNodeName) {
		ModelAndView modelAndView = new ModelAndView("demo/component/iconfont");
		modelAndView.addObject("treeNodeName", treeNodeName);
		return modelAndView;
	}

	@RequestMapping("sys")
	public ModelAndView sys(String treeNodeName) {
		ModelAndView modelAndView = new ModelAndView("/demo/component/sys");
		modelAndView.addObject("treeNodeName", treeNodeName);
		return modelAndView;
	}

	@RequestMapping("date")
	public ModelAndView date(String treeNodeName) {
		ModelAndView modelAndView = new ModelAndView("/demo/component/date");
		modelAndView.addObject("treeNodeName", treeNodeName);
		return modelAndView;
	}

	@RequestMapping("file")
	public ModelAndView file(String treeNodeName) {
		ModelAndView modelAndView = new ModelAndView("/demo/component/file");
		modelAndView.addObject("treeNodeName", treeNodeName);
		return modelAndView;
	}

	@RequestMapping("json")
	public ModelAndView json(String treeNodeName) {
		ModelAndView modelAndView = new ModelAndView("/demo/component/json");
		modelAndView.addObject("treeNodeName", treeNodeName);
		return modelAndView;
	}

	@RequestMapping("number")
	public ModelAndView number(String treeNodeName) {
		ModelAndView modelAndView = new ModelAndView("/demo/component/number");
		modelAndView.addObject("treeNodeName", treeNodeName);
		return modelAndView;
	}

	@RequestMapping("pinyin")
	public ModelAndView pinyin(String treeNodeName) {
		ModelAndView modelAndView = new ModelAndView("/demo/component/pinyin");
		modelAndView.addObject("treeNodeName", treeNodeName);
		return modelAndView;
	}

	@RequestMapping("prop")
	public ModelAndView prop(String treeNodeName) {
		ModelAndView modelAndView = new ModelAndView("/demo/component/prop");
		modelAndView.addObject("treeNodeName", treeNodeName);
		return modelAndView;
	}

	@RequestMapping("spring")
	public ModelAndView spring(String treeNodeName) {
		ModelAndView modelAndView = new ModelAndView("/demo/component/spring");
		modelAndView.addObject("treeNodeName", treeNodeName);
		return modelAndView;
	}

	@RequestMapping("string")
	public ModelAndView string(String treeNodeName) {
		ModelAndView modelAndView = new ModelAndView("/demo/component/string");
		modelAndView.addObject("treeNodeName", treeNodeName);
		return modelAndView;
	}

	@RequestMapping("controller")
	public ModelAndView controller(String treeNodeName) {
		ModelAndView modelAndView = new ModelAndView("/demo/component/controller");
		modelAndView.addObject("treeNodeName", treeNodeName);
		return modelAndView;
	}

	@RequestMapping("script")
	public ModelAndView script(String treeNodeName) {
		ModelAndView modelAndView = new ModelAndView("/demo/component/script");
		modelAndView.addObject("treeNodeName", treeNodeName);
		return modelAndView;
	}

	@RequestMapping("xml")
	public ModelAndView xml(String treeNodeName) {
		ModelAndView modelAndView = new ModelAndView("/demo/component/xml");
		modelAndView.addObject("treeNodeName", treeNodeName);
		return modelAndView;
	}

	@RequestMapping("cache")
	public ModelAndView cache(String treeNodeName) {
		ModelAndView modelAndView = new ModelAndView("/demo/component/cache");
		modelAndView.addObject("treeNodeName", treeNodeName);
		return modelAndView;
	}

	@RequestMapping("freemarker")
	public ModelAndView freemarker(String treeNodeName) {
		ModelAndView modelAndView = new ModelAndView("/demo/component/freemarker");
		modelAndView.addObject("treeNodeName", treeNodeName);
		return modelAndView;
	}

	@RequestMapping("zip")
	public ModelAndView zip(String treeNodeName) {
		ModelAndView modelAndView = new ModelAndView("/demo/component/zip");
		modelAndView.addObject("treeNodeName", treeNodeName);
		return modelAndView;
	}

	@RequestMapping("rar")
	public ModelAndView rar(String treeNodeName) {
		ModelAndView modelAndView = new ModelAndView("/demo/component/rar");
		modelAndView.addObject("treeNodeName", treeNodeName);
		return modelAndView;
	}

	@RequestMapping("mail")
	public ModelAndView mail(String treeNodeName) {
		ModelAndView modelAndView = new ModelAndView("/demo/component/mail");
		modelAndView.addObject("treeNodeName", treeNodeName);
		return modelAndView;
	}

	@RequestMapping("ip")
	public ModelAndView ip(String treeNodeName) {
		ModelAndView modelAndView = new ModelAndView("/demo/component/ip");
		modelAndView.addObject("treeNodeName", treeNodeName);
		return modelAndView;
	}

	@RequestMapping("image")
	public ModelAndView image(String treeNodeName) {
		ModelAndView modelAndView = new ModelAndView("/demo/component/image");
		modelAndView.addObject("treeNodeName", treeNodeName);
		return modelAndView;
	}

	@RequestMapping("md5")
	public ModelAndView md5(String treeNodeName) {
		ModelAndView modelAndView = new ModelAndView("/demo/component/md5");
		modelAndView.addObject("treeNodeName", treeNodeName);
		return modelAndView;
	}

	@RequestMapping("validation")
	public ModelAndView validation(String treeNodeName) {
		ModelAndView modelAndView = new ModelAndView("/demo/component/validation");
		modelAndView.addObject("treeNodeName", treeNodeName);
		return modelAndView;
	}
	
	@RequestMapping("direct/{page}")
	public ModelAndView direct(@PathVariable String page, String treeNodeName) {
		ModelAndView modelAndView = new ModelAndView("/demo/component/" + page);
		modelAndView.addObject("treeNodeName", treeNodeName);
		return modelAndView;
	}
}
