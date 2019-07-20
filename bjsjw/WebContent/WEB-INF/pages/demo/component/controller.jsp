<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="h" uri="/hanweb-tags"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<title>Controller工具</title>
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
		<h4>这里只列出了常用的，具体参看API</h4>
		<pre class='brush:java'>
			// 获得所给路径的 应用绝对路径   也就是加上应用名称
			ControllerUtil.getAbsolutePath(String path);
			
			// 获得下载的文件
			// file：要下载的文件
			// fileName：要显示的下载文件名称
			FileResource fileResource = ControllerUtil.getFileResource(file, fileName);
			
			// 将上传的暂存文件写入到目标文件
			// file：目标文件
			// multipartFile：上传文件的暂存文件
			ControllerUtil.writeMultipartFileToFile(file, multipartFile);
			
			// 获取cookie值
			ControllerUtil.getCookieValue(request,key);
			
			// 写cookie
			// response:response
			// key:cookie的key
			// value:cookie的值
			// seconds:cookie的有效期，单位为秒
			ControllerUtil.addCookie(response,key,value,seconds);
			
			// 删除cookie
			ControllerUtil.removeCookie(response,request,key);
			
			// 获得ip地址
			ControllerUtil.getIp(request)
		</pre>
	</div>
</body>
</html>