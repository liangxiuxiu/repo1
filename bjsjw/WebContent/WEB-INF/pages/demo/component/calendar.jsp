<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="h" uri="/hanweb-tags"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<title>日历</title>
<h:head pagetype="page" calendar="true" highlighter="true"></h:head>
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
		当前日期：<input type="text" name="createDate" value="${currentDate }" class="jcalendar input-text" onclick="WdatePicker({dateFmt:'yyyy-MM-dd'});" readonly="readonly"/>
		<h3>头</h3>
		<pre class='brush:html'>
			&lt;h:head calendar="true"&gt;&lt;/h:head&gt;
		</pre>
		<h3>HTML</h3>
		<pre class='brush:html'>
			<!-- class一定要有jcalendar ，onclick调用的函数参考 My97DatePicker的API-->
			<input type="text" name="createDate" value="\${currentDate }" class="jcalendar input-text" onclick="WdatePicker({dateFmt:'yyyy-MM-dd'});" readonly="readonly"/>
		</pre>
		<h3>技巧</h3>
		<pre class='brush:html'>
			<!-- 通过JSTL表达式获得日志值可以使用JSTL的format来格式化，当然也可以在java中格式化好在输出-->
			
			<!-- 首先需要加入 format的tag-->
			&lt;%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%&gt;
			
			<!-- 将未格式化的日期输出到 fmt 标签中，var指定格式化之后的变量名称，这个变量可以使用jstl语法输出，pattern指定格式-->
			&lt;fmt:formatDate value="\${currentDate}" var="fmt_currentDate" pattern="yyyy-MM-dd"/&gt;
			
			<!-- 将var的变量放入需要输出的位置就可以了-->
			<input type="text" value="\${fmt_currentDate }"/>
		</pre>
	</div>
</body>
</html>