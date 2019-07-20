<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="h" uri="/hanweb-tags"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>开关</title>
<h:head pagetype="page" toggle="true" highlighter="true"></h:head>
<script type="text/javascript">
	$(function() {
		$('.toggle1').toggle();

		$('.toggle2').toggle({
			offValue : false,
			onValue : true
		});

		$('.toggle3').toggle({
			ajax : {
				url : '',
				success : function() {

				},
				error : function() {
					alert('这是个例子，不会异步请求！');
				}
			}
		});

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
		<h3>头</h3>
		<pre class='brush:html'>
			&lt;h:head toggle="true"&gt;&lt;/h:head&gt;
		</pre>

		<p>&nbsp;</p>
		<h3>HTML</h3>
		<pre class='brush:html'>
			<input id="toggledemo" type="hidden" value="0" />
		</pre>

		<p>&nbsp;</p>
		<div style="margin: 10px 0;">
			开关值为 0 / 1 （默认）：
			<input type="hidden" class="toggle1" value="0" />
			<input type="hidden" class="toggle1" value="1" />
		</div>

		<h3>JS</h3>
		<pre class='brush:js'>
			$(function() {
				$('#toggle1').toggle();
			});
		</pre>

		<p>&nbsp;</p>

		<div style="margin: 10px 0;">
			开关值为 自定义 （本例为 false / true）：
			<input type="hidden" class="toggle2" value="false" />
			<input type="hidden" class="toggle2" value="true" />
		</div>

		<h3>JS</h3>
		<pre class='brush:js'>
			$('#toggle2').toggle({
				offValue: false,
				onValue: true
			});
		</pre>

		<p>&nbsp;</p>

		<div style="margin: 10px 0;">
			异步开关：
			<input type="hidden" class="toggle3" value="0" />
			<input type="hidden" class="toggle3" value="1" />
		</div>

		<h3>JS</h3>
		<pre class='brush:js'>
			$('#toggle3').toggle({
				ajax: {
					url: '...',
					success: function() {
						...
					},
					error: function() {
						...
					}
				}
			});
		</pre>
	</div>
</body>
</html>