<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="h" uri="/hanweb-tags"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<title>弹出消息</title>
<h:head pagetype="page" highlighter="true"></h:head>
<h:import type="js" path="/ui/script/ui.js"></h:import>
<script type="text/javascript">
	$(function(){
		SyntaxHighlighter.config.clipboardSwf = '${contextPath}/ui/widgets/highlighter/scripts/clipboard.swf';
		SyntaxHighlighter.all();
	});
	function showAlert(){
		alert();
	}
</script>
</head>
<body>
	<div id="page-title">
		开发指南 / <span id="page-location">${treeNodeName}</span>
	</div>
	<div id="page-content">
		<input type="button" class="btn" value="alert" onclick="alert('alert');">
		<br><br>
		<input type="button" class="btn" value="error" onclick="alert('error','error');">
		<br><br>
		<input type="button" class="btn" value="info" onclick="alert('info','info');">
		<br><br>
		<input type="button" class="btn" value="question" onclick="alert('question','question');">
		<br><br>
		<input type="button" class="btn" value="warning" onclick="alert('warning','warning');">
		<br><br>
		<input type="button" class="btn" value="alert点击确定之后回调" onclick="alert('alert','',function(){alert('我回调了');});">
		<br><br>
		<input type="button" class="btn" value="confirm" onclick="confirm('点是还是否呢？',function(){alert('点了是');},function(){alert('点了否');})">
		<h3>JS</h3>
		<pre class='brush:js'>
			// msg：提示信息
			// type：提示类型 ,可以没有, error、info、question、warning
			// fu: 点击确定之后的回调函数，可以没有
			alert(msg,type,fu)
			
			// msg：提示信息
			// okCall：点击确定的回调函数，可以没有
			// cancelCall：点击取消的回调函数，可以没有
			confirm(msg,okCall,cancelCall)
		</pre>
	</div>
</body>
</html>