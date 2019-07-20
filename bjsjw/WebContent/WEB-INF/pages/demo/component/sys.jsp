<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="h" uri="/hanweb-tags"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<title>系统变量</title>
<h:head pagetype="page" highlighter="true"></h:head>
<h:import type="js" path="/ui/script/ui.js"></h:import>
<script type="text/javascript">
	$(function(){
		SyntaxHighlighter.config.clipboardSwf = '${contextPath}/ui/widgets/highlighter/scripts/clipboard.swf';
		SyntaxHighlighter.all();
	});
</script>
</head>
<body>
	<div id="page-title">
		开发指南 / <span id="page-location">${treeNodeName}</span>
	</div>
	<div id="page-content">
		<h3>BaseInfo</h3>
		<pre class='brush:java'>
			// 获得应用路径
			BaseInfo.getContextPath();
			
			// 获得绝对路径
			BaseInfo.getRealPath();
			
			// 系统是否已经准备好（已注册和已初始化）
			BaseInfo.isPrepared();
			
			// 获得jsp目录
			BaseInfo.getPagesPath();
		</pre>
		
		<h3>Settings</h3>
		<pre class='brush:java'>
			// 获得平台设置项
			Settings settings = Settings.getSettings();
			
			// 是否开启验证码
			settings.isEnableVerifyCode();
			
			// 获得文件上传暂存目录
			settings.getFileTmp();
			
			// 获得高级编辑器图片上传目录
			BaseInfo.getImageDir();
			
			// 获得高级编辑器附件上传目录
			BaseInfo.getAttachmentDir();
		</pre>
	</div>
</body>
</html>