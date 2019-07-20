<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="h" uri="/hanweb-tags"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>表单控件</title>
<h:head pagetype="page" highlighter="true" loadmask="true" select="true" ></h:head>
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
				<td class="label" style="width: 80px">单选</td>
				<td>
					<label><input type="radio" name="sex" value="false" data-value="${sex }">男</label> <label><input type="radio" name="sex" value="true" data-value="${sex }">女</label>
				</td>
			</tr>
			<tr>
				<td class="label" style="width: 80px">复选</td>
				<td>
					<label><input type="checkbox" name="local" value="1" data-value="${selectIds }">南京</label> <label><input type="checkbox" name="local" value="2" data-value="${selectIds }">徐州</label> <label><input type="checkbox" name="local" value="3" data-value="${selectIds }">无锡</label> <label><input type="checkbox" name="local" value="4" data-value="${selectIds }">镇江</label> <label><input type="checkbox" name="local" value="5" data-value="${selectIds }">淮安</label> <label><input type="checkbox" name="local" value="6" data-value="${selectIds }">盐城</label> <label><input type="checkbox" name="local" value="7" data-value="${selectIds }">宿迁</label> <label><input type="checkbox" name="local" value="8" data-value="${selectIds }">常州</label>
				</td>
			</tr>
			<tr>
				<td class="label" style="width: 80px">文字下拉</td>
				<td>
					<select id="selectdemo" data-value="${degree }">
						<option value="1">一般</option>
						<option value="2">熟悉</option>
						<option value="3">熟练</option>
						<option value="4">精通</option>
						<option value="5">专家</option>
						<option value="6">祖师爷</option>
					</select> &emsp;
					<input type="button" value="setValue" class="btn" onclick="$('#selectdemo').select('setValue', 4);" />
					&emsp;
					<input type="button" value="addOptions" class="btn" onclick="$('#selectdemo').select('addOptions', [{optionText: '神级', optionValue: 7}, {optionText: '超神级', optionValue: 8}]);$('#selectdemo').select('setValue', 7);"/>
					&emsp;
					<input type="button" value="removeOptions" class="btn" onclick="$('#selectdemo').select('removeOptions', [1, 2]);"/>
					&emsp;
					<input type="button" value="removeAll" class="btn" onclick="$('#selectdemo').select('removeOptions');"/>
				</td>
			</tr>
			<tr>
				<td class="label" style="width: 80px">图标下拉</td>
				<td>
					<ul id="selectdemo2" class="select" data-value="${degree }">
						<li value="1">
							<i class="iconfont">&#xf5089;</i><span>一般</span>
						</li>
						<li value="2">
							<i class="iconfont">&#xf5088;</i><span>熟悉</span>
						</li>
						<li value="3">
							<i class="iconfont">&#xf5087;</i><span>熟练</span>
						</li>
						<li value="4">
							<i class="iconfont">&#xf507e;</i><span>精通</span>
						</li>
						<li value="5">
							<i class="iconfont">&#xf507c;</i><span>专家</span>
						</li>
						<li value="6">
							<i class="iconfont">&#xf5078;</i><span>祖师爷</span>
						</li>
					</ul>
				</td>
			</tr>
			<tr>
				<td class="label" style="width: 80px">图片下拉</td>
				<td>
					<ul id="selectdemo3" class="select" data-value="${degree }">
						<li value="1">
							<img src="http://png-2.findicons.com/files/icons/2036/farm/48/sheep.png" style="vertical-align: middle; margin: 5px 10px 5px 0;"> 一般
						</li>
						<li value="2">
							<img src="http://png-5.findicons.com/files/icons/248/xmas_gingerbread/48/sheep.png" style="vertical-align: middle; margin: 5px 10px 5px 0;"> 熟悉
						</li>
						<li value="3">
							<img src="http://png-5.findicons.com/files/icons/2036/farm/48/male_sheep.png" style="vertical-align: middle; margin: 5px 10px 5px 0;"> 熟练
						</li>
						<li value="4">
							<img src="http://png-5.findicons.com/files/icons/290/new_zealand/48/sheep.png" style="vertical-align: middle; margin: 5px 10px 5px 0;"> 精通
						</li>
						<li value="5">
							<img src="http://png-5.findicons.com/files/icons/248/xmas_gingerbread/48/sheep.png" style="vertical-align: middle; margin: 5px 10px 5px 0;"> 专家
						</li>
						<li value="6">
							<img src="http://png-5.findicons.com/files/icons/248/xmas_gingerbread/48/sheep.png" style="vertical-align: middle; margin: 5px 10px 5px 0;"> 祖师爷
						</li>
					</ul>
				</td>
			</tr>
			<tr>
				<td class="label" style="width: 80px">单行文本框</td>
				<td>
					<input type="text" class="input-text"/>
				</td>
			</tr>
			<tr>
				<td class="label" style="width: 80px">多行文本框</td>
				<td>
					<textarea class="input-textarea"></textarea>
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<div style="padding: 5px">
						<h3>radio</h3>
						<pre class='brush:html'>
							<!-- value为当前选项的值，data-value为之前选中的值 -->
							&lt;input type="radio" name="sex" value="false" data-value="${sex }"&gt;男
							&lt;input type="radio" name="sex" value="true" data-value="${sex }"&gt;女
						</pre>
						<h3>checkbox</h3>
						<pre class='brush:html'>
							<!-- value为当前选项的值，data-value为之前选中的值，这个值可以是一个list -->
							&lt;input type="checkbox" name="local" value="1" data-value="${selectIds }"&gt;南京
							&lt;input type="checkbox" name="local" value="2" data-value="${selectIds }"&gt;徐州
						</pre>
						<h3>select</h3>
						<pre class='brush:html'>
							&lt;h:head select="true"&gt;&lt;/h:head&gt;
							
							<!-- value为当前选项的值，data-value为之前选中的值 -->
							&lt;select data-value="${degree }"&gt;
								&lt;option value="1"&gt;一般&lt;/option&gt;
								&lt;option value="2"&gt;熟悉&lt;/option&gt;
								&lt;option value="3"&gt;熟练&lt;/option&gt;
								&lt;option value="4"&gt;精通&lt;/option&gt;
								&lt;option value="5"&gt;专家&lt;/option&gt;
								&lt;option value="6"&gt;祖师爷&lt;/option&gt;
							&lt;/select&gt;
						</pre>
						<h3>input</h3>
						<pre class='brush:html'>
							&lt;input type="text" class="input-text"/&gt;
						</pre>
						<h3>textarea</h3>
						<pre class='brush:html'>
							&lt;textarea class="input-textarea">&lt;/textarea&gt;
						</pre>
					</div>
				</td>
			</tr>
		</table>
	</div>
</body>
</html>