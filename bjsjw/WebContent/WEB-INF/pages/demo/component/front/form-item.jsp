<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="hf" uri="/hanweb-front-tags"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>通用开发平台3.0</title>
<hf:head highlighter="true" placeholder="true" multifileupload="true" simple_editor="true" upload="true" message="true" checkpwd="true" grid="true" validity="true" calendar="true" tree="true" accordion="true" chosen="true" select="true" scroll="true"></hf:head>
<script type="text/javascript">
$(function(){
	SyntaxHighlighter.config.clipboardSwf = '${contextPath}/ui/widgets/highlighter/scripts/clipboard.swf';
	SyntaxHighlighter.all();
});
</script>
<style>
.syntaxhighlighter{
	width: 1000px !important;
}
</style>
</head>
<style>
h3 {
	padding: 0;
}
.box{
	border-bottom: 1px dashed #C3C3C3;
	padding-bottom: 10px;
}
.box>h3{
	border-left: 5px solid #3bb4f2;
	padding-left: 15px;
}
#demo-nav{
	float: left;
	width: 280px;
}
#demo-nav>a{
	padding: 0;
	margin: 0;
	padding: 5px 20px;
	cursor: pointer;
	text-decoration: none;
	display: block;
	font-size: 18px;
}
#demo-nav>a:hover,#demo-nav>a.selected{
	background-color: #EAEAEA;
}
#demo-wrap{
	margin-left: 300px;
	border-left:1px solid #CACACA;
	padding-left: 20px;
	padding-bottom: 30px;
	overflow: auto;
}
</style>
<script type="text/javascript">
$(function(){
	var $demoNav = $('#demo-nav');
	var $demoWrap = $('#demo-wrap');
	function setSize(){
		var top = $demoWrap.offset().top;
		var height = $(window).height() - top - 40;
		$demoWrap.height(height);
	}
	$('#demo-wrap>.box>h3').each(function(index, element){
		var $title = $(element);
		var $navItem = $('<a>' + $title.text() + '</a>');
		$navItem.click(function(){
			$demoNav.find('>a').removeClass('selected');
			$navItem.addClass('selected');
			$demoWrap.scrollTo($title.parent(), 500);
		});
		$demoNav.append($navItem);
	});
	$(window).resize(function(){
		setSize();
	});
	setSize();
});
</script>
<body>
<div id="page-title">
	开发指南 / <span id="page-location">${treeNodeName}</span>
