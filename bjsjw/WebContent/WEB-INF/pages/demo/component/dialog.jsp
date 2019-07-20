<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="h" uri="/hanweb-tags"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<title>弹出窗口</title>
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
		<div style="margin-bottom: 15px;">
			<input type="button" class="btn btn-primary" value="弹出" onclick="openDialog('demo/component/checkpwd.do',600,400)">
		</div>
		<div style="margin-bottom: 15px;">
			<input type="button" class="btn btn-primary" value="带标题弹出" onclick="openDialog('demo/component/checkpwd.do',600,400,{title:'我是标题'})">
		</div>
		<div style="margin-bottom: 15px;">
			<input type="button" class="btn btn-primary" value="带各种功能" onclick="openDialog('demo/component/checkpwd.do',600,400,{title:'我是标题',collapsible:true,minimizable:true,maximizable:true,resizable:true})">
		</div>
		<h3>JS</h3>
		<pre class='brush:js'>
			// JS事件为openDialog(url,width,height,option)；option为设置项为json数据，比如标题为{title:'xxxx'}
			// option常用设置为：title:标题、collapsible：是否可折叠、minimizable：是否可最小化、maximizable：是否可最大化、resizable：是否可以改变大小
			openDialog('demo/component/checkpwd.do',600,400,{title:'我是标题',collapsible:true,minimizable:true,maximizable:true,resizable:true})
			
			// 以下方法都是在弹出的面中调用
			// 关闭dialog，
			closeDialog();
			// 关闭dialog并刷父页面
			closeDialog(true);
			// 获得父页面的window对象
			getParentWindow();
			// 刷新父页面
			refreshParentWindow();
		</pre>
		<h3>注意</h3>
		<pre class='brush:js'>
			// 在后台manager，由于dialog是从顶层框架弹出来的，所以dialog所在的页面是 "/应用名称/manager/index.do"
			// 我们在openDialog时给的地址都是相对 "/应用名称/manager/" 这个地址来的
		</pre>
	</div>
</body>
</html>