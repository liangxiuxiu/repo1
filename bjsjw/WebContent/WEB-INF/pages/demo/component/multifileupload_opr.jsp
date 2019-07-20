<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="h" uri="/WEB-INF/tag/hanweb-tags.tld"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>多文件上传</title>
<h:head pagetype="page" multifileupload="true"></h:head>
<script>
	$(function() {
		$('.upload_btn').multifileupload({
			dialogUrl : '${uploadUrl}',
			filters : [ {
				title : '图片文件（jpg,gif,png）',
				extensions : 'jpg,gif,png'
			}, {
				title : '压缩包（zip）',
				extensions : 'zip'
			} ]
		});
	});

	function save() {
		var files = $('.upload_btn').multifileupload('getFiles');
		var filesJson = JSON.stringify(files);
		alert('<div style="word-break:break-all;">' + filesJson + '</div>');
	}
</script>
</head>
<body>
	<div id="page-title">
		开发指南 / <span id="page-location">${treeNodeName}</span>
	</div>
	<div id="page-content">
		<form action="${formurl}" method="post" id="oprform" name="oprform">
			<table border="0" align="center" class="table">
				<tr>
					<td align="right" class="label">文件标题</td>
					<td class="required">*</td>
					<td>
						<input type="text" id="name" name="name" class="input-text" />
					</td>
				</tr>
				<tr>
					<td align="right" class="label">附件</td>
					<td class="required">*</td>
					<td>
						<a type="button" class="btn btn-success upload_btn">
							<i class="iconfont" style="font-size: 14px;">&#xf002d;</i>添加文件
						</a>
						<ul class="upload-filelist"></ul>
					</td>
				</tr>
				<tr>
					<td height="60" colspan="4" align="center">
						<input type="button" class="btn btn-primary" value="保存" onclick="save();" style="margin-right: 10px;" />
						<input type="button" class="btn" value="返回" onclick="history.go(-1);" />
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>