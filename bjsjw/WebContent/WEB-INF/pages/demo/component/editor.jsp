<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="h" uri="/WEB-INF/tag/hanweb-tags.tld"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>在线编辑器</title>
<h:head pagetype="page" editor="true"></h:head>
</head>
<body>
	<div id="page-title">
		开发指南 / <span id="page-location">${treeNodeName}</span>
	</div>
	<div id="page-content">
		<form name="oprform" id="oprform" action="save.do">
			<script type="text/plain" id="editor">
				好像不错哦！
			</script>
			<script>
				var options = {
					elementPathEnabled : false, //元素路径
					wordCount : false,//字数统计
					initialFrameHeight : 350,

					toolbars : [ [ 'source', '|', 'undo', 'redo', '|', 'bold', 'italic', 'underline', 'fontborder', 'strikethrough', 'superscript', 'subscript', 'removeformat', 'formatmatch', 'autotypeset', 'blockquote', 'pasteplain', '|', 'forecolor', 'backcolor', 'insertorderedlist', 'insertunorderedlist', 'selectall', 'cleardoc', '|', 'rowspacingtop', 'rowspacingbottom', 'lineheight', '|', 'customstyle', 'paragraph', 'fontfamily', 'fontsize', '|', 'directionalityltr', 'directionalityrtl', 'indent', '|', 'justifyleft', 'justifycenter', 'justifyright', 'justifyjustify', '|', 'touppercase', 'tolowercase', '|', 'link', 'unlink', 'anchor', '|', 'imagenone', 'imageleft', 'imageright', 'imagecenter', '|', 'insertimage', 'insertvideo', 'music', 'attachment', 'map', 'insertframe', 'pagebreak', '|', 'horizontal', 'date', 'time', 'spechars', '|', 'inserttable', 'deletetable', 'insertparagraphbeforetable', 'insertrow', 'deleterow', 'insertcol', 'deletecol', 'mergecells',
							'mergeright', 'mergedown', 'splittocells', 'splittorows', 'splittocols', '|', 'print', 'preview', 'searchreplace' ] ]
				};

				var editor = UE.getEditor('editor', options);
			</script>
			<div style="text-align: center; margin: 10px 0;">
				<input type="button" class="btn btn-primary" value="保存" style="margin-right: 10px;" />
				<input type="button" class="btn" value="返回" onclick="editor.reset();" />
			</div>
		</form>
	</div>
</body>
</html>