<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="h" uri="/hanweb-tags"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<title>这招</title>
<h:head pagetype="page" highlighter="true" loadmask="true"></h:head>
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
		<input type="button" class="btn" value="开启" onclick="$('#mask').mask('处理中，请稍后...');">
		&nbsp;&nbsp;&nbsp;
		<input type="button" class="btn" value="关闭" onclick="$('#mask').unmask();">
		<br><br>
		<div id="mask" style="width: 300px;height: 100px;background-color: gray;color: white">
			来遮住我啊
		</div>
		<h3>头</h3>
		<pre class='brush:html'>
			&lt;h:head loadmask="true"&gt;&lt;/h:head&gt;
		</pre>
		<h3>HTML</h3>
		<pre class='brush:js'>
			// 开启遮罩
			$('#需要遮住的html元素id').mask('提示信息');
			
			// 关闭遮罩
			$('#需要遮住的html元素id').unmask();
		</pre>
	</div>
</body>
</html>