<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="h" uri="/hanweb-tags"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Insert title here</title>
<h:head highlighter="true" pagetype="page"></h:head>
<script type="text/javascript">
	$(function() {
		SyntaxHighlighter.config.clipboardSwf = '${contextPath}/ui/widgets/highlighter/scripts/clipboard.swf';
		SyntaxHighlighter.all();
	});
</script>
</head>
<body>
<body>
	<div id="page-title">
		开发指南 / <span id="page-location">${treeNodeName}</span>
	</div>
	<div id="page-content">
		<!--表单主体-->
		<form action="${url}" method="post" id="oprform" name="oprform">
			<!--隐藏变量区-->
			<!--<input type="hidden" name="pid" id="pid" value="${group.pid}" /> -->
			<table border="0" align="center" class="table">
				<tr>
					<td align="right" class="label">机构名称</td>
					<td class="required">*</td>
					<td>
						<input type="text" id="name" name="name" maxlength="33" class="input-text" value="" />
					</td>
				</tr>
				<tr>
					<td align="right" class="label">机构简介</td>
					<td class="required"></td>
					<td>
						<textarea class="input-textarea"></textarea>
					</td>
				</tr>
				<!--表单按钮区-->
				<tr>
					<td height="60" colspan="4" align="center">
						<input type="submit" class="btn btn-primary" value="保存" />
						<input type="button" class="btn" value="返回" onclick="history.go(-1);" />
						<input type="button" class="btn btn-success" value="弹出OPR" onclick="openDialog('demo/component/dialogopr.do',600,500)" />
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
<div style="padding: 15px">
	<h2>普通OPR页面</h2>
	<h3>头</h3>
	<pre class='brush:html'>
		&lt;h:head pagetype="page"&gt;&lt;/h:head&gt;
	</pre>
	<h3>HTML模板</h3>
	<pre class='brush:html'>
		<!-- channel表示顶层菜单的选中状态 -->
		&lt;body channel="develop"&gt;
			&lt;div id="page-title"&gt;
				&lt;!--模块名称 --&gt; / &lt;!--子名称（可以没有） --&gt;
			&lt;/div&gt;
			&lt;div id="page-content"&gt;
		    	&lt;!--表单主体--&gt;
				&lt;form action="${url}" method="post" id="oprform" name="oprform"&gt;
		        	&lt;!--隐藏变量区--&gt;
					&lt;!--&lt;input type="hidden" name="pid" id="pid" value="${group.pid}" /&gt; --&gt;
					&lt;table border="0" align="center" class="table"&gt;
						&lt;!--每行--&gt;
						&lt;tr&gt;
							&lt;td align="right" class="label"&gt;机构名称&lt;/td&gt;
							&lt;td class="required"&gt;*&lt;/td&gt;
							&lt;td&gt;&lt;input type="text" id="name" name="name" maxlength="33"
								class="input-text" value="${group.name }" /&gt;&lt;/td&gt;
						&lt;/tr&gt;
		                &lt;!--表单按钮区--&gt;
						&lt;tr&gt;
							&lt;td height="60" colspan="4" align="center"&gt;
								&lt;input type="submit" class="btn btn-primary" value="保存"/&gt;
								&lt;input type="button" class="btn" value="返回" onclick="history.go(-1);" /&gt;
							&lt;/td&gt;
						&lt;/tr&gt;
					&lt;/table&gt;
				&lt;/form&gt;
			&lt;/div&gt;
		&lt;/body&gt;
	</pre>

	<h2>弹出OPR页面</h2>
	<h3>头</h3>
	<pre class='brush:html'>
		&lt;h:head pagetype="dialog"&gt;&lt;/h:head&gt;
	</pre>
	<h3>HTML模板</h3>
	<pre class='brush:html'>
		&lt;form action="${url }" method="post" id="oprform"&gt;
		   	&lt;!--隐藏变量区--&gt;
			&lt;!--&lt;input type="hidden" name="pid" id="pid" value="${group.pid}" /&gt; --&gt;
			&lt;div id="dialog-content"&gt;
		       	&lt;!--表单主体--&gt;
				&lt;table border="0" align="center" class="table"&gt;
		            &lt;!--每行--&gt;
					&lt;tr&gt;
						&lt;td align="right" class="label"&gt;机构名称&lt;/td&gt;
						&lt;td class="required"&gt;*&lt;/td&gt;
						&lt;td&gt;&lt;input type="text" id="name" name="name" maxlength="33"
							class="input-text" value="" /&gt;
						&lt;/td&gt;
					&lt;/tr&gt;
					&lt;tr&gt;
						&lt;td align="right" class="label"&gt;机构简介&lt;/td&gt;
						&lt;td class="required"&gt;&lt;/td&gt;
						&lt;td&gt;
							&lt;textarea class="input-textarea"&gt;&lt;/textarea&gt;
						&lt;/td&gt;
					&lt;/tr&gt;
				&lt;/table&gt;
			&lt;/div&gt;
		    &lt;!--表单按钮区--&gt;
			&lt;div id="dialog-toolbar"&gt;
				&lt;div id="dialog-toolbar-panel"&gt;
					&lt;input type="submit" class="btn btn-primary" value="保存" /&gt; &lt;input
						type="button" class="btn" value="取消" onclick="closeDialog();" /&gt;
				&lt;/div&gt;
			&lt;/div&gt;
		&lt;/form&gt;
	</pre>
</div>
</body>
</html>