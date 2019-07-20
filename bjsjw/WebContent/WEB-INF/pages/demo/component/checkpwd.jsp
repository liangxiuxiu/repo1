<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="h" uri="/hanweb-tags"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>密码强度</title>
<h:head pagetype="page" highlighter="true" ipass="true" checkpwd="true" ></h:head>
<script type="text/javascript">
	$(function() {
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
		<table border="0" class="table">
			<tr>
				<td align="right" class="label">密码</td>
				<td class="required">*</td>
				<td>
					<input type="password" id="pwd" name="pwd" maxlength="33" class="input-text" pwdpower="pwdpower"/>
				</td>
			</tr>
			<tr>
				<td align="right" class="label">密码强度</td>
				<td class="required"></td>
				<td>
					<ul id="pwdpower">
						<li class="pweak"></li>
						<li class="pmedium"></li>
						<li class="pstrong"></li>
					</ul>
				</td>
			</tr>
		</table>
		<h3>头</h3>
		<pre class='brush:html'>
			&lt;h:head checkpwd="true" ipass="true"&gt;&lt;/h:head&gt;
		</pre>
		<h3>HTML</h3>
			<pre class='brush:html'>
			<!-- 其中 pwdpower 指定的是密码强度指示器的id-->
			<input type="password" id="pwd" name="pwd" maxlength="33" class="input-text" pwdpower="pwdpower"/>
			
			<!-- 定义强度显示器  table的id必须为pwdpower-->
			&lt;ul id="pwdpower"&gt;
				&lt;li class="pweak"&gt;&lt;/li&gt;
				&lt;li class="pmedium"&gt;&lt;/li&gt;
				&lt;li class="pstrong"&gt;&lt;/li&gt;
			&lt;/ul&gt;
		</pre>
	</div>
</body>
</html>