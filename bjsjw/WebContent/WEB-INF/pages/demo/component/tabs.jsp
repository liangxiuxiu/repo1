<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="h" uri="/hanweb-tags"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<title>选项卡</title>
<h:head pagetype="page" highlighter="true" tabs="true"></h:head>
<script type="text/javascript">
	$(function(){
		SyntaxHighlighter.config.clipboardSwf = '${contextPath}/ui/widgets/highlighter/scripts/clipboard.swf';
		SyntaxHighlighter.all();
		$('#tabs').tabs('disableTab','禁用');
	});
</script>
</head>
<body>
	<div id="page-title">
		开发指南 / <span id="page-location">${treeNodeName}</span>
	</div>
	<div id="page-content">
		<div id="tabs" class="easyui-tabs" style="height: 200px">  
		    <div title="基本设置" style="padding:20px;">
		    	我是tab1
		    </div>  
		    <div title="高级设置" style="padding:20px;">
		    	我是tab2  
		    </div>  
		    <div title="配置项" style="padding:20px;" data-options="closable:true">
		    	我是tab3  
		    </div>
		    <div title="禁用" style="padding:20px;">
		    	禁用
		    </div>
		</div>  
		<h3>头</h3>
		<pre class='brush:html'>
			&lt;h:head tabs="true"&gt;&lt;/h:head&gt;
		</pre>
		<h3>HTML</h3>
		<pre class='brush:html'>
			<!-- class为easyui-tabs -->
			&lt;div id="tabs" class="easyui-tabs" style="height: 200px"&gt;  
			    &lt;div title="基本设置" style="padding:20px;"&gt;
			    	我是tab1
			    &lt;/div&gt;  
			    &lt;div title="高级设置" style="padding:20px;"&gt;
			    	我是tab2  
			    &lt;/div&gt;  
			    <!-- 可关闭的使用 closable:true-->
			    &lt;div title="配置项" style="padding:20px;" data-options="closable:true"&gt;
			    	我是tab3  
			    &lt;/div&gt;  
			&lt;/div&gt;  
		</pre>
		<h3>JS</h3>
		<pre class='brush:js'>
			// 获得tabs
			$('#tabs的id').tabs();
			
			// 禁用
			$('#tabs的id').tabs('disableTab','tab的title');
			
			// 启用
			$('#tabs的id').tabs('enableTab','tab的title');
			
			// 选中
			$('#tabs的id').tabs('select','tab的title');
			
			// 关闭
			$('#tabs的id').tabs('close','tab的title');
		</pre>
	</div>
</body>
</html>