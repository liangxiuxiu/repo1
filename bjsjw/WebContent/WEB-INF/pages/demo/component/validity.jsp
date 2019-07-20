<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="h" uri="/hanweb-tags"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>脚本验证</title>
<h:head pagetype="page" highlighter="true" checkpwd="true" validity="true" tip="true"></h:head>
<script type="text/javascript">
	$(function() {
		SyntaxHighlighter.config.clipboardSwf = '${contextPath}/ui/widgets/highlighter/scripts/clipboard.swf';
		SyntaxHighlighter.all();
		$('#oprform').validity(function() {
			$('#name1').require('姓名必须填写');
			$('#name2').require('数字范围必须填写').range(1, 20, '必须大于1小于20');
			$('#name3').require('数字大于必须填写').greaterThan(10, '必须大于10');
			$('#name4').require('数字小于必须填写').lessThan(10, '必须小于10');
			$('#name5').require('字符长度大于必须填写').minLength(10, '必须大于10个字符');
			$('#name6').require('字符长度小于必须填写').maxLength(10, '必须小于10个字符');
			$('#name7').require('自定义必须填写').assert(function() {
				var val = $('#name7').val();
				if (val == 'hanweb') {
					return true;
				} else {
					return false;
				}
			}, '必须输入hanweb');
			$('#name8').require('输入邮件必须填写').match('email', '输入电子邮件');
			$('#name9').require('只限中文必须填写').match('chinese', '只能输入中文');

			$('#name10').require('组合型必须填写').match('username', '只能输入数字、26个英文字母或者下划线').minLength(6, '必须大于6个字符').maxLength(20, '必须小于20个字符').assert(function() {
				var val = $('#name10').val();
				if (val.indexOf('hanweb') == 0) {
					return true;
				} else {
					return false;
				}
			}, '必须以hanweb开头');
			$('#name11').require('必填').match('decmal4', 'sssssss');
		});
	});
</script>
</head>
<body>
	<div id="page-title">
		开发指南 / <span id="page-location">${treeNodeName}</span>
	</div>
	<div id="page-content">
		<form action="validity.do" id="oprform">
			<div id="page-content">
				<table border="0" class="table">
					<tr>
						<td align="right" class="label">姓名</td>
						<td class="required">*</td>
						<td>
							<input type="text" id="name1" class="input-text" maxlength="33" />
						</td>
					</tr>
					<tr>
						<td align="right" class="label">数字范围</td>
						<td class="required">*</td>
						<td>
							<input type="text" id="name2" class="input-text" maxlength="33" />
						</td>
					</tr>
					<tr>
						<td align="right" class="label">数字大于</td>
						<td class="required">*</td>
						<td>
							<input type="text" id="name3" class="input-text" maxlength="33" />
						</td>
					</tr>
					<tr>
						<td align="right" class="label">数字小于</td>
						<td class="required">*</td>
						<td>
							<input type="text" id="name4" class="input-text" maxlength="33" />
						</td>
					</tr>
					<tr>
						<td align="right" class="label">字符长度大于</td>
						<td class="required">*</td>
						<td>
							<input type="text" id="name5" class="input-text" maxlength="33" />
						</td>
					</tr>
					<tr>
						<td align="right" class="label">字符长度小于</td>
						<td class="required">*</td>
						<td>
							<input type="text" id="name6" class="input-text" maxlength="33" />
						</td>
					</tr>
					<tr>
						<td align="right" class="label">自定义</td>
						<td class="required">*</td>
						<td>
							<input type="text" id="name7" class="input-text" maxlength="33" />
						</td>
					</tr>
					<tr>
						<td align="right" class="label">输入邮件</td>
						<td class="required">*</td>
						<td>
							<input type="text" id="name8" class="input-text" maxlength="33" />
						</td>
					</tr>
					<tr>
						<td align="right" class="label">只限中文</td>
						<td class="required">*</td>
						<td>
							<input type="text" id="name9" class="input-text" maxlength="33" />
						</td>
					</tr>
					<tr>
						<td align="right" class="label">
							<h:tip title="不能为空、长度大于6小于20、必须以hanweb开头、数字、26个英文字母或者下划线组成"></h:tip>
							组合型
						</td>
						<td class="required">*</td>
						<td>
							<input type="text" id="name10" class="input-text" maxlength="33" />
						</td>
					</tr>
					<tr>
						<td align="right" class="label">
							<h:tip title="不能为空、长度大于6小于20、必须以hanweb开头、数字、26个英文字母或者下划线组成"></h:tip>
							组合型
						</td>
						<td class="required">*</td>
						<td>
							<input type="text" id="name11" class="input-text" maxlength="33" />
						</td>
					</tr>
					<tr>
						<td></td>
						<td></td>
						<td>
							<input type="submit" class="btn btn-primary" value="保存" />
							<input type="reset" class="btn" value="重置" />
						</td>
					</tr>
					<tr>
						<td colspan="3">
							<div style="padding: 5px">
								<h3>头</h3>
								<pre class='brush:html'>
							&lt;h:head validity="true"&gt;&lt;/h:head&gt;
						</pre>
								<h3>HTML</h3>
								<pre class='brush:html'>
							<!-- form表单一定要有一个id -->
							&lt;form action="validity.do" id="oprform"&gt;
								<!-- 每个表单中的form元素需要有id -->
								&lt;input type="text" id="name10" class="input-text" maxlength="33"/&gt;
							&lt;/form&gt;
						</pre>
								<h3>JS</h3>
								<pre class='brush:js'>
							// 在页面加载完毕后要将form表单绑定到validity控件
							$('#form的id').validity(function(){
								// 为表单中每个form的元素做验证
								$('#需要验证的form元素id').require('必须填写');
							})
						</pre>
								<h3>注意</h3>
								<pre class='brush:js'>
							// 使用验证控件的form自动使用ajax提交
							// 验证可以match方法来匹配正则
							// 如果是文件上传，ajax提交就不是很好了，这时需要提交到隐藏的iframe，这个可以通过验证控件的options来切换
							$('#mainForm').validity(
								function(){
									..............
								}
							,{type:'iframe'});// 这样写之后就会自动使用隐藏的iframe提交
						</pre>
							</div>
						</td>
					</tr>
				</table>
			</div>
		</form>
	</div>
</body>
</html>