</div>
<div id="page-content">
	<h3>
		<a target="_blank" style="color: red" href="#">建议【点我】在新窗口打开看</a>
	</h3>
	<div id="demo-nav">
	</div>
	<div id="demo-wrap">
		<div class="box">
			<h3>组件引入</h3>
			<pre class='brush:html'>
				// 与后台的h标签一样，前端开发使用hf标签
				&lt;%@ taglib prefix="hf" uri="/hanweb-front-tags"%&gt;
				&lt;hf:head select="true" placeholder="true" message="true" checkpwd="true" ....&gt;&lt;/hf:head&gt;
			</pre>
		</div>
		<div class="box">
			<h3>label</h3>
			<div class="label">我是标签</div>
			<pre class='brush:js,html'>
				// 一般与输入项一起使用，在需要使用标签样式的元素上加入如下
				class="label"
			</pre>
		</div>
		<div class="box">
			<h3>input</h3>
			<label class="label">用户名：<input class="input-text" placeholder="请输入用户名"></label>
			<pre class='brush:html'>
				<input class="input-text">
			</pre>
		</div>
		<div class="box">
			<h3>密码指示器</h3>
			<h5>组件引入</h5>
			<pre class='brush:html'>
				&lt;hf:head checkpwd="true"&gt;&lt;/hf:head&gt;
			</pre>
			<h5>示例</h5>
			<label class="label">密码：<input type="password" class="input-text" id="" pwdpower="pwdpower" placeholder="请输入密码"></label>
			<div style="overflow: hidden;">
				<label class="label" style="float: left;">强度：</label>
				<ul id="pwdpower" class="pwdpower">
					<li class="pweak"></li>
					<li class="pmedium"></li>
					<li class="pstrong"></li>
				</ul>
			</div>
			<pre class='brush:html'>
				// 在 type="password" 的input上加上 pwdpower="强度指示器的id"
				// 可以从js的变量 level 中获取当前的密码强度，强度有3种weak（弱）、medium（中）、strong（强）
				<input type="password" class="input-text" pwdpower="pp" placeholder="请输入密码">
				// 强度指示器
				<ul id="pp" class="pwdpower">
					<li class="pweak"></li>
					<li class="pmedium"></li>
					<li class="pstrong"></li>
				</ul>
			</pre>
		</div>
		<div class="box">
			<h3>上传</h3>
			<h5>组件引入</h5>
			<pre class='brush:html'>
				&lt;hf:head upload="true"&gt;&lt;/hf:head&gt;
			</pre>
			<h5>示例</h5>
			<label class="label">附件：</label><input id="file" type="file" class="input-text" name="file">
			<pre class='brush:html'>
				&lt;input id="file" type="file" class="input-text" name="file"&gt;
			</pre>
		</div>
		<div class="box">
			<h3>多文件上传</h3>
			<h5>组件引入</h5>
			<pre class='brush:html'>
				&lt;hf:head multifileupload="true"&gt;&lt;/hf:head&gt;
			</pre>
			<h5>示例</h5>
			<label class="label">自动上传附件：</label>
			<hf:multifileupload var="uploadConfig" id="files" name="file"></hf:multifileupload>
			<script type="text/javascript">
				function uploadError(up, file, errorCode, errorMsg, errorString){
					
				}
				function addUploadFile(up, file){
					console.info(file);
					nativeAlert('addUploadFile');
				}
				function removeUploadFile(up, file){
					console.info(file);
					nativeAlert('removeUploadFile');
				}
				function afterUpload(up, file, result){
					console.info(file);
					console.info(result);
					nativeAlert('afterUpload：获得文件名：' + result.params.fileName);
				}
				function completeUpload(up, file){
					console.info(file);
					nativeAlert('completeUpload');
				}
			</script>
			<div style="height: 10px"></div>
			<label class="label">手工上传附件：<span id="errorMsg" style="font-size: 12px;color: red"></span></label>
			<hf:multifileupload var="uploadConfig" id="files_m" name="file" startBtn="do_upload" errTip="errorMsg"></hf:multifileupload>
			<div style="margin-top: 10px;">
				<input id="do_upload" type="button" class="btn btn-primary" value="开始上传">
			</div>
			<pre class='brush:html'>
				<!-- var：文件上传的配置对象，ModelAndView中的MultifileUploadConfig -->
				<!-- id：domId，多文件上传div的id，不可重复 -->
				<!-- name：在当前form中的提交名称，多个文件的返回值以英文逗号分割；同时也作为上传文件接受参数名称 -->
				<!-- errTip: 错误信息的domid，如果不指定则弹出错误信息 -->
				<!-- startBtn: 手工上传按钮的domid，当设自动开始设置为false时，使用此按钮触发上传 -->
				&lt;hf:multifileupload var="uploadConfig" id="files" errTip="upload-err-tip" name="file" startBtn=""&gt;&lt;/hf:multifileupload&gt;
			</pre>
			<pre class='brush:js'>
				
				// 更多js方法 请看http://www.uploadify.com/documentation/
				
				function uploadError(up, file, errorCode, errorMsg, errorString){
					
				}
				function addUploadFile(up, file){
					console.info(file);
					nativeAlert('addUploadFile');
				}
				function removeUploadFile(up, file){
					console.info(file);
					nativeAlert('removeUploadFile');
				}
				function afterUpload(up, file, result){
					console.info(file);
					console.info(result);
					nativeAlert('afterUpload：获得文件名：' + result.params.fileName);
				}
				function completeUpload(up, file){
					console.info(file);
					nativeAlert('completeUpload');
				}
			</pre>
			<h5>java端</h5>
			<pre class='brush:java'>
				// 组织多文件上传的配置
				MultifileUploadConfig uploadConfig = new MultifileUploadConfig();
				// 是否选择后立刻上传
				uploadConfig.setAutoStart(false);
				// 是否可以连续添加文件，点击上传按钮之后是否可以继续添加文件
				uploadConfig.setContinuous(true);
				// 添加头
				uploadConfig.addHeader("cookie", "xxxxx");
				// 文件上传的url，接受附件的controller中的方法参数名称为 file，上传后的返回值一定要用JsonResult
				uploadConfig.setUploadUrl("do_upload.do");
				// 添加过滤，多个类型用分号分割
				uploadConfig.setFilter("请选择", "*.txt;*.doc;*.jpg");
				// 可上传文件个数
				uploadConfig.setLimit(15);
				// 每个文件的最大大小
				uploadConfig.setFileSize("10m");
				
				// 事件回调，up为upload控件对象
				// 添加文件后回调function(up, files)
				uploadConfig.setOnAdded("addUploadFile");
				// 删除文件后的回调function(up, files)
				uploadConfig.setOnRemoved("removeUploadFile");
				// 上传后回调function(up, file, result, info)，file：当前上传的一个文件；result： JsonResult的json形式
				uploadConfig.setAfterUpload("afterUpload");
				// 上传完成回调function(up, files)
				uploadConfig.setCompleteUpload("completeUpload");
				// 最后将uploadConfig导入到页面，其中addObject的key为 &lt;hf:multifileupload 中 var 的值
				modelAndView.addObject("uploadConfig", uploadConfig);
			</pre>
			<h5>接收上传文件</h5>
			<pre class='brush:java'>
				// controller的方法中接受文件的参数名称为 &lt;hf:multifileupload 中的 name，返回值必须使用jsonResult并转换成json的string形式
				
				@RequestMapping("do_upload")
				@ResponseBody
				public String doFileUpload(MultipartFile file){
					String fileId = StringUtil.getUUIDString();
					String fileName = fileId + "." + MultipartFileInfo.getInstance(file).getFileType();
					String path = BaseInfo.getRealPath() + "/temp/" + fileName;
					JsonResult jsonResult = JsonResult.getInstance();
					jsonResult.setSuccess(ControllerUtil.writeMultipartFileToFile(new File(path), file));
					jsonResult.addParam("fileName", fileName);
					return JsonUtil.objectToString(jsonResult);
				}
			</pre>
		</div>
		<div class="box">
			<h3>日历</h3>
			<h5>组件引入</h5>
			<pre class='brush:html'>
				&lt;hf:head calendar="true"&gt;&lt;/hf:head&gt;
			</pre>
			<h5>示例</h5>
			<label class="label">日期：<input type="text" name="createDate" value="2017-07-05" class="jcalendar input-text" onclick="WdatePicker({dateFmt:'yyyy-MM-dd'});" readonly="readonly"/></label>
			<pre class='brush:html'>
				<input type="text" name="createDate" value="2017-07-05" class="jcalendar input-text" onclick="WdatePicker({dateFmt:'yyyy-MM-dd'});" readonly="readonly"/>
			</pre>
		</div>
		<div class="box">
			<h3>textarea</h3>
			<label class="label" style="vertical-align: top;">自我介绍：<textarea class="input-textarea"></textarea></label>
			<pre class='brush:html'>
				<textarea class="input-textarea"></textarea>
			</pre>
		</div>
		<div class="box">
			<h3>select</h3>
			<h5>组件引入</h5>
			<pre class='brush:html'>
				&lt;hf:head select="true"&gt;&lt;/hf:head&gt;
			</pre>
			<h5>示例</h5>
			<select id="cert-type" style="font-size: 14px" data-change="certType">
				<option value="1">身份证</option>
				<option value="2">军官证</option>
				<option value="3">学生证</option>
				<option value="4">房产证</option>
			</select>
			<br>
			<br>
			<select id="cert-type1" style="font-size: 14px" class="lazy" data-value="2">
				<option value="1">身份证</option>
				<option value="2">军官证</option>
				<option value="3">学生证</option>
				<option value="4">房产证</option>
			</select>
			<script type="text/javascript">
			function certType(val, text){
				alert('select1选择了：'+text+'   值为：'+val);
			}
			$(function(){
				$('#cert-type1').select(null, null, {
					change : function(val, text){
						alert('select2选择了：'+text+'   值为：'+val);
					}
				});
			});
			</script>
			<pre class='brush:html'>
			<!--  data-change=""来指定change之后执行的方法，方法有两个参数（选项值，选项文本） -->
			&lt;select id="cert-type" style="font-size: 14px" data-change="certType"&gt;
				&lt;option value="1"&gt;身份证&lt;/option&gt;
				&lt;option value="2"&gt;军官证&lt;/option&gt;
				&lt;option value="3"&gt;学生证&lt;/option&gt;
				&lt;option value="4"&gt;房产证&lt;/option&gt;
			&lt;/select&gt;
			
			function certType(val, text){
				alert('select1选择了：'+text+'   值为：'+val);
			}
			</pre>
			<pre class='brush:js'>
				// 只要head 设置了select="true"就可以了
				// select标签中加入 data-value="2" 表示需要选中value=2的option，在select上可以加入 data-change=""来指定change之后执行的方法，方法有两个参数（选项值，选项文本）
				// 如果不想让组件式select生效于select，在select的class中加入lazy，class="lazy"
				// 如果想手动渲染select，需要将select的class先设置为lazy，然后使用 $('组件选择器').select()，如果需要定义change可以如下 
				$('#cert-type1').select(null, null, {
					change : function(val, text){
						alert('选择了：'+text+'   值为：'+val);
					}
				});
			</pre>
		</div>
		<div class="box">
			<h3>多选、单选</h3>
			<h5>组件引入</h5>
			<pre class='brush:html'>
				&lt;hf:head chosen="true"&gt;&lt;/hf:head&gt;
			</pre>
			<h5>示例</h5>
			<span class="label">订阅（多选）：</span><select class="chosen" multiple="multiple" data-value="2,4" data-select="onChosenSelect">
				<option value="1">新闻</option>
				<option value="2">体育</option>
				<option value="3">军事</option>
				<option value="4">教育</option>
			</select>
			<script type="text/javascript">
			function onChosenSelect(select, options){
				var msg = '选择了：';
				$.each(options, function(index, option){
					msg += option.value + ':' + option.text + '<br>';
				});
				alert(msg);
			}
			</script>
			<div style="height: 10px"></div>
			<span class="label">订阅（单选）：</span><select id="ms" class="chosen" data-select="onChosenSelect">
				<option value="">请选择</option>
				<option value="1">新闻</option>
				<option value="2">体育</option>
				<option value="3">军事</option>
				<option value="4">教育</option>
			</select>
			<pre class='brush:html'>
				<!-- 在select的class中加入chosen，表示自动按照chosen方式渲染，如果多选multiple需要设置，data-value="" 表示需要初始选择的值， data-select表示点击之后的事件回调-->
				&lt;select class="chosen" multiple="multiple" data-value="2,4" data-select="onChosenSelect"&gt;
					&lt;option value="1"&gt;新闻&lt;/option&gt;
					&lt;option value="2"&gt;体育&lt;/option&gt;
					&lt;option value="3"&gt;军事&lt;/option&gt;
					&lt;option value="4"&gt;教育&lt;/option&gt;
				&lt;/select&gt;
			</pre>
			<pre class='brush:js'>
			// data-select的方法有两个参数，一个是select：表示当前的select，options：以选中的值，是一个数组，每个数组中的元素（每个option）包含value与text
			function onChosenSelect(select, options){
				var msg = '选择了：';
				$.each(options, function(index, option){
					msg += option.value + ':' + option.text + '<br>';
				});
				alert(msg);
			}
			</pre>
			<pre class='brush:js'>
			// 如果需要手工初始化，可以使用如下方法
			$('选择器').chosen();
			</pre>
		</div>
		<div class="box">
			<h3>高级编辑器</h3>
			<h5>组件引入</h5>
			<pre class='brush:html'>
				&lt;hf:head simple_editor="true"&gt;&lt;/hf:head&gt;
			</pre>
			<h5>示例</h5>
			<textarea id="s_editor" style="width:800px;height:200px;"></textarea>
			<div style="height: 10px"></div>
			<input type="button" class="btn btn-primary" value="获取html" onclick="alert(editor.html());">
			<input type="button" class="btn btn-primary" value="判断是否为空" onclick="alert(editor.isEmpty());">
			<input type="button" class="btn btn-primary" value="获取text" onclick="alert(editor.text());">
			<input type="button" class="btn btn-primary" value="取得选中HTML" onclick="alert(editor.selectedHtml());">
			<input type="button" class="btn btn-primary" value="设置html" onclick="editor.html('<h3>设置html</h3>')">
			<input type="button" class="btn btn-primary" value="设置text" onclick="editor.text('<h3>设置text</h3>');">
			<input type="button" class="btn btn-primary" value="光标处插入HTML" onclick="editor.insertHtml('<strong>光标处插入HTML</strong>');">
			<input type="button" class="btn btn-primary" value="追加HTML" onclick="editor.appendHtml('<strong>追加HTML</strong>');">
			<input type="button" class="btn btn-primary" value="清空" onclick="editor.html('');">
			<script type="text/javascript">
			var editor = null;
			$(function(){
				// 初始化
				editor = $('#s_editor').simpleEditor();
			});
			</script>
			<pre class='brush:html'>
				<!--当 class="simple_editor" 系统自动初始化一个高级编辑器，如果要手动class就不要设置，并用下面的js来进行手动初始化，手动初始化可以定义更多参数-->
				&lt;textarea id="s_editor" class="simple_editor" style="width:800px;height:200px;"&gt;&lt;/textarea&gt;
			</pre>
			<h5>手动初始化</h5>
			<pre class='brush:js'>
			// 编辑器文档请看：http://kindeditor.net/doc.php
			$(function(){
				// 初始化
				var editor = editor = $('#s_editor').simpleEditor();
				// 可以传初始化参数
				editor = editor = $('#s_editor').simpleEditor({
					xxx:xxx
					......
				});
				// 参数请看：http://kindeditor.net/docs/option.html
			});
			</pre>
			<h5>基本方法</h5>
			<pre class='brush:js'>
			// 获取html
			editor.html()
			// 判断是否为空
			editor.isEmpty()
			// 获取text
			editor.text()
			// 取得选中HTML
			editor.selectedHtml()
			// 设置html
			editor.html('<h3>设置html</h3>')
			// 设置text
			editor.text('<h3>设置text</h3>')
			// 光标处插入HTML
			editor.insertHtml('<strong>光标处插入HTML</strong>')
			// 追加HTML
			editor.appendHtml('<strong>追加HTML</strong>')
			// 清空
			editor.html('')
			</pre>
		</div>
		<div class="box">
			<h3>按钮</h3>
			<input type="button" class="btn btn-success" value="按 钮">
			<input type="button" class="btn btn-primary" value="提 交">
			<input type="button" class="btn" value="重 置">
			<input type="button" class="btn btn-red" value="删 除">
			<input type="button" class="btn btn-orange" value="测 试">
			<div class="btn btn-success"><i class="iconfont">&#xf002b;</i>选择文件</div>
			<pre class='brush:html'>
				<input type="button" class="btn btn-success" value="按 钮">
				<input type="button" class="btn btn-primary" value="提 交">
				<input type="button" class="btn" value="重 置">
				<input type="button" class="btn btn-red" value="删 除">
				<input type="button" class="btn btn-orange" value="测 试">
				<div class="btn btn-success"><i class="iconfont">&amp;#xf507b;</i>图标按钮</div>
			</pre>
		</div>
		<div class="box">
			<h3>提示</h3>
			<h5>组件引入</h5>
			<pre class='brush:html'>
				&lt;hf:head message="true"&gt;&lt;/hf:head&gt;
			</pre>
			<h5>示例</h5>
			<input type="button" class="btn btn-primary" value="提示alert" onclick="alert('我是提示')">
			<input type="button" class="btn btn-primary" value="原生提示alert" onclick="nativeAlert('我是原生提示')">
			<pre class='brush:js'>
				// 组件提示
				alert('我是提示');
				// 浏览器原生提示
				nativeAlert('我是原生提示')
			</pre>
			<input type="button" class="btn btn-primary" value="询问confirm" onclick="showConfirm()">
			<input type="button" class="btn btn-primary" value="原生询问confirm" onclick="showNativeConfirm()">
			<script type="text/javascript">
				function showConfirm(){
					confirm('确定要这样么', function(){
						alert('点击了确定');
					}, function(){
						alert('点击了取消');
					})
				}
				function showNativeConfirm(){
					if(nativeConfirm('确定要这样么')){
						alert('点击了确定');
					}else{
						alert('点击了取消');
					}
				}
			</script>
			<pre class='brush:js'>
				// 组件confirm为非阻断式提示，需要自己定义点击确定后的function和点击取消的function
				confirm('确定要这样么', function(){
					alert('点击了确定');
				}, function(){
					alert('点击了取消');
				})
				// 浏览器原生confirm
				if(nativeConfirm('确定要这样么')){
					alert('点击了确定');
				}else{
					alert('点击了取消');
				}
			</pre>
			<input type="button" class="btn btn-primary" value="提示错误" onclick="alertErr('我错了')">
			<pre class='brush:js'>
				alertErr('我错了')
			</pre>
			<input type="button" class="btn btn-primary" value="提示正确" onclick="alertOk('我对了')">
			<pre class='brush:js'>
				alertOk('我对了')
			</pre>
		</div>
		<div class="box">
			<h3>弹窗</h3>
			<h5>组件引入</h5>
			<pre class='brush:html'>
				&lt;hf:head dialog="true"&gt;&lt;/hf:head&gt;
			</pre>
			<h5>示例</h5>
			<input type="button" class="btn btn-primary" value="编辑" onclick="edit()">
			<script type="text/javascript">
				function edit(){
					openDialog('form-item.do', 800, 600, {
						title:'编辑'
					});
				}
			</script>
			<pre class='brush:js'>
				// url、宽度、高度、其他选项，跟多其他选项参看http://www.layui.com/doc/modules/layer.html
				openDialog('form-item.do', 800, 600, {
					// 窗口标题
					title:'编辑',
					// 重设弹窗大小，忽略先前设置的width,height，当你只想定义宽度时，你可以area: '500px'，高度仍然是自适应的。当你宽高都要定义时，你可以area: ['500px', '300px']，全屏['100%','100%']
					area :
					// 是否显示右上角的关闭，默认为true
					closeBtn :
					// 是否显示最大、小化按钮，默认为false
					maxmin :
					// 弹出后的回调
					success :function(layero, index){}
					// 右上角关闭按钮触发的回调
					cancel : function(index, layero){}
				});
			</pre>
			<input type="button" class="btn btn-primary" value="关闭" onclick="closeDialog()">
			<pre class='brush:js'>
				closeDialog();
			</pre>
			<input type="button" class="btn btn-primary" value="刷新父页面" onclick="refreshParentWindow()">
			<pre class='brush:js'>
				refreshParentWindow();
			</pre>
			<input type="button" class="btn btn-primary" value="刷新父页面并关闭" onclick="closeDialog(true)">
			<pre class='brush:js'>
				closeDialog(true);
			</pre>
			<input type="button" class="btn btn-primary" value="改变父页面的【我是要被改掉的文字】为【呵呵】" onclick="getParentWindow().changeText('呵呵')">
			<div id="modifyText">我是要被改掉的文字</div>
			<script type="text/javascript">
				function changeText(msg){
					$('#modifyText').html(msg);
				}
			</script>
			<pre class='brush:js'>
				// getParentWindow() 为获取父页面的window
				getParentWindow().changeText('呵呵')
			</pre>
			<input type="button" class="btn btn-primary" value="关闭所有dialog" onclick="closeAllDialog()">
			<pre class='brush:js'>
				closeAllDialog();
			</pre>
		</div>
		<div class="box">
			<h3>列表页</h3>
			<h5>组件引入</h5>
			<pre class='brush:html'>
				&lt;hf:head grid="true"&gt;&lt;/hf:head&gt;
			</pre>
			<h5>示例</h5>
			<font color="red">添加数据<span style="margin-left: 20px;color: redd" id="info_msg"></span></font>
			<script type="text/javascript">
			$(function(){
				$('#info_form').validity(function() {
					$('#info_title').require('标题必须填写');
					$('#info_type').require('类型必须选择');
					$('#info_date').require('日期必须选择');
				},{success:function(result){
					$('#info_msg').text(result.message);
				}});
			});
			</script>
			<form id="info_form" action="infonews/add_submit.do">
				<table border="0" class="table" style="text-align: left;">
					<tr>
						<td align="right" class="label">标题：</td>
						<td class="required">*</td>
						<td>
							<input type="text" id="info_title" name="info_title" maxlength="85" style="width:788px" class="input-text" validity-error="info-title-error"/>
							<div id="info-title-error" class="validity-error"></div>
						</td>
					</tr>
					<tr>
						<td align="right" class="label">类型：</td>
						<td></td>
						<td>
							<select id="info_type" class="chosen" name="info_type">
							    <option value="1">标题</option>
							    <option value="2">标题+内容</option>
							    <option value="3">标题+图片</option>
							    <option value="4">标题+内容+图片</option>
							</select>
						</td>
					</tr>
					<tr>
						<td align="right" class="label">时间：</td>
						<td></td>
						<td>
							<input type="text" id="info_date" name="info_date" class="jcalendar input-text" onclick="WdatePicker({dateFmt:'yyyy-MM-dd'});" readonly="readonly" validity-error="info_date-error"/>
							<div id="info_date-error" class="validity-error"></div>
						</td>
					</tr>
					<tr>
						<td align="right" class="label">内容：</td>
						<td></td>
						<td>
							<textarea id="info_content" name="info_content" class="simple_editor" style="width:800px;height:200px;"></textarea>
						</td>
					</tr>
					<tr>
						<td colspan="4" style="text-align: center;">
							<input type="submit" class="btn btn-primary" value="提 交">&nbsp;&nbsp;&nbsp;&nbsp;
							<input type="button" class="btn" value="重 置">
						</td>
					</tr>
				</table>
			</form>
			<div></div>
			<font color="red">此列表的数据来源于上述表单</font>
			<div style="width: 1000px">
			<hf:grid form="list_user_form" url="listdata.do" callback="listUser" before="beforeList" complete="completeList" error="">
				<form id="list_user_form">
					<table border="0" class="table">
						<tr>
							<td align="right" class="label">标题</td>
							<td>
								<input type="text" name="info_title" class="input-text" style="width: 100px" placeholder="标题"/>
							</td>
							<td>
								<input type="submit" class="btn btn-primary" value="提交" />
							</td>
						</tr>
					</table>
				</form>
			</hf:grid>
			</div>
			<style>
				.info-news_wrap{
					overflow: hidden;
					font-size: 16px;
					padding: 8px 5px;
					max-height: 100px;
					overflow: hidden;
				}
				.info-news_title{
					height: 30px;
					overflow: hidden;
					font-size: 18px;
					font-weight: bold;
				}
				.info-news_date{
					color: #545454;
					vertical-align: middle;
					line-height: 23px;
				}
				.info-news_content{
					height: 45px;
					overflow: hidden;
					color: #333333;
					line-height: 23px;
				}
				.info-news_pic{
					float: left;
					width: 150px;
					height: auto;
					margin-right: 10px;
				}
			</style>
			<script type="text/javascript">
				var contextPath = '${contextPath}';
				function fRandomBy(under, over){ 
					switch(arguments.length){ 
					case 1: return parseInt(Math.random()*under+1); 
					case 2: return parseInt(Math.random()*(over-under+1) + under); 
					default: return 0; 
					} 
				} 
				function beforeList(){
				}
				function listUser(result, listBody){
					var html = '';
					if(result.total > 0){
						$.each(result.data, function(index, data){
							var title = data.info_title;
							var date = data.info_date;
							var content = $('<div>').append(data.info_content).text();
							var type = data.info_type;
							var img = contextPath + '/resources/demo/news/' + fRandomBy(1,7) + '.jpg';
							// /resources/demo/news/1.jpg
							html += '<div class="info-news_wrap">';
							switch(type){
							case 1: // 标题
								html += '<div class="info-news_date" style="float:right;height: 30px;line-height: 30px;">' + date + '</div>';
								html += '<div class="info-news_title" style="font-weight: normal;">' + title + '</div>';
								break;
							case 2: // 标题+内容
								html += '<div class="info-news_title">' + title + '</div>';
								html += '<div class="info-news_content">' + content + '</div>';
								html += '<div class="info-news_date">' + date + '</div>';
								break;
							case 3: // 标题+图片
								html += '<img class="info-news_pic" src="' + img + '"">';
								html += '<div class="info-news_title">' + title + '</div>';
								html += '<div class="info-news_date">' + date + '</div>';
								break;
							case 4: // 标题+内容+图片
								html += '<img class="info-news_pic" src="' + img + '"">';
								html += '<div class="info-news_title">' + title + '</div>';
								html += '<div class="info-news_content">' + content + '</div>';
								html += '<div class="info-news_date">' + date + '</div>';
								break;
							}
							html += '</div>'
						});
					}
					return html;
				}
				function completeList(){
				}
			</script>
			<pre class='brush:js'>
				// form：指定需要绑定的form表单id，加载数据时会自动将表单的输入项作为参数提交
				// url：表示请求数据的url
				// callback：请求后的回调callback(data, listBody)listBody为list数据部分的div，回调方法需要return需要显示的数据，如果callback未设置，将会直接把返回值填充到列表
				// before：请求之前的回调
				// complete：完成后的回调complete(listBody)listBody为list数据部分的div
				// error：发生错误的回调error(listBody)listBody为list数据部分的div，回调方法可以return需要显示的数据，如果返回true则使用默认显示
				// mask：是否遮罩，默认true
				// p:第几页
				// pg:每页多少条
				// toolbar：是否显示翻页工具栏
			</pre>
			<pre class='brush:html'>
				&lt;hf:grid form="list_user_form" url="listdata.do" callback="listUser" before="beforeList" complete="completeList" error="requestError" mask="true" p="" pg="" toolbar="false"&gt;
					<form id="list_user_form">
						<table border="0" class="table">
							<tr>
								<td align="right" class="label">标题</td>
								<td>
									<input type="text" name="info_title" class="input-text" style="width: 100px" placeholder="标题"/>
								</td>
								<td>
									<input type="submit" class="btn btn-primary" value="提交" />
								</td>
							</tr>
						</table>
					</form>
				&lt;/hf:grid&gt;
			</pre>
			<pre class='brush:js'>
				// 调用前回调
				function beforeList(){
				}
				// 获得数据后回调
				function listUser(result, listBody){
					var html = '';
					if(result.total > 0){
						$.each(result.data, function(index, data){
							var title = data.info_title;
							var date = data.info_date;
							var content = $('<div>').append(data.info_content).text();
							var type = data.info_type;
							var img = contextPath + '/resources/demo/news/' + fRandomBy(1,7) + '.jpg';
							// /resources/demo/news/1.jpg
							html += '<div class="info-news_wrap">';
							switch(type){
							case 1: // 标题
								html += '<div class="info-news_date" style="float:right;height: 30px;line-height: 30px;">' + date + '</div>';
								html += '<div class="info-news_title" style="font-weight: normal;">' + title + '</div>';
								break;
							case 2: // 标题+内容
								html += '<div class="info-news_title">' + title + '</div>';
								html += '<div class="info-news_content">' + content + '</div>';
								html += '<div class="info-news_date">' + date + '</div>';
								break;
							case 3: // 标题+图片
								html += '<img class="info-news_pic" src="' + img + '"">';
								html += '<div class="info-news_title">' + title + '</div>';
								html += '<div class="info-news_date">' + date + '</div>';
								break;
							case 4: // 标题+内容+图片
								html += '<img class="info-news_pic" src="' + img + '"">';
								html += '<div class="info-news_title">' + title + '</div>';
								html += '<div class="info-news_content">' + content + '</div>';
								html += '<div class="info-news_date">' + date + '</div>';
								break;
							}
							html += '</div>'
						});
					}
					return html;
				}
				// 调用完成回调
				function completeList(listBody){
				}
				// 出错回调
				function requestError(listBody){
				}
			</pre>
			<h5>java端</h5>
			<pre class='brush:java'>
				@Controller
				@RequestMapping("demo/component/front")
				public class FrontListDataController implements AjaxGridDataDelegate{ // 实现AjaxGridDataDelegate，需要重写makeResult方法
					
					@Autowired
					private AjaxGridDataService dataService; // 注入AjaxGridDataService
					
					/**
					 * 获取列表中的数据
					 * @param result	AjaxGridResult
					 * @param user		自己的参数
					 * @return			AjaxGridResult
					 */
					@RequestMapping("listdata") 
					@ResponseBody
					public AjaxGridResult listData(AjaxGridResult result, User user){// AjaxGridResult 为固定参数，其他参数根据需要自定，返回值也固定为AjaxGridResult，
						GridViewSql gridViewSql = GridViewSql.getInstance();	// GridViewSql.getInstance() 这里GridViewSql与后台的一样
						gridViewSql.addSelectField("info_title").addSelectField("info_date").addSelectField("info_content")
								.addSelectField("info_type");
						gridViewSql.setTable(InfoNews.TABLE_NAME);
						String where = "1=1";
						if (StringUtil.isNotEmpty(infoNews.getInfo_title())) {
							where += " AND info_title LIKE :title ";
						}
						// 这里可以往result里面设置值，可以在makeResult中调用，可以用来传递参数
						result.addObject("msg", "新年快乐"); // 这个方法可以用来传值给makeResult方法
						gridViewSql.setWhere(where);
						gridViewSql.addParam("title", infoNews.getInfo_title(), LikeType.LR);
						dataService.find(gridViewSql, result, this);	// 这里必须要调用dataService.find方法。
						return result;
					}
					/**
					 * 组织数据
					 * @param gridResult	AjaxGridResult
					 * @param rows		所有行
					 */
					@Override
					public Object makeResult(AjaxGridResult gridResult, List&lt;Map&lt;String, Object&gt;&gt; rows) {
						// 获取listData方法中result里面设置值
						gridResult.getObject("msg");
						// 在这里可以加工rows成任何形式返回，返回值会存在AjaxGridResult的data中。
						return rows;
					}
				}
				
				//AjaxGridResult的属性如下，在callback中可以直接调用
				public class AjaxGridResult{
	
					/**
					 * 页码
					 */
					protected String pageNumber = "1";
				
					/**
					 * 页面容量
					 */
					protected String pageSize = "10";
				
					/**
					 * 总记录数
					 */
					protected String total = "0";
				
					/**
					 * 结果
					 */
					protected Object data = null;
				}
			</pre>
		</div>
		<div class="box">
			<h3>验证框架</h3>
			<h5>组件引入</h5>
			<pre class='brush:html'>
				&lt;hf:head validity="true"&gt;&lt;/hf:head&gt;
			</pre>
			<h5>示例</h5>
			<form id="userForm1" action="">
				<table border="0" class="table" style="text-align: left;">
					<tr>
						<td align="right" class="label">用户id：</td>
						<td>
							<input type="text" id="iid" name="iid" maxlength="33" class="input-text"/>
						</td>
						<td align="right" class="label">登录名：</td>
						<td>
							<input type="text" name="loginName" id="loginName" class="input-text" placeholder="登录名" validity-error="loginname-error"/>
							<span id="loginname-error" class="validity-error"></span>
						</td>
					</tr>
					<tr>
						<td colspan="4" style="text-align: center;">
							<input type="submit" class="btn btn-primary" value="提 交">&nbsp;&nbsp;&nbsp;&nbsp;
							<input type="button" class="btn" value="重 置">
						</td>
					</tr>
				</table>
			</form>
			<script type="text/javascript">
			$(function(){
				$('#userForm1').validity(function() {
					$('#iid').require('iid必须填写');
					$('#loginName').require('登录名称必须填写');
				});
			});
			</script>
			<pre class='brush:js'>
			// 用法与后台的验证框架一样使用
			// 前台的增加了对错误提示的直接展示
			// 组件支持弹出错误与直接展示错误同存
			// 当设置了直接展示错误，弹出提示错误就不会出现
			</pre>
			<pre class='brush:html'>
			// 直接展示错误：validity-error表示本输入项需要显示错误提示信息的页面元素id，当验证错误，会将定义的错误提示输出到这个id中
			<input type="text" name="loginName" id="loginName" class="input-text" placeholder="登录名" validity-error="loginname-error"/>
			</pre>
		</div>
		<div class="box">
			<h3>验证码</h3>
			<label class="label">有干扰线<hf:verifycode url="verifyCode.do"></hf:verifycode></label><br><br>
			<label class="label">无干扰线<hf:verifycode url="verifyCode1.do"></hf:verifycode></label>
			<pre class='brush:html'>
				<!-- width：宽度 -->
				<!-- height：高度 -->
				<!-- url对应的controller需要自行定义 -->
				&lt;h:verifycode url="verifyCode.do" width="宽度" height="高度"&gt;&lt;/h:verifycode&gt;
			</pre>
			<h5>java端</h5>
			<pre class='brush:java'>
				@RequestMapping("verifyCode")
				@ResponseBody
				public String showVerifyCode(HttpSession session, HttpServletResponse response) {
					// 第二个参数定义session的key
					return VerifyCode.generate(response, "verifyCode");
					// 第三个参数为是否需要加入干扰线
					return VerifyCode.generate(response, "verifyCode", false);
				}
			</pre>
		</div>
		<div class="box">
			<h3>树</h3>
			<h5>组件引入</h5>
			<pre class='brush:html'>
				&lt;hf:head tree="true"&gt;&lt;/hf:head&gt;
			</pre>
			<h5>示例</h5>
			<div style="width: 800px;height:400px;">
				<div style="width: 200px;float: left;border: 1px solid #635E5E;height: 100%">
					<div id="tree" class="ztree"></div>
				</div>
				<div style="border: 1px solid #635E5E;margin-left: 200px">
					<iframe style="height: 400px;width: 596px;border: 0" id="treeFrame" name="treeFrame"></iframe>
				</div>
			</div>
			<script type="text/javascript">
			$(function(){
				// 树的节点的json数据
				var zNodes = "";
				var setting = {
					async : {
						enable : true,
						url : 'tree.do'
					}
				};
				$("#tree").tree(setting, zNodes);
			});
			</script>
			<pre class='brush:js'>
			// 用法与后台的树一样
			</pre>
			<pre class='brush:js'>
				// 同步树
				// 树的节点的json数据
				var zNodes = "";
				//	第一个参数为设置项，可以参考ztree的api，第二个为节点的json数据
				$("#tree").tree(null, zNodes);
			</pre>
			<pre class='brush:js'>
				// 异步树
				// 树的节点的json数据
				var zNodes = "";
				var setting = {
					async : {
						// 开启异步调用
						enable : true,
						// 异步调用url
						url : 'tree.do'
					}
				};
				$("#tree").tree(setting, zNodes);
			</pre>
			<pre class='brush:java'>
				// 在java端组织树的时候一定要注意 getInstance里的参数，这里是指定点击树的节点后的操作
				// 可以是一个iframe的name，也可以同超链接的 target 属性（"_blank", "_self"等）
				Tree tree = Tree.getInstance("treeFrame");
			</pre>
		</div>
		<div class="box">
			<h3>手风琴版面</h3>
			<h5>组件引入</h5>
			<pre class='brush:html'>
				&lt;hf:head accordion="true"&gt;&lt;/hf:head&gt;
			</pre>
			<h5>示例</h5>
			<dl class="accordion" style="width: 400px;border: 1px solid #DCDCDC">
			    <dt>大菜单1</dt>
			    <dd class="active">
			        <a class="accordion-sub-menu selected">菜单1</a>
			        <a class="accordion-sub-menu">菜单2</a>
			        <a class="accordion-sub-menu">菜单3</a>
			        <a class="accordion-sub-menu">菜单4</a>
			    </dd>
			    <dt>大菜单2</dt>
			    <dd style="margin: 20px 0 20px 20px">
			    	还能显示树
			        <div id="mtree" class="ztree"></div>
			        <script type="text/javascript">
					$(function(){
						// 树的节点的json数据
						var zNodes = "";
						var setting = {
							async : {
								enable : true,
								url : 'tree.do'
							}
						};
						$("#mtree").tree(setting, zNodes);
					});
					</script>
			    </dd>
			    <dt>大菜单3</dt>
			    <dd style="padding: 20px 0 20px 20px">
			    	<p>这里也可以显示文章</p>
			    </dd>
			</dl>
			<pre class='brush:html'>
				<dl class="accordion" style="width: 400px;border: 1px solid #DCDCDC">
				    <dt>大菜单1</dt>
				    <dd class="active">
				        <a class="accordion-sub-menu selected">菜单1</a> 
				        <a class="accordion-sub-menu">菜单2</a>
				        <a class="accordion-sub-menu">菜单3</a>
				        <a class="accordion-sub-menu">菜单4</a>
				    </dd>
				    <dt>大菜单2</dt>
				    <dd style="padding: 20px 0 20px 20px">
				    	还能显示树
				        <div id="mtree" class="ztree"></div>
				        <script type="text/javascript">
						$(function(){
							// 树的节点的json数据
							var zNodes = "";
							var setting = {
								async : {
									enable : true,
									url : 'tree.do'
								}
							};
							$("#mtree").tree(setting, zNodes);
						});
						</script>
				    </dd>
				    <dt>大菜单3</dt>
				    <dd style="padding: 20px 0 20px 20px">
				    	<p>这里也可以显示文章</p>
				    </dd>
			    </dl>
			</pre>
		</div>
	</div>
</div>
</body>
</html>