<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="h" uri="/hanweb-tags"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<title>输出script工具</title>
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
			// 获得script实例
			Script script = Script.getInstance();//不带js库，用在ajax提交之后的返回
			
			Script script = Script.getInstanceWithJsLib();//带js库，用在iframe提交之后的返回
			
			// 增加alert的提示
			script.addAlert(str)
			
			// 增加js操作
			script.addScript(str)
			
			// 增加js操作
			// fun:js函数
			// obj...: js函数的参数
			// 例如   页面上的js函数为  show(title,content) ；script就为script.addScript("show",title,content)
			script.addScript(fun,obj...)
			
			// 清除遮罩
			script.removeLoadMask()
			
			// 关闭窗口并刷新来源页面
			script.closeDialogAndReload()
			
			// 关闭窗口
			script.closeDialog();
			
			// 刷新父页面
			script.reloadParent()
			
			// 刷新当前页面
			script.reload()
			
			// 获得script字符串
			script.getScript()
			
			// 还可以操作树，参看API
		</pre>
		<h3>注意</h3>
		<pre class='brush:js'>
			// script可以连续赋值
			// script.removeLoadMask().addAlert("操作成功").closeDialogAndReload();
		</pre>
	</div>
</body>
</html>