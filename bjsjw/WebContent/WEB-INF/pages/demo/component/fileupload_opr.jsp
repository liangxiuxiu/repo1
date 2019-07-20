<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="h" uri="/hanweb-tags"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>单文件上传/下载</title>
<h:head pagetype="page" highlighter="true" validity="true" upload="true"></h:head>
<script type="text/javascript">
	$(function() {
		SyntaxHighlighter.config.clipboardSwf = '${contextPath}/ui/widgets/highlighter/scripts/clipboard.swf';
		SyntaxHighlighter.all();
		$('#oprform').validity(function() {
			$('#file').require('必须选择文件');
		}, {
			type : 'iframe'
		});
	});

	function result(filename, fileallname, filetype, filesize) {
		$('#filename').val(filename);
		$('#fileallname').val(fileallname);
		$('#filetype').val(filetype);
		$('#filesize').val(filesize);
	}

	function display(filePath, downloadPath) {
		$('#path').val(filePath);
		$('#download a').attr('href', downloadPath);
		$('#download').show();
	}
</script>
</head>
<body>
	<div id="page-title">
		开发指南 / <span id="page-location">${treeNodeName}</span>
	</div>
	<div id="page-content">
		<form id="oprform" method="post" enctype="multipart/form-data" action="${url }">
			<div id="page-content">
				<table border="0" class="table">
					<tr>
						<td class="label" style="width: 100px">附件</td>
						<td>
							<input id="file" type="file" class="input-text" name="file">
						</td>
					</tr>
					<tr>
						<td colspan="3">
							<input type="submit" class="btn btn-primary" value="上传" />
						</td>
					</tr>
					<tr>
						<td class="label" colspan="2" style="color: red">上传后信息</td>
					</tr>
					<tr>
						<td class="label" style="width: 50px">文件名</td>
						<td>
							<input id="filename" type="text" class="input-text">
						</td>
					</tr>
					<tr>
						<td class="label" style="width: 50px">文件全名</td>
						<td>
							<input id="fileallname" type="text" class="input-text">
						</td>
					</tr>
					<tr>
						<td class="label" style="width: 50px">文件类型</td>
						<td>
							<input id="filetype" type="text" class="input-text">
						</td>
					</tr>
					<tr>
						<td class="label" style="width: 50px">文件大小</td>
						<td>
							<input id="filesize" type="text" class="input-text">
							字节
						</td>
					</tr>
					<tr>
						<td class="label" style="width: 50px">文件所在位置</td>
						<td>
							<input id="path" type="text" class="input-text">
						</td>
					</tr>
					<tr>
						<td class="label" style="width: 50px">下载</td>
						<td>
							<div id="download" style="display: none">
								<a target="_blank" class="btn btn-success">下载文件</a>
							</div>
						</td>
					</tr>
					<tr>
						<td colspan="2">
							<h3>头</h3>
							<pre class='brush:html'>
							&lt;h:head upload="true"&gt;&lt;/h:head&gt;
						</pre>
							<h3>HTML</h3>
							<pre class='brush:html'>
							&lt;input id="file" type="file" class="input-text" name="file"&gt;
						</pre>
							<h3>JS</h3>
							<pre class='brush:js'>
							$('#oprform').validity(function(){
								$('#file').require('必须选择文件');
							},{type:'iframe'});// 注意这里使用的是隐藏的iframe来提交
						</pre>
							<h3>JAVA</h3>
							<pre class='brush:java'>
							// ===========================上传=========================
						
							// 这里的file就是上传的文件，不过不是直接可以用的file对象，并且file这个名字要与html的file空间的name对应
							public String submitFileUpload(MultipartFile file) {
								// 可以用MultipartFileInfo获取上传文件信息
								MultipartFileInfo info = MultipartFileInfo.getInstance(file);
								// 获得文件名称
								info.getFileName()
								// 获得文件全名
								info.getFileFullName()
								// 获得文件类型
								info.getFileType()
								// 获得文件大小（单位：字节）
								info.getSize()
								
								// 由于文件目前属于暂存状态，我们需要把文件拷贝到我们需要的位置
								// 使用ControllerUtil.writeMultipartFileToFile(目标位置,源文件)来拷贝
								ControllerUtil.writeMultipartFileToFile(desFile, file);
							}
							
							// ===========================下载=========================
							
							// 流的方式下载的controller方法返回值为FileResource类型
							public FileResource downloadFile(){
								// 使用ControllerUtil.getFileResource(需要下载的文件,下载显示的文件名)方法可以获得FileResource对象
								FileResource fileResource = ControllerUtil.getFileResource(desFile, oldName);
								// 最后renturn fileResource 完成下载
								return fileResource;
							}
						</pre>
						</td>
					</tr>
				</table>
			</div>
		</form>
	</div>
</body>
</html>