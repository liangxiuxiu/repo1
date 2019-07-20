<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="h" uri="/hanweb-tags"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<title>Insert title here</title>
<h:head pagetype="page" highlighter="true" iconfont="true"></h:head>
<h:import type="js" path="/ui/script/ui.js"></h:import>
<script type="text/javascript">
	$(function(){
		SyntaxHighlighter.config.clipboardSwf = '${contextPath}/ui/widgets/highlighter/scripts/clipboard.swf';
		SyntaxHighlighter.all();
	});
</script>
<style>
label {
	margin-right: 10px;
}
</style>
</head>
<body>
	<div id="page-title">
		开发指南 / <span id="page-location">${treeNodeName}</span>
	</div>
	<div id="page-content">
		<label>普通按钮</label><input type="button" class="btn" value="btn">
		<br><br>
		<label>小号按钮</label><input type="button" class="btn btn-small" value="btn-small">
		<br><br>
		<label>主要按钮</label><input type="button" class="btn btn-primary" value="btn-primary">
		<br><br>
		<label>成功按钮</label><input type="button" class="btn btn-success" value="btn-success">
		<br><br>
		<label>失效按钮</label><input type="button" class="btn" value="disabled" disabled>
		<br/><br/>
		<label>图标按钮</label><div class="btn"><i class="iconfont">&#xf507a;</i>图标按钮</div>
		<div style="padding: 5px">
			<h3>HTML</h3>
			<pre class='brush:html'>
				<!-- 按钮的主要样式为btn -->
				&lt;input type="button" class="btn" value="btn" /&gt;
				
				<!-- 大小控制样式为btn-small -->
				&lt;input type="button" class="btn btn-small" value="btn-small" /&gt;
				
				<!-- 类型控制样式为btn-primary 、btn-success -->
				&lt;input type="button" class="btn btn-primary" value="btn-primary" /&gt;
				
				<!-- 失效为属性disabled -->
				&lt;input type="button" class="btn" value="disabled" disabled /&gt;
				
				<!-- 图标按钮 -->
				&lt;div class="btn"&gt;&lt;i class="iconfont"&gt;&amp;#xf507a;&lt;/i&gt;图标按钮&lt;/div&gt;
			</pre>
			<h3>注意</h3>
			<pre class='brush:js'>
				// btn-primary 通常都用在submit按钮上
				// 样式可以嵌套：class="btn 大小 类型" 
			</pre>
		</div>
	</div>
</body>
</html>