<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="h" uri="/hanweb-tags"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<title>验证码</title>
<h:head pagetype="page" highlighter="true" codeedit="true"></h:head>
<h:import type="js" path="/ui/script/ui.js"></h:import>
<script type="text/javascript">
	$(function(){
		SyntaxHighlighter.config.clipboardSwf = '${contextPath}/ui/widgets/highlighter/scripts/clipboard.swf';
		SyntaxHighlighter.all();
	});
</script>
<style>
.CodeMirror{
	border: 1px solid #DDDDDD
}
</style>
</head>
<body>
	<div id="page-title">
		开发指南 / <span id="page-location">${treeNodeName}</span>
	</div>
	<div id="page-content">
		<h3>头</h3>
		<pre class='brush:html'>
			&lt;h:head codeedit="true"&gt;&lt;/h:head&gt;
		</pre>
		<h3>HTML</h3>
		<pre class='brush:html'>
			<!-- class一定要有codeedit-->
			&lt;textarea style="width: 600px;height: 300px" class="codeedit"&gt;&lt;/textarea&gt;
		</pre>
		<h3>例子</h3>
		<textarea style="height: 300px;" class="codeedit">
			&lt;table border=&quot;0&quot; class=&quot;table&quot; style=&quot;text-align: left;&quot;&gt;
		&lt;tr&gt;
			&lt;td align=&quot;right&quot; class=&quot;label&quot;&gt;用户id：&lt;/td&gt;
			&lt;td&gt;
				&lt;input type=&quot;text&quot; id=&quot;iid&quot; name=&quot;iid&quot; maxlength=&quot;33&quot; class=&quot;input-text&quot;/&gt;
			&lt;/td&gt;
			&lt;td align=&quot;right&quot; class=&quot;label&quot;&gt;登录名：&lt;/td&gt;
			&lt;td&gt;
				&lt;input type=&quot;text&quot; name=&quot;loginName&quot; id=&quot;loginName&quot; class=&quot;input-text&quot; placeholder=&quot;登录名&quot; validity-error=&quot;loginname-error&quot;/&gt;
				&lt;span id=&quot;loginname-error&quot; class=&quot;validity-error&quot;&gt;&lt;/span&gt;
			&lt;/td&gt;
		&lt;/tr&gt;
		&lt;tr&gt;
			&lt;td align=&quot;right&quot; class=&quot;label&quot;&gt;姓名：&lt;/td&gt;
			&lt;td&gt;&lt;input type=&quot;text&quot; id=&quot;name&quot; name=&quot;name&quot; maxlength=&quot;33&quot; class=&quot;input-text&quot;/&gt;&lt;/td&gt;
			&lt;td align=&quot;right&quot; class=&quot;label&quot;&gt;性别：&lt;/td&gt;
			&lt;td&gt;
				&lt;label&gt;男：&lt;input name=&quot;sex&quot; type=&quot;radio&quot; value=&quot;&quot; checked=&quot;checked&quot;&gt;&lt;/label&gt;
				&lt;label&gt;女：&lt;input name=&quot;sex&quot; type=&quot;radio&quot; value=&quot;&quot;&gt;&lt;/label&gt;
			&lt;/td&gt;
		&lt;/tr&gt;
		&lt;tr&gt;
			&lt;td align=&quot;right&quot; class=&quot;label&quot;&gt;密码：&lt;/td&gt;
			&lt;td&gt;
				&lt;input type=&quot;password&quot; id=&quot;password&quot; name=&quot;password&quot; maxlength=&quot;33&quot; class=&quot;input-text&quot; pwdpower=&quot;pwdpower&quot;/&gt;
				&lt;ul id=&quot;pwdpower&quot;&gt;
					&lt;li class=&quot;pweak&quot;&gt;&lt;/li&gt;
					&lt;li class=&quot;pmedium&quot;&gt;&lt;/li&gt;
					&lt;li class=&quot;pstrong&quot;&gt;&lt;/li&gt;
				&lt;/ul&gt;
			&lt;/td&gt;
			&lt;td align=&quot;right&quot; class=&quot;label&quot;&gt;重复密码：&lt;/td&gt;
			&lt;td&gt;
				&lt;input type=&quot;password&quot; name=&quot;repassword&quot; id=&quot;repassword&quot; class=&quot;input-text&quot;/&gt;
			&lt;/td&gt;
		&lt;/tr&gt;
		&lt;tr&gt;
			&lt;td align=&quot;right&quot; class=&quot;label&quot;&gt;证件类型：&lt;/td&gt;
			&lt;td&gt;
				&lt;select id=&quot;cert-type&quot; style=&quot;font-size: 14px&quot;&gt;
					&lt;option value=&quot;1&quot;&gt;身份证&lt;/option&gt;
					&lt;option value=&quot;2&quot;&gt;军官证&lt;/option&gt;
					&lt;option value=&quot;3&quot;&gt;学生证&lt;/option&gt;
					&lt;option value=&quot;4&quot;&gt;房产证&lt;/option&gt;
				&lt;/select&gt;
			&lt;/td&gt;
			&lt;td align=&quot;right&quot; class=&quot;label&quot;&gt;证件编号：&lt;/td&gt;
			&lt;td&gt;
				&lt;input type=&quot;text&quot; name=&quot;cert-no&quot; id=&quot;cert-no&quot; class=&quot;input-text&quot; placeholder=&quot;证件编号&quot;/&gt;
			&lt;/td&gt;
		&lt;/tr&gt;
		&lt;tr&gt;
			&lt;td align=&quot;right&quot; class=&quot;label&quot;&gt;自我介绍：&lt;/td&gt;
			&lt;td colspan=&quot;3&quot;&gt;
				&lt;textarea class=&quot;input-textarea&quot; name=&quot;desc&quot; id=&quot;desc&quot; style=&quot;width: 715px&quot; placeholder=&quot;自我介绍&quot;&gt;&lt;/textarea&gt;
			&lt;/td&gt;
		&lt;/tr&gt;
		&lt;tr&gt;
			&lt;td colspan=&quot;4&quot; style=&quot;text-align: center;&quot;&gt;
				&lt;input type=&quot;submit&quot; class=&quot;btn btn-primary&quot; value=&quot;提 交&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;
				&lt;input type=&quot;button&quot; class=&quot;btn&quot; value=&quot;重 置&quot;&gt;
			&lt;/td&gt;
		&lt;/tr&gt;
	&lt;/table&gt;
		</textarea>
	</div>
</body>
</html>