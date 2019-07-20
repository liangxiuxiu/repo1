<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="h" uri="/hanweb-tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title>图标</title>
<h:head pagetype="page" iconfont="true"></h:head>
<style>
a {
	color: #e74c3c;
	text-decoration: none;
}
a:hover, a:focus {
	box-shadow: 0 1px #e74c3c;
}
.bshadow0, input {
	box-shadow: inset 0 -2px #e7e7e7;
}
input:hover {
	box-shadow: inset 0 -2px #ccc;
}
input, fieldset {
	font-size: 1em;
	margin: 0;
	padding: 0;
	border: 0;
}
input {
	color: inherit;
	line-height: 1.5;
	height: 1.5em;
	padding: .25em 0;
}
input:focus {
	outline: none;
	box-shadow: inset 0 -2px #449fdb;
}
.glyph {
	font-size: 16px;
	width: 15em;
	padding-bottom: 1em;
	margin-right: 4em;
	margin-bottom: 1em;
	float: left;
	overflow: hidden;
}
.liga {
	width: 80%;
	width: calc(100% - 2.5em);
}
.talign-right {
	text-align: right;
}
.talign-center {
	text-align: center;
}
.bgc1 {
	background: #f1f1f1;
}
.fgc1 {
	color: #999;
}
.fgc0 {
	color: #000;
}
p {
	margin-top: 1em;
	margin-bottom: 1em;
}
.mvm {
	margin-top: .75em;
	margin-bottom: .75em;
}
.mtn {
	margin-top: 0;
}
.mtl, .mal {
	margin-top: 1.5em;
}
.mbl, .mal {
	margin-bottom: 1.5em;
}
.mal, .mhl {
	margin-left: 1.5em;
	margin-right: 1.5em;
}
.mhmm {
	margin-left: 1em;
	margin-right: 1em;
}
.mls {
	margin-left: .25em;
}
.ptl {
	padding-top: 1.5em;
}
.pbs, .pvs {
	padding-bottom: .25em;
}
.pvs, .pts {
	padding-top: .25em;
}
.clearfix {
	zoom: 1;
}
.unit {
	float: left;
}
.unitRight {
	float: right;
}
.size1of2 {
	width: 50%;
}
.size1of1 {
	width: 100%;
}
.clearfix:before, .clearfix:after {
	content: " ";
	display: table;
}
.clearfix:after {
	clear: both;
}
.noLiga-true {
	display: none;
}
.textbox0 {
	width: 3em;
	background: #f1f1f1;
	padding: .25em .5em;
	line-height: 1.5;
	height: 1.5em;
}
#testDrive {
	padding-top: 24px;
}
.fs0 {
	font-size: 16px;
}
.fs1 {
	font-size: 16px;
}

[class^="icon-"], [class*=" icon-"] {
	font-family: 'iconfont';
	speak: none;
	font-style: normal;
	font-weight: normal;
	font-variant: normal;
	text-transform: none;
	line-height: 1;

	/* Better Font Rendering =========== */
	-webkit-font-smoothing: antialiased;
	-moz-osx-font-smoothing: grayscale;
}

.icon-arrow1:before {
	content: "\f0001";
}
.icon-arrow2:before {
	content: "\f0002";
}
.icon-arrow3:before {
	content: "\f0003";
}
.icon-arrow4:before {
	content: "\f0004";
}
.icon-arrow5:before {
	content: "\f0005";
}
.icon-arrow6:before {
	content: "\f0006";
}
.icon-arrow7:before {
	content: "\f0007";
}
.icon-arrow8:before {
	content: "\f0008";
}
.icon-arrow9:before {
	content: "\f0009";
}
.icon-arrow10:before {
	content: "\f000a";
}
.icon-arrow11:before {
	content: "\f000b";
}
.icon-arrow12:before {
	content: "\f000c";
}
.icon-arrow13:before {
	content: "\f000d";
}
.icon-arrow14:before {
	content: "\f000e";
}
.icon-arrow15:before {
	content: "\f000f";
}
.icon-arrow16:before {
	content: "\f0010";
}
.icon-arrow17:before {
	content: "\f0011";
}
.icon-arrow18:before {
	content: "\f0012";
}
.icon-arrow19:before {
	content: "\f0013";
}
.icon-arrow20:before {
	content: "\f0014";
}
.icon-arrow21:before {
	content: "\f0015";
}
.icon-arrow22:before {
	content: "\f0016";
}
.icon-arrow23:before {
	content: "\f0017";
}
.icon-arrow24:before {
	content: "\f0018";
}
.icon-arrow25:before {
	content: "\f0019";
}
.icon-arrow26:before {
	content: "\f001a";
}
.icon-arrow27:before {
	content: "\f001b";
}
.icon-arrow28:before {
	content: "\f001c";
}
.icon-arrow29:before {
	content: "\f001d";
}
.icon-arrow30:before {
	content: "\f001e";
}
.icon-arrow31:before {
	content: "\f001f";
}
.icon-arrow32:before {
	content: "\f0020";
}
.icon-arrow33:before {
	content: "\f0021";
}
.icon-arrow34:before {
	content: "\f0022";
}
.icon-arrow35:before {
	content: "\f0023";
}
.icon-arrow36:before {
	content: "\f0024";
}
.icon-arrow37:before {
	content: "\f0025";
}
.icon-uni3F:before {
	content: "\f0026";
}
.icon-uni40:before {
	content: "\f0027";
}
.icon-uni43:before {
	content: "\f0028";
}
.icon-uni44:before {
	content: "\f0029";
}
.icon-uniE00D:before {
	content: "\f002a";
}
.icon-uniE00E:before {
	content: "\f002b";
}
.icon-uniE011:before {
	content: "\f002c";
}
.icon-uniE012:before {
	content: "\f002d";
}
.icon-uniE013:before {
	content: "\f002e";
}
.icon-uniE014:before {
	content: "\f002f";
}
.icon-uni52:before {
	content: "\f0030";
}
.icon-uni53:before {
	content: "\f0031";
}
.icon-arrow38:before {
	content: "\f0032";
}
.icon-uni57:before {
	content: "\f0033";
}
.icon-arrow39:before {
	content: "\f0034";
}
.icon-uni56:before {
	content: "\f0035";
}
.icon-arrow40:before {
	content: "\f0036";
}
.icon-uniE010:before {
	content: "\f0037";
}
.icon-uniE00F:before {
	content: "\f0038";
}
.icon-arrow41:before {
	content: "\f0039";
}
.icon-arrow42:before {
	content: "\f003a";
}
.icon-arrow43:before {
	content: "\f003b";
}
.icon-arrow44:before {
	content: "\f003c";
}
.icon-user1:before {
	content: "\f1001";
}
.icon-user2:before {
	content: "\f1002";
}
.icon-user3:before {
	content: "\f1003";
}
.icon-user4:before {
	content: "\f1004";
}
.icon-user5:before {
	content: "\f1005";
}
.icon-user6:before {
	content: "\f1006";
}
.icon-user7:before {
	content: "\f1007";
}
.icon-user8:before {
	content: "\f1008";
}
.icon-user9:before {
	content: "\f1009";
}
.icon-user10:before {
	content: "\f100a";
}
.icon-uF00D4:before {
	content: "\f100b";
}
.icon-uF015A:before {
	content: "\f100c";
}
.icon-uF000C:before {
	content: "\f100d";
}
.icon-uni24:before {
	content: "\f100e";
}
.icon-uni343A:before {
	content: "\f100f";
}
.icon-uF00E4:before {
	content: "\f1010";
}
.icon-uni343D:before {
	content: "\f1011";
}
.icon-uF00A9:before {
	content: "\f1012";
}
.icon-uni26:before {
	content: "\f1013";
}
.icon-uni3445:before {
	content: "\f1014";
}
.icon-uF014B:before {
	content: "\f1015";
}
.icon-uF002E:before {
	content: "\f1016";
}
.icon-uni3435:before {
	content: "\f1017";
}
.icon-uF008E:before {
	content: "\f1018";
}
.icon-uF008B:before {
	content: "\f1019";
}
.icon-uF008C:before {
	content: "\f101a";
}
.icon-uni5C:before {
	content: "\f101b";
}
.icon-uni5D:before {
	content: "\f101c";
}
.icon-uni3C:before {
	content: "\f101d";
}
.icon-uni3E:before {
	content: "\f101e";
}
.icon-uni3D:before {
	content: "\f101f";
}
.icon-uF0029:before {
	content: "\f2001";
}
.icon-uF002D:before {
	content: "\f2002";
}
.icon-uF0032:before {
	content: "\f2003";
}
.icon-uF003C:before {
	content: "\f2004";
}
.icon-uF003B:before {
	content: "\f2005";
}
.icon-uF0074:before {
	content: "\f2006";
}
.icon-uF007D:before {
	content: "\f2007";
}
.icon-uF0080:before {
	content: "\f2008";
}
.icon-uF0083:before {
	content: "\f2009";
}
.icon-uF00BD:before {
	content: "\f200a";
}
.icon-uF00BE:before {
	content: "\f200b";
}
.icon-uF00BF:before {
	content: "\f200c";
}
.icon-uF00C0:before {
	content: "\f200d";
}
.icon-uF00C1:before {
	content: "\f200e";
}
.icon-uF00C3:before {
	content: "\f200f";
}
.icon-uF00C2:before {
	content: "\f2010";
}
.icon-uF016A:before {
	content: "\f2011";
}
.icon-uF01C6:before {
	content: "\f2012";
}
.icon-uF0079:before {
	content: "\f2013";
}
.icon-uF000F:before {
	content: "\f2014";
}
.icon-uF0010:before {
	content: "\f2015";
}
.icon-uni75:before {
	content: "\f2016";
}
.icon-uni76:before {
	content: "\f2017";
}
.icon-uF00BC:before {
	content: "\f2018";
}
.icon-uniE006:before {
	content: "\f2019";
}
.icon-uniE007:before {
	content: "\f201a";
}
.icon-uF0043:before {
	content: "\f201b";
}
.icon-uni38:before {
	content: "\f201c";
}
.icon-uni3A:before {
	content: "\f201d";
}
.icon-uni39:before {
	content: "\f201e";
}
.icon-uF0007:before {
	content: "\f201f";
}
.icon-uF0077:before {
	content: "\f2020";
}
.icon-uni4A:before {
	content: "\f2021";
}
.icon-uni4C:before {
	content: "\f2022";
}
.icon-uni4B:before {
	content: "\f2023";
}
.icon-uF0062:before {
	content: "\f2024";
}
.icon-uF0085:before {
	content: "\f2025";
}
.icon-uni33:before {
	content: "\f3001";
}
.icon-uF001C:before {
	content: "\f3002";
}
.icon-uF002A:before {
	content: "\f3003";
}
.icon-uF0030:before {
	content: "\f3004";
}
.icon-uF0058:before {
	content: "\f3005";
}
.icon-uF006A:before {
	content: "\f3006";
}
.icon-uF0154:before {
	content: "\f3007";
}
.icon-uF0153:before {
	content: "\f3008";
}
.icon-uF0155:before {
	content: "\f3009";
}
.icon-uni28:before {
	content: "\f300a";
}
.icon-uni29:before {
	content: "\f300b";
}
.icon-uni2A:before {
	content: "\f300c";
}
.icon-uni2B:before {
	content: "\f300d";
}
.icon-uni2C:before {
	content: "\f300e";
}
.icon-uni2D:before {
	content: "\f300f";
}
.icon-uni2E:before {
	content: "\f3010";
}
.icon-uni2F:before {
	content: "\f3011";
}
.icon-uni30:before {
	content: "\f3012";
}
.icon-uF004C:before {
	content: "\f3013";
}
.icon-uF00B3:before {
	content: "\f3014";
}
.icon-uF00B4:before {
	content: "\f3015";
}
.icon-uF0016:before {
	content: "\f3016";
}
.icon-uni3444:before {
	content: "\f3017";
}
.icon-uF0037:before {
	content: "\f3018";
}
.icon-uni47:before {
	content: "\f3019";
}
.icon-uni48:before {
	content: "\f301a";
}
.icon-uni49:before {
	content: "\f301b";
}
.icon-uF01BA:before {
	content: "\f301c";
}
.icon-uF027C:before {
	content: "\f301d";
}
.icon-uF00C6:before {
	content: "\f4001";
}
.icon-uF00C7:before {
	content: "\f4002";
}
.icon-uF00C8:before {
	content: "\f4003";
}
.icon-uF00C5:before {
	content: "\f4004";
}
.icon-uni45:before {
	content: "\f4005";
}
.icon-uni46:before {
	content: "\f4006";
}
.icon-uni74:before {
	content: "\f5001";
}
.icon-x:before {
	content: "\f5002";
}
.icon-uni73:before {
	content: "\f5003";
}
.icon-uF01B8:before {
	content: "\f5004";
}
.icon-uF01B9:before {
	content: "\f5005";
}
.icon-uni61:before {
	content: "\f5006";
}
.icon-uni62:before {
	content: "\f5007";
}
.icon-uF0066:before {
	content: "\f5008";
}
.icon-uF004A:before {
	content: "\f5009";
}
.icon-uni3447:before {
	content: "\f500a";
}
.icon-uni3465:before {
	content: "\f500b";
}
.icon-uniE01C:before {
	content: "\f500c";
}
.icon-uni3467:before {
	content: "\f500d";
}
.icon-uF00B5:before {
	content: "\f500e";
}
.icon-uF00B6:before {
	content: "\f500f";
}
.icon-uF00B2:before {
	content: "\f5010";
}
.icon-uni65:before {
	content: "\f5011";
}
.icon-uni66:before {
	content: "\f5012";
}
.icon-uni67:before {
	content: "\f5013";
}
.icon-uF013E:before {
	content: "\f5014";
}
.icon-uni5E:before {
	content: "\f5015";
}
.icon-uF001E:before {
	content: "\f5016";
}
.icon-uni346A:before {
	content: "\f5017";
}
.icon-uni5F:before {
	content: "\f5018";
}
.icon-uF018D:before {
	content: "\f5019";
}
.icon-uni60:before {
	content: "\f501a";
}
.icon-uF00E8:before {
	content: "\f501b";
}
.icon-uF0166:before {
	content: "\f501c";
}
.icon-uF010D:before {
	content: "\f501d";
}
.icon-uF003A:before {
	content: "\f501e";
}
.icon-uni345E:before {
	content: "\f501f";
}
.icon-uni63:before {
	content: "\f5020";
}
.icon-uni64:before {
	content: "\f5021";
}
.icon-uni3462:before {
	content: "\f5022";
}
.icon-uF003E:before {
	content: "\f5023";
}
.icon-uni71:before {
	content: "\f5024";
}
.icon-uni72:before {
	content: "\f5025";
}
.icon-uni344D:before {
	content: "\f5026";
}
.icon-uF0092:before {
	content: "\f5027";
}
.icon-uni5A:before {
	content: "\f5028";
}
.icon-uni5B:before {
	content: "\f5029";
}
.icon-uni3433:before {
	content: "\f502a";
}
.icon-uF001A:before {
	content: "\f502b";
}
.icon-uF001B:before {
	content: "\f502c";
}
.icon-uni3463:before {
	content: "\f502d";
}
.icon-uF01BC:before {
	content: "\f502e";
}
.icon-uni343E:before {
	content: "\f502f";
}
.icon-uni3432:before {
	content: "\f5030";
}
.icon-uF0025:before {
	content: "\f5031";
}
.icon-uF002F:before {
	content: "\f5032";
}
.icon-uni4D:before {
	content: "\f5033";
}
.icon-uni4E:before {
	content: "\f5034";
}
.icon-uni4F:before {
	content: "\f5035";
}
.icon-uni50:before {
	content: "\f5036";
}
.icon-uF0144:before {
	content: "\f5037";
}
.icon-uF0290:before {
	content: "\f5038";
}
.icon-uniE026:before {
	content: "\f5039";
}
.icon-uni3491:before {
	content: "\f503a";
}
.icon-uF0142:before {
	content: "\f503b";
}
.icon-uF0050:before {
	content: "\f503c";
}
.icon-uF0159:before {
	content: "\f503d";
}
.icon-uF017A:before {
	content: "\f503e";
}
.icon-uni3B:before {
	content: "\f503f";
}
.icon-uF01FF:before {
	content: "\f5040";
}
.icon-uniE01A:before {
	content: "\f5041";
}
.icon-uF0174:before {
	content: "\f5042";
}
.icon-uF0197:before {
	content: "\f5043";
}
.icon-uF00DD:before {
	content: "\f5044";
}
.icon-uni6F:before {
	content: "\f5045";
}
.icon-uni70:before {
	content: "\f5046";
}
.icon-uF004F:before {
	content: "\f5047";
}
.icon-uni346F:before {
	content: "\f5048";
}
.icon-uF017F:before {
	content: "\f5049";
}
.icon-uF0180:before {
	content: "\f504a";
}
.icon-uF0181:before {
	content: "\f504b";
}
.icon-uF0182:before {
	content: "\f504c";
}
.icon-uF0183:before {
	content: "\f504d";
}
.icon-uF0184:before {
	content: "\f504e";
}
.icon-uF0185:before {
	content: "\f504f";
}
.icon-uF0186:before {
	content: "\f5050";
}
.icon-uF0187:before {
	content: "\f5051";
}
.icon-uF0198:before {
	content: "\f5052";
}
.icon-uF00F7:before {
	content: "\f5053";
}
.icon-uni344F:before {
	content: "\f5054";
}
.icon-uni348E:before {
	content: "\f5055";
}
.icon-uF00E9:before {
	content: "\f5056";
}
.icon-uF00EA:before {
	content: "\f5057";
}
.icon-uF01C0:before {
	content: "\f5058";
}
.icon-uF01C1:before {
	content: "\f5059";
}
.icon-uF01B6:before {
	content: "\f505a";
}
.icon-uF01B7:before {
	content: "\f505b";
}
.icon-uni54:before {
	content: "\f505c";
}
.icon-uni55:before {
	content: "\f505d";
}
.icon-uF01ED:before {
	content: "\f505e";
}
.icon-uni68:before {
	content: "\f505f";
}
.icon-uni69:before {
	content: "\f5060";
}
.icon-uF0038:before {
	content: "\f5061";
}
.icon-uF0039:before {
	content: "\f5062";
}
.icon-uF0102:before {
	content: "\f5063";
}
.icon-uni58:before {
	content: "\f5064";
}
.icon-uni59:before {
	content: "\f5065";
}
.icon-uni6A:before {
	content: "\f5066";
}
.icon-uni6B:before {
	content: "\f5067";
}
.icon-uni6C:before {
	content: "\f5068";
}
.icon-uF007C:before {
	content: "\f5069";
}
.icon-uni6D:before {
	content: "\f506a";
}
.icon-uni6E:before {
	content: "\f506b";
}
.icon-uniE015:before {
	content: "\f506c";
}
.icon-uniE016:before {
	content: "\f506d";
}
.icon-uniE017:before {
	content: "\f506e";
}
.icon-uniE018:before {
	content: "\f506f";
}
.icon-uniE019:before {
	content: "\f5070";
}
.icon-uniE01B:before {
	content: "\f5071";
}
.icon-uniE01D:before {
	content: "\f5072";
}
.icon-uniE01E:before {
	content: "\f5073";
}
.icon-uniE01F:before {
	content: "\f5074";
}
.icon-uniE020:before {
	content: "\f5075";
}
.icon-uniE022:before {
	content: "\f5076";
}
.icon-uniE023:before {
	content: "\f5077";
}
.icon-uniE024:before {
	content: "\f5078";
}
.icon-uniE025:before {
	content: "\f5079";
}
.icon-uni346B:before {
	content: "\f507a";
}
.icon-uF0044:before {
	content: "\f507b";
}
.icon-uF004B:before {
	content: "\f507c";
}
.icon-uF0051:before {
	content: "\f507d";
}
.icon-uF0089:before {
	content: "\f507e";
}
.icon-uF00AF:before {
	content: "\f507f";
}
.icon-uF0107:before {
	content: "\f5080";
}
.icon-uF0152:before {
	content: "\f5081";
}
.icon-uF0105:before {
	content: "\f5082";
}
.icon-uF0196:before {
	content: "\f5083";
}
.icon-uF01B2:before {
	content: "\f5084";
}
.icon-uF01BB:before {
	content: "\f5085";
}
.icon-uF018C:before {
	content: "\f5086";
}
.icon-uF01C7:before {
	content: "\f5087";
}
.icon-uF01AF:before {
	content: "\f5088";
}
.icon-uF0200:before {
	content: "\f5089";
}
.icon-uF028B:before {
	content: "\f508a";
}
.icon-uni51:before {
	content: "\f508b";
}

</style>
</head>
<body>
	<div id="page-title">
		开发指南 / <span id="page-location">${treeNodeName}</span>
	</div>
	<div id="page-content">
		<div class="bgc1 clearfix">
			<h1 class="mhmm mvm"><span class="fgc1">字体库 </span>  <small class="fgc1">(Glyphs:&nbsp;302)</small></h1>
		</div>
		<div class="clearfix mhl ptl">
			<p style="font-size:13px;line-height:30px;margin:0 0 60px 0;">
				&lt;i class="iconfont"&gt;Unicode字符&lt;/i&gt;，如：&lt;i class="iconfont"&gt;&amp;#xf0001;&lt;/i&gt; <br/>
				如果没有你要的图标，访问 <a href="http://icomoon.io/app" target="_blank">ICOMOON</a>，制作自己的图标
			</p>
			<div class="glyph fs1">
				<div class="clearfix bshadow0 pbs">
					<span class="icon-arrow1"></span><span class="mls"> icon-arrow1</span>
				</div>
				<fieldset class="fs0 size1of1 clearfix">
					<input type="text" readonly value="f0001" class="unit size1of2" />
					<input type="text" maxlength="1" readonly value="&#xf0001;" class="unitRight size1of2 talign-right" />
				</fieldset>
				<div class="fs0 bshadow0 clearfix noLiga-true">
					<span class="unit pvs fgc1">liga: </span>
					<input type="text" readonly value="" class="liga unitRight" />
				</div>
			</div>
			<div class="glyph fs1">
				<div class="clearfix bshadow0 pbs">
					<span class="icon-arrow2"></span><span class="mls"> icon-arrow2</span>
				</div>
				<fieldset class="fs0 size1of1 clearfix">
					<input type="text" readonly value="f0002" class="unit size1of2" />
					<input type="text" maxlength="1" readonly value="&#xf0002;" class="unitRight size1of2 talign-right" />
				</fieldset>
				<div class="fs0 bshadow0 clearfix noLiga-true">
					<span class="unit pvs fgc1">liga: </span>
					<input type="text" readonly value="" class="liga unitRight" />
				</div>
			</div>
			<div class="glyph fs1">
				<div class="clearfix bshadow0 pbs">
					<span class="icon-arrow3"></span><span class="mls"> icon-arrow3</span>
				</div>
				<fieldset class="fs0 size1of1 clearfix">
					<input type="text" readonly value="f0003" class="unit size1of2" />
					<input type="text" maxlength="1" readonly value="&#xf0003;" class="unitRight size1of2 talign-right" />
				</fieldset>
				<div class="fs0 bshadow0 clearfix noLiga-true">
					<span class="unit pvs fgc1">liga: </span>
					<input type="text" readonly value="" class="liga unitRight" />
				</div>
			</div>
			<div class="glyph fs1">
				<div class="clearfix bshadow0 pbs">
					<span class="icon-arrow4"></span><span class="mls"> icon-arrow4</span>
				</div>
				<fieldset class="fs0 size1of1 clearfix">
					<input type="text" readonly value="f0004" class="unit size1of2" />
					<input type="text" maxlength="1" readonly value="&#xf0004;" class="unitRight size1of2 talign-right" />
				</fieldset>
				<div class="fs0 bshadow0 clearfix noLiga-true">
					<span class="unit pvs fgc1">liga: </span>
					<input type="text" readonly value="" class="liga unitRight" />
				</div>
			</div>
			<div class="glyph fs1">
				<div class="clearfix bshadow0 pbs">
					<span class="icon-arrow5"></span><span class="mls"> icon-arrow5</span>
				</div>
				<fieldset class="fs0 size1of1 clearfix">
					<input type="text" readonly value="f0005" class="unit size1of2" />
					<input type="text" maxlength="1" readonly value="&#xf0005;" class="unitRight size1of2 talign-right" />
				</fieldset>
				<div class="fs0 bshadow0 clearfix noLiga-true">
					<span class="unit pvs fgc1">liga: </span>
					<input type="text" readonly value="" class="liga unitRight" />
				</div>
			</div>
			<div class="glyph fs1">
				<div class="clearfix bshadow0 pbs">
					<span class="icon-arrow6"></span><span class="mls"> icon-arrow6</span>
				</div>
				<fieldset class="fs0 size1of1 clearfix">
					<input type="text" readonly value="f0006" class="unit size1of2" />
					<input type="text" maxlength="1" readonly value="&#xf0006;" class="unitRight size1of2 talign-right" />
				</fieldset>
				<div class="fs0 bshadow0 clearfix noLiga-true">
					<span class="unit pvs fgc1">liga: </span>
					<input type="text" readonly value="" class="liga unitRight" />
				</div>
			</div>
			<div class="glyph fs1">
				<div class="clearfix bshadow0 pbs">
					<span class="icon-arrow7"></span><span class="mls"> icon-arrow7</span>
				</div>
				<fieldset class="fs0 size1of1 clearfix">
					<input type="text" readonly value="f0007" class="unit size1of2" />
					<input type="text" maxlength="1" readonly value="&#xf0007;" class="unitRight size1of2 talign-right" />
				</fieldset>
				<div class="fs0 bshadow0 clearfix noLiga-true">
					<span class="unit pvs fgc1">liga: </span>
					<input type="text" readonly value="" class="liga unitRight" />
				</div>
			</div>
			<div class="glyph fs1">
				<div class="clearfix bshadow0 pbs">
					<span class="icon-arrow8"></span><span class="mls"> icon-arrow8</span>
				</div>
				<fieldset class="fs0 size1of1 clearfix">
					<input type="text" readonly value="f0008" class="unit size1of2" />
					<input type="text" maxlength="1" readonly value="&#xf0008;" class="unitRight size1of2 talign-right" />
				</fieldset>
				<div class="fs0 bshadow0 clearfix noLiga-true">
					<span class="unit pvs fgc1">liga: </span>
					<input type="text" readonly value="" class="liga unitRight" />
				</div>
			</div>
			<div class="glyph fs1">
				<div class="clearfix bshadow0 pbs">
					<span class="icon-arrow9"></span><span class="mls"> icon-arrow9</span>
				</div>
				<fieldset class="fs0 size1of1 clearfix">
					<input type="text" readonly value="f0009" class="unit size1of2" />
					<input type="text" maxlength="1" readonly value="&#xf0009;" class="unitRight size1of2 talign-right" />
				</fieldset>
				<div class="fs0 bshadow0 clearfix noLiga-true">
					<span class="unit pvs fgc1">liga: </span>
					<input type="text" readonly value="" class="liga unitRight" />
				</div>
			</div>
			<div class="glyph fs1">
				<div class="clearfix bshadow0 pbs">
					<span class="icon-arrow10"></span><span class="mls"> icon-arrow10</span>
				</div>
				<fieldset class="fs0 size1of1 clearfix">
					<input type="text" readonly value="f000a" class="unit size1of2" />
					<input type="text" maxlength="1" readonly value="&#xf000a;" class="unitRight size1of2 talign-right" />
				</fieldset>
				<div class="fs0 bshadow0 clearfix noLiga-true">
					<span class="unit pvs fgc1">liga: </span>
					<input type="text" readonly value="" class="liga unitRight" />
				</div>
			</div>
			<div class="glyph fs1">
				<div class="clearfix bshadow0 pbs">
					<span class="icon-arrow11"></span><span class="mls"> icon-arrow11</span>
				</div>
				<fieldset class="fs0 size1of1 clearfix">
					<input type="text" readonly value="f000b" class="unit size1of2" />
					<input type="text" maxlength="1" readonly value="&#xf000b;" class="unitRight size1of2 talign-right" />
				</fieldset>
				<div class="fs0 bshadow0 clearfix noLiga-true">
					<span class="unit pvs fgc1">liga: </span>
					<input type="text" readonly value="" class="liga unitRight" />
				</div>
			</div>
			<div class="glyph fs1">
				<div class="clearfix bshadow0 pbs">
					<span class="icon-arrow12"></span><span class="mls"> icon-arrow12</span>
				</div>
				<fieldset class="fs0 size1of1 clearfix">
					<input type="text" readonly value="f000c" class="unit size1of2" />
					<input type="text" maxlength="1" readonly value="&#xf000c;" class="unitRight size1of2 talign-right" />
				</fieldset>
				<div class="fs0 bshadow0 clearfix noLiga-true">
					<span class="unit pvs fgc1">liga: </span>
					<input type="text" readonly value="" class="liga unitRight" />
				</div>
			</div>
			<div class="glyph fs1">
				<div class="clearfix bshadow0 pbs">
					<span class="icon-arrow13"></span><span class="mls"> icon-arrow13</span>
				</div>
				<fieldset class="fs0 size1of1 clearfix">
					<input type="text" readonly value="f000d" class="unit size1of2" />
					<input type="text" maxlength="1" readonly value="&#xf000d;" class="unitRight size1of2 talign-right" />
				</fieldset>
				<div class="fs0 bshadow0 clearfix noLiga-true">
					<span class="unit pvs fgc1">liga: </span>
					<input type="text" readonly value="" class="liga unitRight" />
				</div>
			</div>
			<div class="glyph fs1">
				<div class="clearfix bshadow0 pbs">
					<span class="icon-arrow14"></span><span class="mls"> icon-arrow14</span>
				</div>
				<fieldset class="fs0 size1of1 clearfix">
					<input type="text" readonly value="f000e" class="unit size1of2" />
					<input type="text" maxlength="1" readonly value="&#xf000e;" class="unitRight size1of2 talign-right" />
				</fieldset>
				<div class="fs0 bshadow0 clearfix noLiga-true">
					<span class="unit pvs fgc1">liga: </span>
					<input type="text" readonly value="" class="liga unitRight" />
				</div>
			</div>
			<div class="glyph fs1">
				<div class="clearfix bshadow0 pbs">
					<span class="icon-arrow15"></span><span class="mls"> icon-arrow15</span>
				</div>
				<fieldset class="fs0 size1of1 clearfix">
					<input type="text" readonly value="f000f" class="unit size1of2" />
					<input type="text" maxlength="1" readonly value="&#xf000f;" class="unitRight size1of2 talign-right" />
				</fieldset>
				<div class="fs0 bshadow0 clearfix noLiga-true">
					<span class="unit pvs fgc1">liga: </span>
					<input type="text" readonly value="" class="liga unitRight" />
				</div>
			</div>
			<div class="glyph fs1">
				<div class="clearfix bshadow0 pbs">
					<span class="icon-arrow16"></span><span class="mls"> icon-arrow16</span>
				</div>
				<fieldset class="fs0 size1of1 clearfix">
					<input type="text" readonly value="f0010" class="unit size1of2" />
					<input type="text" maxlength="1" readonly value="&#xf0010;" class="unitRight size1of2 talign-right" />
				</fieldset>
				<div class="fs0 bshadow0 clearfix noLiga-true">
					<span class="unit pvs fgc1">liga: </span>
					<input type="text" readonly value="" class="liga unitRight" />
				</div>
			</div>
			<div class="glyph fs1">
				<div class="clearfix bshadow0 pbs">
					<span class="icon-arrow17"></span><span class="mls"> icon-arrow17</span>
				</div>
				<fieldset class="fs0 size1of1 clearfix">
					<input type="text" readonly value="f0011" class="unit size1of2" />
					<input type="text" maxlength="1" readonly value="&#xf0011;" class="unitRight size1of2 talign-right" />
				</fieldset>
				<div class="fs0 bshadow0 clearfix noLiga-true">
					<span class="unit pvs fgc1">liga: </span>
					<input type="text" readonly value="" class="liga unitRight" />
				</div>
			</div>
			<div class="glyph fs1">
				<div class="clearfix bshadow0 pbs">
					<span class="icon-arrow18"></span><span class="mls"> icon-arrow18</span>
				</div>
				<fieldset class="fs0 size1of1 clearfix">
					<input type="text" readonly value="f0012" class="unit size1of2" />
					<input type="text" maxlength="1" readonly value="&#xf0012;" class="unitRight size1of2 talign-right" />
				</fieldset>
				<div class="fs0 bshadow0 clearfix noLiga-true">
					<span class="unit pvs fgc1">liga: </span>
					<input type="text" readonly value="" class="liga unitRight" />
				</div>
			</div>
			<div class="glyph fs1">
				<div class="clearfix bshadow0 pbs">
					<span class="icon-arrow19"></span><span class="mls"> icon-arrow19</span>
				</div>
				<fieldset class="fs0 size1of1 clearfix">
					<input type="text" readonly value="f0013" class="unit size1of2" />
					<input type="text" maxlength="1" readonly value="&#xf0013;" class="unitRight size1of2 talign-right" />
				</fieldset>
				<div class="fs0 bshadow0 clearfix noLiga-true">
					<span class="unit pvs fgc1">liga: </span>
					<input type="text" readonly value="" class="liga unitRight" />
				</div>
			</div>
			<div class="glyph fs1">
				<div class="clearfix bshadow0 pbs">
					<span class="icon-arrow20"></span><span class="mls"> icon-arrow20</span>
				</div>
				<fieldset class="fs0 size1of1 clearfix">
					<input type="text" readonly value="f0014" class="unit size1of2" />
					<input type="text" maxlength="1" readonly value="&#xf0014;" class="unitRight size1of2 talign-right" />
				</fieldset>
				<div class="fs0 bshadow0 clearfix noLiga-true">
					<span class="unit pvs fgc1">liga: </span>
					<input type="text" readonly value="" class="liga unitRight" />
				</div>
			</div>
			<div class="glyph fs1">
				<div class="clearfix bshadow0 pbs">
					<span class="icon-arrow21"></span><span class="mls"> icon-arrow21</span>
				</div>
				<fieldset class="fs0 size1of1 clearfix">
					<input type="text" readonly value="f0015" class="unit size1of2" />
					<input type="text" maxlength="1" readonly value="&#xf0015;" class="unitRight size1of2 talign-right" />
				</fieldset>
				<div class="fs0 bshadow0 clearfix noLiga-true">
					<span class="unit pvs fgc1">liga: </span>
					<input type="text" readonly value="" class="liga unitRight" />
				</div>
			</div>
			<div class="glyph fs1">
				<div class="clearfix bshadow0 pbs">
					<span class="icon-arrow22"></span><span class="mls"> icon-arrow22</span>
				</div>
				<fieldset class="fs0 size1of1 clearfix">
					<input type="text" readonly value="f0016" class="unit size1of2" />
					<input type="text" maxlength="1" readonly value="&#xf0016;" class="unitRight size1of2 talign-right" />
				</fieldset>
				<div class="fs0 bshadow0 clearfix noLiga-true">
					<span class="unit pvs fgc1">liga: </span>
					<input type="text" readonly value="" class="liga unitRight" />
				</div>
			</div>
			<div class="glyph fs1">
				<div class="clearfix bshadow0 pbs">
					<span class="icon-arrow23"></span><span class="mls"> icon-arrow23</span>
				</div>
				<fieldset class="fs0 size1of1 clearfix">
					<input type="text" readonly value="f0017" class="unit size1of2" />
					<input type="text" maxlength="1" readonly value="&#xf0017;" class="unitRight size1of2 talign-right" />
				</fieldset>
				<div class="fs0 bshadow0 clearfix noLiga-true">
					<span class="unit pvs fgc1">liga: </span>
					<input type="text" readonly value="" class="liga unitRight" />
				</div>
			</div>
			<div class="glyph fs1">
				<div class="clearfix bshadow0 pbs">
					<span class="icon-arrow24"></span><span class="mls"> icon-arrow24</span>
				</div>
				<fieldset class="fs0 size1of1 clearfix">
					<input type="text" readonly value="f0018" class="unit size1of2" />
					<input type="text" maxlength="1" readonly value="&#xf0018;" class="unitRight size1of2 talign-right" />
				</fieldset>
				<div class="fs0 bshadow0 clearfix noLiga-true">
					<span class="unit pvs fgc1">liga: </span>
					<input type="text" readonly value="" class="liga unitRight" />
				</div>
			</div>
			<div class="glyph fs1">
				<div class="clearfix bshadow0 pbs">
					<span class="icon-arrow25"></span><span class="mls"> icon-arrow25</span>
				</div>
				<fieldset class="fs0 size1of1 clearfix">
					<input type="text" readonly value="f0019" class="unit size1of2" />
					<input type="text" maxlength="1" readonly value="&#xf0019;" class="unitRight size1of2 talign-right" />
				</fieldset>
				<div class="fs0 bshadow0 clearfix noLiga-true">
					<span class="unit pvs fgc1">liga: </span>
					<input type="text" readonly value="" class="liga unitRight" />
				</div>
			</div>
			<div class="glyph fs1">
				<div class="clearfix bshadow0 pbs">
					<span class="icon-arrow26"></span><span class="mls"> icon-arrow26</span>
				</div>
				<fieldset class="fs0 size1of1 clearfix">
					<input type="text" readonly value="f001a" class="unit size1of2" />
					<input type="text" maxlength="1" readonly value="&#xf001a;" class="unitRight size1of2 talign-right" />
				</fieldset>
				<div class="fs0 bshadow0 clearfix noLiga-true">
					<span class="unit pvs fgc1">liga: </span>
					<input type="text" readonly value="" class="liga unitRight" />
				</div>
			</div>
			<div class="glyph fs1">
				<div class="clearfix bshadow0 pbs">
					<span class="icon-arrow27"></span><span class="mls"> icon-arrow27</span>
				</div>
				<fieldset class="fs0 size1of1 clearfix">
					<input type="text" readonly value="f001b" class="unit size1of2" />
					<input type="text" maxlength="1" readonly value="&#xf001b;" class="unitRight size1of2 talign-right" />
				</fieldset>
				<div class="fs0 bshadow0 clearfix noLiga-true">
					<span class="unit pvs fgc1">liga: </span>
					<input type="text" readonly value="" class="liga unitRight" />
				</div>
			</div>
			<div class="glyph fs1">
				<div class="clearfix bshadow0 pbs">
					<span class="icon-arrow28"></span><span class="mls"> icon-arrow28</span>
				</div>
				<fieldset class="fs0 size1of1 clearfix">
					<input type="text" readonly value="f001c" class="unit size1of2" />
					<input type="text" maxlength="1" readonly value="&#xf001c;" class="unitRight size1of2 talign-right" />
				</fieldset>
				<div class="fs0 bshadow0 clearfix noLiga-true">
					<span class="unit pvs fgc1">liga: </span>
					<input type="text" readonly value="" class="liga unitRight" />
				</div>
			</div>
			<div class="glyph fs1">
				<div class="clearfix bshadow0 pbs">
					<span class="icon-arrow29"></span><span class="mls"> icon-arrow29</span>
				</div>
				<fieldset class="fs0 size1of1 clearfix">
					<input type="text" readonly value="f001d" class="unit size1of2" />
					<input type="text" maxlength="1" readonly value="&#xf001d;" class="unitRight size1of2 talign-right" />
				</fieldset>
				<div class="fs0 bshadow0 clearfix noLiga-true">
					<span class="unit pvs fgc1">liga: </span>
					<input type="text" readonly value="" class="liga unitRight" />
				</div>
			</div>
			<div class="glyph fs1">
				<div class="clearfix bshadow0 pbs">
					<span class="icon-arrow30"></span><span class="mls"> icon-arrow30</span>
				</div>
				<fieldset class="fs0 size1of1 clearfix">
					<input type="text" readonly value="f001e" class="unit size1of2" />
					<input type="text" maxlength="1" readonly value="&#xf001e;" class="unitRight size1of2 talign-right" />
				</fieldset>
				<div class="fs0 bshadow0 clearfix noLiga-true">
					<span class="unit pvs fgc1">liga: </span>
					<input type="text" readonly value="" class="liga unitRight" />
				</div>
			</div>
			<div class="glyph fs1">
				<div class="clearfix bshadow0 pbs">
					<span class="icon-arrow31"></span><span class="mls"> icon-arrow31</span>
				</div>
				<fieldset class="fs0 size1of1 clearfix">
					<input type="text" readonly value="f001f" class="unit size1of2" />
					<input type="text" maxlength="1" readonly value="&#xf001f;" class="unitRight size1of2 talign-right" />
				</fieldset>
				<div class="fs0 bshadow0 clearfix noLiga-true">
					<span class="unit pvs fgc1">liga: </span>
					<input type="text" readonly value="" class="liga unitRight" />
				</div>
			</div>
			<div class="glyph fs1">
				<div class="clearfix bshadow0 pbs">
					<span class="icon-arrow32"></span><span class="mls"> icon-arrow32</span>
				</div>
				<fieldset class="fs0 size1of1 clearfix">
					<input type="text" readonly value="f0020" class="unit size1of2" />
					<input type="text" maxlength="1" readonly value="&#xf0020;" class="unitRight size1of2 talign-right" />
				</fieldset>
				<div class="fs0 bshadow0 clearfix noLiga-true">
					<span class="unit pvs fgc1">liga: </span>
					<input type="text" readonly value="" class="liga unitRight" />
				</div>
			</div>
			<div class="glyph fs1">
				<div class="clearfix bshadow0 pbs">
					<span class="icon-arrow33"></span><span class="mls"> icon-arrow33</span>
				</div>
				<fieldset class="fs0 size1of1 clearfix">
					<input type="text" readonly value="f0021" class="unit size1of2" />
					<input type="text" maxlength="1" readonly value="&#xf0021;" class="unitRight size1of2 talign-right" />
				</fieldset>
				<div class="fs0 bshadow0 clearfix noLiga-true">
					<span class="unit pvs fgc1">liga: </span>
					<input type="text" readonly value="" class="liga unitRight" />
				</div>
			</div>
			<div class="glyph fs1">
				<div class="clearfix bshadow0 pbs">
					<span class="icon-arrow34"></span><span class="mls"> icon-arrow34</span>
				</div>
				<fieldset class="fs0 size1of1 clearfix">
					<input type="text" readonly value="f0022" class="unit size1of2" />
					<input type="text" maxlength="1" readonly value="&#xf0022;" class="unitRight size1of2 talign-right" />
				</fieldset>
				<div class="fs0 bshadow0 clearfix noLiga-true">
					<span class="unit pvs fgc1">liga: </span>
					<input type="text" readonly value="" class="liga unitRight" />
				</div>
			</div>
			<div class="glyph fs1">
				<div class="clearfix bshadow0 pbs">
					<span class="icon-arrow35"></span><span class="mls"> icon-arrow35</span>
				</div>
				<fieldset class="fs0 size1of1 clearfix">
					<input type="text" readonly value="f0023" class="unit size1of2" />
					<input type="text" maxlength="1" readonly value="&#xf0023;" class="unitRight size1of2 talign-right" />
				</fieldset>
				<div class="fs0 bshadow0 clearfix noLiga-true">
					<span class="unit pvs fgc1">liga: </span>
					<input type="text" readonly value="" class="liga unitRight" />
				</div>
			</div>
			<div class="glyph fs1">
				<div class="clearfix bshadow0 pbs">
					<span class="icon-arrow36"></span><span class="mls"> icon-arrow36</span>
				</div>
				<fieldset class="fs0 size1of1 clearfix">
					<input type="text" readonly value="f0024" class="unit size1of2" />
					<input type="text" maxlength="1" readonly value="&#xf0024;" class="unitRight size1of2 talign-right" />
				</fieldset>
				<div class="fs0 bshadow0 clearfix noLiga-true">
					<span class="unit pvs fgc1">liga: </span>
					<input type="text" readonly value="" class="liga unitRight" />
				</div>
			</div>
			<div class="glyph fs1">
				<div class="clearfix bshadow0 pbs">
					<span class="icon-arrow37"></span><span class="mls"> icon-arrow37</span>
				</div>
				<fieldset class="fs0 size1of1 clearfix">
					<input type="text" readonly value="f0025" class="unit size1of2" />
					<input type="text" maxlength="1" readonly value="&#xf0025;" class="unitRight size1of2 talign-right" />
				</fieldset>
				<div class="fs0 bshadow0 clearfix noLiga-true">
					<span class="unit pvs fgc1">liga: </span>
					<input type="text" readonly value="" class="liga unitRight" />
				</div>
			</div>
			<div class="glyph fs1">
				<div class="clearfix bshadow0 pbs">
					<span class="icon-uni3F"></span><span class="mls"> icon-uni3F</span>
				</div>
				<fieldset class="fs0 size1of1 clearfix">
					<input type="text" readonly value="f0026" class="unit size1of2" />
					<input type="text" maxlength="1" readonly value="&#xf0026;" class="unitRight size1of2 talign-right" />
				</fieldset>
				<div class="fs0 bshadow0 clearfix noLiga-true">
					<span class="unit pvs fgc1">liga: </span>
					<input type="text" readonly value="" class="liga unitRight" />
				</div>
			</div>
			<div class="glyph fs1">
				<div class="clearfix bshadow0 pbs">
					<span class="icon-uni40"></span><span class="mls"> icon-uni40</span>
				</div>
				<fieldset class="fs0 size1of1 clearfix">
					<input type="text" readonly value="f0027" class="unit size1of2" />
					<input type="text" maxlength="1" readonly value="&#xf0027;" class="unitRight size1of2 talign-right" />
				</fieldset>
				<div class="fs0 bshadow0 clearfix noLiga-true">
					<span class="unit pvs fgc1">liga: </span>
					<input type="text" readonly value="" class="liga unitRight" />
				</div>
			</div>
			<div class="glyph fs1">
				<div class="clearfix bshadow0 pbs">
					<span class="icon-uni43"></span><span class="mls"> icon-uni43</span>
				</div>
				<fieldset class="fs0 size1of1 clearfix">
					<input type="text" readonly value="f0028" class="unit size1of2" />
					<input type="text" maxlength="1" readonly value="&#xf0028;" class="unitRight size1of2 talign-right" />
				</fieldset>
				<div class="fs0 bshadow0 clearfix noLiga-true">
					<span class="unit pvs fgc1">liga: </span>
					<input type="text" readonly value="" class="liga unitRight" />
				</div>
			</div>
			<div class="glyph fs1">
				<div class="clearfix bshadow0 pbs">
					<span class="icon-uni44"></span><span class="mls"> icon-uni44</span>
				</div>
				<fieldset class="fs0 size1of1 clearfix">
					<input type="text" readonly value="f0029" class="unit size1of2" />
					<input type="text" maxlength="1" readonly value="&#xf0029;" class="unitRight size1of2 talign-right" />
				</fieldset>
				<div class="fs0 bshadow0 clearfix noLiga-true">
					<span class="unit pvs fgc1">liga: </span>
					<input type="text" readonly value="" class="liga unitRight" />
				</div>
			</div>
			<div class="glyph fs1">
				<div class="clearfix bshadow0 pbs">
					<span class="icon-uniE00D"></span><span class="mls"> icon-uniE00D</span>
				</div>
				<fieldset class="fs0 size1of1 clearfix">
					<input type="text" readonly value="f002a" class="unit size1of2" />
					<input type="text" maxlength="1" readonly value="&#xf002a;" class="unitRight size1of2 talign-right" />
				</fieldset>
				<div class="fs0 bshadow0 clearfix noLiga-true">
					<span class="unit pvs fgc1">liga: </span>
					<input type="text" readonly value="" class="liga unitRight" />
				</div>
			</div>
			<div class="glyph fs1">
				<div class="clearfix bshadow0 pbs">
					<span class="icon-uniE00E"></span><span class="mls"> icon-uniE00E</span>
				</div>
				<fieldset class="fs0 size1of1 clearfix">
					<input type="text" readonly value="f002b" class="unit size1of2" />
					<input type="text" maxlength="1" readonly value="&#xf002b;" class="unitRight size1of2 talign-right" />
				</fieldset>
				<div class="fs0 bshadow0 clearfix noLiga-true">
					<span class="unit pvs fgc1">liga: </span>
					<input type="text" readonly value="" class="liga unitRight" />
				</div>
			</div>
			<div class="glyph fs1">
				<div class="clearfix bshadow0 pbs">
					<span class="icon-uniE011"></span><span class="mls"> icon-uniE011</span>
				</div>
				<fieldset class="fs0 size1of1 clearfix">
					<input type="text" readonly value="f002c" class="unit size1of2" />
					<input type="text" maxlength="1" readonly value="&#xf002c;" class="unitRight size1of2 talign-right" />
				</fieldset>
				<div class="fs0 bshadow0 clearfix noLiga-true">
					<span class="unit pvs fgc1">liga: </span>
					<input type="text" readonly value="" class="liga unitRight" />
				</div>
			</div>
			<div class="glyph fs1">
				<div class="clearfix bshadow0 pbs">
					<span class="icon-uniE012"></span><span class="mls"> icon-uniE012</span>
				</div>
				<fieldset class="fs0 size1of1 clearfix">
					<input type="text" readonly value="f002d" class="unit size1of2" />
					<input type="text" maxlength="1" readonly value="&#xf002d;" class="unitRight size1of2 talign-right" />
				</fieldset>
				<div class="fs0 bshadow0 clearfix noLiga-true">
					<span class="unit pvs fgc1">liga: </span>
					<input type="text" readonly value="" class="liga unitRight" />
				</div>
			</div>
			<div class="glyph fs1">
				<div class="clearfix bshadow0 pbs">
					<span class="icon-uniE013"></span><span class="mls"> icon-uniE013</span>
				</div>
				<fieldset class="fs0 size1of1 clearfix">
					<input type="text" readonly value="f002e" class="unit size1of2" />
					<input type="text" maxlength="1" readonly value="&#xf002e;" class="unitRight size1of2 talign-right" />
				</fieldset>
				<div class="fs0 bshadow0 clearfix noLiga-true">
					<span class="unit pvs fgc1">liga: </span>
					<input type="text" readonly value="" class="liga unitRight" />
				</div>
			</div>
			<div class="glyph fs1">
				<div class="clearfix bshadow0 pbs">
					<span class="icon-uniE014"></span><span class="mls"> icon-uniE014</span>
				</div>
				<fieldset class="fs0 size1of1 clearfix">
					<input type="text" readonly value="f002f" class="unit size1of2" />
					<input type="text" maxlength="1" readonly value="&#xf002f;" class="unitRight size1of2 talign-right" />
				</fieldset>
				<div class="fs0 bshadow0 clearfix noLiga-true">
					<span class="unit pvs fgc1">liga: </span>
					<input type="text" readonly value="" class="liga unitRight" />
				</div>
			</div>
			<div class="glyph fs1">
				<div class="clearfix bshadow0 pbs">
					<span class="icon-uni52"></span><span class="mls"> icon-uni52</span>
				</div>
				<fieldset class="fs0 size1of1 clearfix">
					<input type="text" readonly value="f0030" class="unit size1of2" />
					<input type="text" maxlength="1" readonly value="&#xf0030;" class="unitRight size1of2 talign-right" />
				</fieldset>
				<div class="fs0 bshadow0 clearfix noLiga-true">
					<span class="unit pvs fgc1">liga: </span>
					<input type="text" readonly value="" class="liga unitRight" />
				</div>
			</div>
			<div class="glyph fs1">
				<div class="clearfix bshadow0 pbs">
					<span class="icon-uni53"></span><span class="mls"> icon-uni53</span>
				</div>
				<fieldset class="fs0 size1of1 clearfix">
					<input type="text" readonly value="f0031" class="unit size1of2" />
					<input type="text" maxlength="1" readonly value="&#xf0031;" class="unitRight size1of2 talign-right" />
				</fieldset>
				<div class="fs0 bshadow0 clearfix noLiga-true">
					<span class="unit pvs fgc1">liga: </span>
					<input type="text" readonly value="" class="liga unitRight" />
				</div>
			</div>
			<div class="glyph fs1">
				<div class="clearfix bshadow0 pbs">
					<span class="icon-arrow38"></span><span class="mls"> icon-arrow38</span>
				</div>
				<fieldset class="fs0 size1of1 clearfix">
					<input type="text" readonly value="f0032" class="unit size1of2" />
					<input type="text" maxlength="1" readonly value="&#xf0032;" class="unitRight size1of2 talign-right" />
				</fieldset>
				<div class="fs0 bshadow0 clearfix noLiga-true">
					<span class="unit pvs fgc1">liga: </span>
					<input type="text" readonly value="" class="liga unitRight" />
				</div>
			</div>
			<div class="glyph fs1">
				<div class="clearfix bshadow0 pbs">
					<span class="icon-uni57"></span><span class="mls"> icon-uni57</span>
				</div>
				<fieldset class="fs0 size1of1 clearfix">
					<input type="text" readonly value="f0033" class="unit size1of2" />
					<input type="text" maxlength="1" readonly value="&#xf0033;" class="unitRight size1of2 talign-right" />
				</fieldset>
				<div class="fs0 bshadow0 clearfix noLiga-true">
					<span class="unit pvs fgc1">liga: </span>
					<input type="text" readonly value="" class="liga unitRight" />
				</div>
			</div>
			<div class="glyph fs1">
				<div class="clearfix bshadow0 pbs">
					<span class="icon-arrow39"></span><span class="mls"> icon-arrow39</span>
				</div>
				<fieldset class="fs0 size1of1 clearfix">
					<input type="text" readonly value="f0034" class="unit size1of2" />
					<input type="text" maxlength="1" readonly value="&#xf0034;" class="unitRight size1of2 talign-right" />
				</fieldset>
				<div class="fs0 bshadow0 clearfix noLiga-true">
					<span class="unit pvs fgc1">liga: </span>
					<input type="text" readonly value="" class="liga unitRight" />
				</div>
			</div>
			<div class="glyph fs1">
				<div class="clearfix bshadow0 pbs">
					<span class="icon-uni56"></span><span class="mls"> icon-uni56</span>
				</div>
				<fieldset class="fs0 size1of1 clearfix">
					<input type="text" readonly value="f0035" class="unit size1of2" />
					<input type="text" maxlength="1" readonly value="&#xf0035;" class="unitRight size1of2 talign-right" />
				</fieldset>
				<div class="fs0 bshadow0 clearfix noLiga-true">
					<span class="unit pvs fgc1">liga: </span>
					<input type="text" readonly value="" class="liga unitRight" />
				</div>
			</div>
			<div class="glyph fs1">
				<div class="clearfix bshadow0 pbs">
					<span class="icon-arrow40"></span><span class="mls"> icon-arrow40</span>
				</div>
				<fieldset class="fs0 size1of1 clearfix">
					<input type="text" readonly value="f0036" class="unit size1of2" />
					<input type="text" maxlength="1" readonly value="&#xf0036;" class="unitRight size1of2 talign-right" />
				</fieldset>
				<div class="fs0 bshadow0 clearfix noLiga-true">
					<span class="unit pvs fgc1">liga: </span>
					<input type="text" readonly value="" class="liga unitRight" />
				</div>
			</div>
			<div class="glyph fs1">
				<div class="clearfix bshadow0 pbs">
					<span class="icon-uniE010"></span><span class="mls"> icon-uniE010</span>
				</div>
				<fieldset class="fs0 size1of1 clearfix">
					<input type="text" readonly value="f0037" class="unit size1of2" />
					<input type="text" maxlength="1" readonly value="&#xf0037;" class="unitRight size1of2 talign-right" />
				</fieldset>
				<div class="fs0 bshadow0 clearfix noLiga-true">
					<span class="unit pvs fgc1">liga: </span>
					<input type="text" readonly value="" class="liga unitRight" />
				</div>
			</div>
			<div class="glyph fs1">
				<div class="clearfix bshadow0 pbs">
					<span class="icon-uniE00F"></span><span class="mls"> icon-uniE00F</span>
				</div>
				<fieldset class="fs0 size1of1 clearfix">
					<input type="text" readonly value="f0038" class="unit size1of2" />
					<input type="text" maxlength="1" readonly value="&#xf0038;" class="unitRight size1of2 talign-right" />
				</fieldset>
				<div class="fs0 bshadow0 clearfix noLiga-true">
					<span class="unit pvs fgc1">liga: </span>
					<input type="text" readonly value="" class="liga unitRight" />
				</div>
			</div>
			<div class="glyph fs1">
				<div class="clearfix bshadow0 pbs">
					<span class="icon-arrow41"></span><span class="mls"> icon-arrow41</span>
				</div>
				<fieldset class="fs0 size1of1 clearfix">
					<input type="text" readonly value="f0039" class="unit size1of2" />
					<input type="text" maxlength="1" readonly value="&#xf0039;" class="unitRight size1of2 talign-right" />
				</fieldset>
				<div class="fs0 bshadow0 clearfix noLiga-true">
					<span class="unit pvs fgc1">liga: </span>
					<input type="text" readonly value="" class="liga unitRight" />
				</div>
			</div>
			<div class="glyph fs1">
				<div class="clearfix bshadow0 pbs">
					<span class="icon-arrow42"></span><span class="mls"> icon-arrow42</span>
				</div>
				<fieldset class="fs0 size1of1 clearfix">
					<input type="text" readonly value="f003a" class="unit size1of2" />
					<input type="text" maxlength="1" readonly value="&#xf003a;" class="unitRight size1of2 talign-right" />
				</fieldset>
				<div class="fs0 bshadow0 clearfix noLiga-true">
					<span class="unit pvs fgc1">liga: </span>
					<input type="text" readonly value="" class="liga unitRight" />
				</div>
			</div>
			<div class="glyph fs1">
				<div class="clearfix bshadow0 pbs">
					<span class="icon-arrow43"></span><span class="mls"> icon-arrow43</span>
				</div>
				<fieldset class="fs0 size1of1 clearfix">
					<input type="text" readonly value="f003b" class="unit size1of2" />
					<input type="text" maxlength="1" readonly value="&#xf003b;" class="unitRight size1of2 talign-right" />
				</fieldset>
				<div class="fs0 bshadow0 clearfix noLiga-true">
					<span class="unit pvs fgc1">liga: </span>
					<input type="text" readonly value="" class="liga unitRight" />
				</div>
			</div>
			<div class="glyph fs1">
				<div class="clearfix bshadow0 pbs">
					<span class="icon-arrow44"></span><span class="mls"> icon-arrow44</span>
				</div>
				<fieldset class="fs0 size1of1 clearfix">
					<input type="text" readonly value="f003c" class="unit size1of2" />
					<input type="text" maxlength="1" readonly value="&#xf003c;" class="unitRight size1of2 talign-right" />
				</fieldset>
				<div class="fs0 bshadow0 clearfix noLiga-true">
					<span class="unit pvs fgc1">liga: </span>
					<input type="text" readonly value="" class="liga unitRight" />
				</div>
			</div>
			<div class="glyph fs1">
				<div class="clearfix bshadow0 pbs">
					<span class="icon-user1"></span><span class="mls"> icon-user1</span>
				</div>
				<fieldset class="fs0 size1of1 clearfix">
					<input type="text" readonly value="f1001" class="unit size1of2" />
					<input type="text" maxlength="1" readonly value="&#xf1001;" class="unitRight size1of2 talign-right" />
				</fieldset>
				<div class="fs0 bshadow0 clearfix noLiga-true">
					<span class="unit pvs fgc1">liga: </span>
					<input type="text" readonly value="" class="liga unitRight" />
				</div>
			</div>
			<div class="glyph fs1">
				<div class="clearfix bshadow0 pbs">
					<span class="icon-user2"></span><span class="mls"> icon-user2</span>
				</div>
				<fieldset class="fs0 size1of1 clearfix">
					<input type="text" readonly value="f1002" class="unit size1of2" />
					<input type="text" maxlength="1" readonly value="&#xf1002;" class="unitRight size1of2 talign-right" />
				</fieldset>
				<div class="fs0 bshadow0 clearfix noLiga-true">
					<span class="unit pvs fgc1">liga: </span>
					<input type="text" readonly value="" class="liga unitRight" />
				</div>
			</div>
			<div class="glyph fs1">
				<div class="clearfix bshadow0 pbs">
					<span class="icon-user3"></span><span class="mls"> icon-user3</span>
				</div>
				<fieldset class="fs0 size1of1 clearfix">
					<input type="text" readonly value="f1003" class="unit size1of2" />
					<input type="text" maxlength="1" readonly value="&#xf1003;" class="unitRight size1of2 talign-right" />
				</fieldset>
				<div class="fs0 bshadow0 clearfix noLiga-true">
					<span class="unit pvs fgc1">liga: </span>
					<input type="text" readonly value="" class="liga unitRight" />
				</div>
			</div>
			<div class="glyph fs1">
				<div class="clearfix bshadow0 pbs">
					<span class="icon-user4"></span><span class="mls"> icon-user4</span>
				</div>
				<fieldset class="fs0 size1of1 clearfix">
					<input type="text" readonly value="f1004" class="unit size1of2" />
					<input type="text" maxlength="1" readonly value="&#xf1004;" class="unitRight size1of2 talign-right" />
				</fieldset>
				<div class="fs0 bshadow0 clearfix noLiga-true">
					<span class="unit pvs fgc1">liga: </span>
					<input type="text" readonly value="" class="liga unitRight" />
				</div>
			</div>
			<div class="glyph fs1">
				<div class="clearfix bshadow0 pbs">
					<span class="icon-user5"></span><span class="mls"> icon-user5</span>
				</div>
				<fieldset class="fs0 size1of1 clearfix">
					<input type="text" readonly value="f1005" class="unit size1of2" />
					<input type="text" maxlength="1" readonly value="&#xf1005;" class="unitRight size1of2 talign-right" />
				</fieldset>
				<div class="fs0 bshadow0 clearfix noLiga-true">
					<span class="unit pvs fgc1">liga: </span>
					<input type="text" readonly value="" class="liga unitRight" />
				</div>
			</div>
			<div class="glyph fs1">
				<div class="clearfix bshadow0 pbs">
					<span class="icon-user6"></span><span class="mls"> icon-user6</span>
				</div>
				<fieldset class="fs0 size1of1 clearfix">
					<input type="text" readonly value="f1006" class="unit size1of2" />
					<input type="text" maxlength="1" readonly value="&#xf1006;" class="unitRight size1of2 talign-right" />
				</fieldset>
				<div class="fs0 bshadow0 clearfix noLiga-true">
					<span class="unit pvs fgc1">liga: </span>
					<input type="text" readonly value="" class="liga unitRight" />
				</div>
			</div>
			<div class="glyph fs1">
				<div class="clearfix bshadow0 pbs">
					<span class="icon-user7"></span><span class="mls"> icon-user7</span>
				</div>
				<fieldset class="fs0 size1of1 clearfix">
					<input type="text" readonly value="f1007" class="unit size1of2" />
					<input type="text" maxlength="1" readonly value="&#xf1007;" class="unitRight size1of2 talign-right" />
				</fieldset>
				<div class="fs0 bshadow0 clearfix noLiga-true">
					<span class="unit pvs fgc1">liga: </span>
					<input type="text" readonly value="" class="liga unitRight" />
				</div>
			</div>
			<div class="glyph fs1">
				<div class="clearfix bshadow0 pbs">
					<span class="icon-user8"></span><span class="mls"> icon-user8</span>
				</div>
				<fieldset class="fs0 size1of1 clearfix">
					<input type="text" readonly value="f1008" class="unit size1of2" />
					<input type="text" maxlength="1" readonly value="&#xf1008;" class="unitRight size1of2 talign-right" />
				</fieldset>
				<div class="fs0 bshadow0 clearfix noLiga-true">
					<span class="unit pvs fgc1">liga: </span>
					<input type="text" readonly value="" class="liga unitRight" />
				</div>
			</div>
			<div class="glyph fs1">
				<div class="clearfix bshadow0 pbs">
					<span class="icon-user9"></span><span class="mls"> icon-user9</span>
				</div>
				<fieldset class="fs0 size1of1 clearfix">
					<input type="text" readonly value="f1009" class="unit size1of2" />
					<input type="text" maxlength="1" readonly value="&#xf1009;" class="unitRight size1of2 talign-right" />
				</fieldset>
				<div class="fs0 bshadow0 clearfix noLiga-true">
					<span class="unit pvs fgc1">liga: </span>
					<input type="text" readonly value="" class="liga unitRight" />
				</div>
			</div>
			<div class="glyph fs1">
				<div class="clearfix bshadow0 pbs">
					<span class="icon-user10"></span><span class="mls"> icon-user10</span>
				</div>
				<fieldset class="fs0 size1of1 clearfix">
					<input type="text" readonly value="f100a" class="unit size1of2" />
					<input type="text" maxlength="1" readonly value="&#xf100a;" class="unitRight size1of2 talign-right" />
				</fieldset>
				<div class="fs0 bshadow0 clearfix noLiga-true">
					<span class="unit pvs fgc1">liga: </span>
					<input type="text" readonly value="" class="liga unitRight" />
				</div>
			</div>
			<div class="glyph fs1">
				<div class="clearfix bshadow0 pbs">
					<span class="icon-uF00D4"></span><span class="mls"> icon-uF00D4</span>
				</div>
				<fieldset class="fs0 size1of1 clearfix">
					<input type="text" readonly value="f100b" class="unit size1of2" />
					<input type="text" maxlength="1" readonly value="&#xf100b;" class="unitRight size1of2 talign-right" />
				</fieldset>
				<div class="fs0 bshadow0 clearfix noLiga-true">
					<span class="unit pvs fgc1">liga: </span>
					<input type="text" readonly value="" class="liga unitRight" />
				</div>
			</div>
			<div class="glyph fs1">
				<div class="clearfix bshadow0 pbs">
					<span class="icon-uF015A"></span><span class="mls"> icon-uF015A</span>
				</div>
				<fieldset class="fs0 size1of1 clearfix">
					<input type="text" readonly value="f100c" class="unit size1of2" />
					<input type="text" maxlength="1" readonly value="&#xf100c;" class="unitRight size1of2 talign-right" />
				</fieldset>
				<div class="fs0 bshadow0 clearfix noLiga-true">
					<span class="unit pvs fgc1">liga: </span>
					<input type="text" readonly value="" class="liga unitRight" />
				</div>
			</div>
			<div class="glyph fs1">
				<div class="clearfix bshadow0 pbs">
					<span class="icon-uF000C"></span><span class="mls"> icon-uF000C</span>
				</div>
				<fieldset class="fs0 size1of1 clearfix">
					<input type="text" readonly value="f100d" class="unit size1of2" />
					<input type="text" maxlength="1" readonly value="&#xf100d;" class="unitRight size1of2 talign-right" />
				</fieldset>
				<div class="fs0 bshadow0 clearfix noLiga-true">
					<span class="unit pvs fgc1">liga: </span>
					<input type="text" readonly value="" class="liga unitRight" />
				</div>
			</div>
			<div class="glyph fs1">
				<div class="clearfix bshadow0 pbs">
					<span class="icon-uni24"></span><span class="mls"> icon-uni24</span>
				</div>
				<fieldset class="fs0 size1of1 clearfix">
					<input type="text" readonly value="f100e" class="unit size1of2" />
					<input type="text" maxlength="1" readonly value="&#xf100e;" class="unitRight size1of2 talign-right" />
				</fieldset>
				<div class="fs0 bshadow0 clearfix noLiga-true">
					<span class="unit pvs fgc1">liga: </span>
					<input type="text" readonly value="" class="liga unitRight" />
				</div>
			</div>
			<div class="glyph fs1">
				<div class="clearfix bshadow0 pbs">
					<span class="icon-uni343A"></span><span class="mls"> icon-uni343A</span>
				</div>
				<fieldset class="fs0 size1of1 clearfix">
					<input type="text" readonly value="f100f" class="unit size1of2" />
					<input type="text" maxlength="1" readonly value="&#xf100f;" class="unitRight size1of2 talign-right" />
				</fieldset>
				<div class="fs0 bshadow0 clearfix noLiga-true">
					<span class="unit pvs fgc1">liga: </span>
					<input type="text" readonly value="" class="liga unitRight" />
				</div>
			</div>
			<div class="glyph fs1">
				<div class="clearfix bshadow0 pbs">
					<span class="icon-uF00E4"></span><span class="mls"> icon-uF00E4</span>
				</div>
				<fieldset class="fs0 size1of1 clearfix">
					<input type="text" readonly value="f1010" class="unit size1of2" />
					<input type="text" maxlength="1" readonly value="&#xf1010;" class="unitRight size1of2 talign-right" />
				</fieldset>
				<div class="fs0 bshadow0 clearfix noLiga-true">
					<span class="unit pvs fgc1">liga: </span>
					<input type="text" readonly value="" class="liga unitRight" />
				</div>
			</div>
			<div class="glyph fs1">
				<div class="clearfix bshadow0 pbs">
					<span class="icon-uni343D"></span><span class="mls"> icon-uni343D</span>
				</div>
				<fieldset class="fs0 size1of1 clearfix">
					<input type="text" readonly value="f1011" class="unit size1of2" />
					<input type="text" maxlength="1" readonly value="&#xf1011;" class="unitRight size1of2 talign-right" />
				</fieldset>
				<div class="fs0 bshadow0 clearfix noLiga-true">
					<span class="unit pvs fgc1">liga: </span>
					<input type="text" readonly value="" class="liga unitRight" />
				</div>
			</div>
			<div class="glyph fs1">
				<div class="clearfix bshadow0 pbs">
					<span class="icon-uF00A9"></span><span class="mls"> icon-uF00A9</span>
				</div>
				<fieldset class="fs0 size1of1 clearfix">
					<input type="text" readonly value="f1012" class="unit size1of2" />
					<input type="text" maxlength="1" readonly value="&#xf1012;" class="unitRight size1of2 talign-right" />
				</fieldset>
				<div class="fs0 bshadow0 clearfix noLiga-true">
					<span class="unit pvs fgc1">liga: </span>
					<input type="text" readonly value="" class="liga unitRight" />
				</div>
			</div>
			<div class="glyph fs1">
				<div class="clearfix bshadow0 pbs">
					<span class="icon-uni26"></span><span class="mls"> icon-uni26</span>
				</div>
				<fieldset class="fs0 size1of1 clearfix">
					<input type="text" readonly value="f1013" class="unit size1of2" />
					<input type="text" maxlength="1" readonly value="&#xf1013;" class="unitRight size1of2 talign-right" />
				</fieldset>
				<div class="fs0 bshadow0 clearfix noLiga-true">
					<span class="unit pvs fgc1">liga: </span>
					<input type="text" readonly value="" class="liga unitRight" />
				</div>
			</div>
			<div class="glyph fs1">
				<div class="clearfix bshadow0 pbs">
					<span class="icon-uni3445"></span><span class="mls"> icon-uni3445</span>
				</div>
				<fieldset class="fs0 size1of1 clearfix">
					<input type="text" readonly value="f1014" class="unit size1of2" />
					<input type="text" maxlength="1" readonly value="&#xf1014;" class="unitRight size1of2 talign-right" />
				</fieldset>
				<div class="fs0 bshadow0 clearfix noLiga-true">
					<span class="unit pvs fgc1">liga: </span>
					<input type="text" readonly value="" class="liga unitRight" />
				</div>
			</div>
			<div class="glyph fs1">
				<div class="clearfix bshadow0 pbs">
					<span class="icon-uF014B"></span><span class="mls"> icon-uF014B</span>
				</div>
				<fieldset class="fs0 size1of1 clearfix">
					<input type="text" readonly value="f1015" class="unit size1of2" />
					<input type="text" maxlength="1" readonly value="&#xf1015;" class="unitRight size1of2 talign-right" />
				</fieldset>
				<div class="fs0 bshadow0 clearfix noLiga-true">
					<span class="unit pvs fgc1">liga: </span>
					<input type="text" readonly value="" class="liga unitRight" />
				</div>
			</div>
			<div class="glyph fs1">
				<div class="clearfix bshadow0 pbs">
					<span class="icon-uF002E"></span><span class="mls"> icon-uF002E</span>
				</div>
				<fieldset class="fs0 size1of1 clearfix">
					<input type="text" readonly value="f1016" class="unit size1of2" />
					<input type="text" maxlength="1" readonly value="&#xf1016;" class="unitRight size1of2 talign-right" />
				</fieldset>
				<div class="fs0 bshadow0 clearfix noLiga-true">
					<span class="unit pvs fgc1">liga: </span>
					<input type="text" readonly value="" class="liga unitRight" />
				</div>
			</div>
			<div class="glyph fs1">
				<div class="clearfix bshadow0 pbs">
					<span class="icon-uni3435"></span><span class="mls"> icon-uni3435</span>
				</div>
				<fieldset class="fs0 size1of1 clearfix">
					<input type="text" readonly value="f1017" class="unit size1of2" />
					<input type="text" maxlength="1" readonly value="&#xf1017;" class="unitRight size1of2 talign-right" />
				</fieldset>
				<div class="fs0 bshadow0 clearfix noLiga-true">
					<span class="unit pvs fgc1">liga: </span>
					<input type="text" readonly value="" class="liga unitRight" />
				</div>
			</div>
			<div class="glyph fs1">
				<div class="clearfix bshadow0 pbs">
					<span class="icon-uF008E"></span><span class="mls"> icon-uF008E</span>
				</div>
				<fieldset class="fs0 size1of1 clearfix">
					<input type="text" readonly value="f1018" class="unit size1of2" />
					<input type="text" maxlength="1" readonly value="&#xf1018;" class="unitRight size1of2 talign-right" />
				</fieldset>
				<div class="fs0 bshadow0 clearfix noLiga-true">
					<span class="unit pvs fgc1">liga: </span>
					<input type="text" readonly value="" class="liga unitRight" />
				</div>
			</div>
			<div class="glyph fs1">
				<div class="clearfix bshadow0 pbs">
					<span class="icon-uF008B"></span><span class="mls"> icon-uF008B</span>
				</div>
				<fieldset class="fs0 size1of1 clearfix">
					<input type="text" readonly value="f1019" class="unit size1of2" />
					<input type="text" maxlength="1" readonly value="&#xf1019;" class="unitRight size1of2 talign-right" />
				</fieldset>
				<div class="fs0 bshadow0 clearfix noLiga-true">
					<span class="unit pvs fgc1">liga: </span>
					<input type="text" readonly value="" class="liga unitRight" />
				</div>
			</div>
			<div class="glyph fs1">
				<div class="clearfix bshadow0 pbs">
					<span class="icon-uF008C"></span><span class="mls"> icon-uF008C</span>
				</div>
				<fieldset class="fs0 size1of1 clearfix">
					<input type="text" readonly value="f101a" class="unit size1of2" />
					<input type="text" maxlength="1" readonly value="&#xf101a;" class="unitRight size1of2 talign-right" />
				</fieldset>
				<div class="fs0 bshadow0 clearfix noLiga-true">
					<span class="unit pvs fgc1">liga: </span>
					<input type="text" readonly value="" class="liga unitRight" />
				</div>
			</div>
			<div class="glyph fs1">
				<div class="clearfix bshadow0 pbs">
					<span class="icon-uni5C"></span><span class="mls"> icon-uni5C</span>
				</div>
				<fieldset class="fs0 size1of1 clearfix">
					<input type="text" readonly value="f101b" class="unit size1of2" />
					<input type="text" maxlength="1" readonly value="&#xf101b;" class="unitRight size1of2 talign-right" />
				</fieldset>
				<div class="fs0 bshadow0 clearfix noLiga-true">
					<span class="unit pvs fgc1">liga: </span>
					<input type="text" readonly value="" class="liga unitRight" />
				</div>
			</div>
			<div class="glyph fs1">
				<div class="clearfix bshadow0 pbs">
					<span class="icon-uni5D"></span><span class="mls"> icon-uni5D</span>
				</div>
				<fieldset class="fs0 size1of1 clearfix">
					<input type="text" readonly value="f101c" class="unit size1of2" />
					<input type="text" maxlength="1" readonly value="&#xf101c;" class="unitRight size1of2 talign-right" />
				</fieldset>
				<div class="fs0 bshadow0 clearfix noLiga-true">
					<span class="unit pvs fgc1">liga: </span>
					<input type="text" readonly value="" class="liga unitRight" />
				</div>
			</div>
			<div class="glyph fs1">
				<div class="clearfix bshadow0 pbs">
					<span class="icon-uni3C"></span><span class="mls"> icon-uni3C</span>
				</div>
				<fieldset class="fs0 size1of1 clearfix">
					<input type="text" readonly value="f101d" class="unit size1of2" />
					<input type="text" maxlength="1" readonly value="&#xf101d;" class="unitRight size1of2 talign-right" />
				</fieldset>
				<div class="fs0 bshadow0 clearfix noLiga-true">
					<span class="unit pvs fgc1">liga: </span>
					<input type="text" readonly value="" class="liga unitRight" />
				</div>
			</div>
			<div class="glyph fs1">
				<div class="clearfix bshadow0 pbs">
					<span class="icon-uni3E"></span><span class="mls"> icon-uni3E</span>
				</div>
				<fieldset class="fs0 size1of1 clearfix">
					<input type="text" readonly value="f101e" class="unit size1of2" />
					<input type="text" maxlength="1" readonly value="&#xf101e;" class="unitRight size1of2 talign-right" />
				</fieldset>
				<div class="fs0 bshadow0 clearfix noLiga-true">
					<span class="unit pvs fgc1">liga: </span>
					<input type="text" readonly value="" class="liga unitRight" />
				</div>
			</div>
			<div class="glyph fs1">
				<div class="clearfix bshadow0 pbs">
					<span class="icon-uni3D"></span><span class="mls"> icon-uni3D</span>
				</div>
				<fieldset class="fs0 size1of1 clearfix">
					<input type="text" readonly value="f101f" class="unit size1of2" />
					<input type="text" maxlength="1" readonly value="&#xf101f;" class="unitRight size1of2 talign-right" />
				</fieldset>
				<div class="fs0 bshadow0 clearfix noLiga-true">
					<span class="unit pvs fgc1">liga: </span>
					<input type="text" readonly value="" class="liga unitRight" />
				</div>
			</div>
			<div class="glyph fs1">
				<div class="clearfix bshadow0 pbs">
					<span class="icon-uF0029"></span><span class="mls"> icon-uF0029</span>
				</div>
				<fieldset class="fs0 size1of1 clearfix">
					<input type="text" readonly value="f2001" class="unit size1of2" />
					<input type="text" maxlength="1" readonly value="&#xf2001;" class="unitRight size1of2 talign-right" />
				</fieldset>
				<div class="fs0 bshadow0 clearfix noLiga-true">
					<span class="unit pvs fgc1">liga: </span>
					<input type="text" readonly value="" class="liga unitRight" />
				</div>
			</div>
			<div class="glyph fs1">
				<div class="clearfix bshadow0 pbs">
					<span class="icon-uF002D"></span><span class="mls"> icon-uF002D</span>
				</div>
				<fieldset class="fs0 size1of1 clearfix">
					<input type="text" readonly value="f2002" class="unit size1of2" />
					<input type="text" maxlength="1" readonly value="&#xf2002;" class="unitRight size1of2 talign-right" />
				</fieldset>
				<div class="fs0 bshadow0 clearfix noLiga-true">
					<span class="unit pvs fgc1">liga: </span>
					<input type="text" readonly value="" class="liga unitRight" />
				</div>
			</div>
			<div class="glyph fs1">
				<div class="clearfix bshadow0 pbs">
					<span class="icon-uF0032"></span><span class="mls"> icon-uF0032</span>
				</div>
				<fieldset class="fs0 size1of1 clearfix">
					<input type="text" readonly value="f2003" class="unit size1of2" />
					<input type="text" maxlength="1" readonly value="&#xf2003;" class="unitRight size1of2 talign-right" />
				</fieldset>
				<div class="fs0 bshadow0 clearfix noLiga-true">
					<span class="unit pvs fgc1">liga: </span>
					<input type="text" readonly value="" class="liga unitRight" />
				</div>
			</div>
			<div class="glyph fs1">
				<div class="clearfix bshadow0 pbs">
					<span class="icon-uF003C"></span><span class="mls"> icon-uF003C</span>
				</div>
				<fieldset class="fs0 size1of1 clearfix">
					<input type="text" readonly value="f2004" class="unit size1of2" />
					<input type="text" maxlength="1" readonly value="&#xf2004;" class="unitRight size1of2 talign-right" />
				</fieldset>
				<div class="fs0 bshadow0 clearfix noLiga-true">
					<span class="unit pvs fgc1">liga: </span>
					<input type="text" readonly value="" class="liga unitRight" />
				</div>
			</div>
			<div class="glyph fs1">
				<div class="clearfix bshadow0 pbs">
					<span class="icon-uF003B"></span><span class="mls"> icon-uF003B</span>
				</div>
				<fieldset class="fs0 size1of1 clearfix">
					<input type="text" readonly value="f2005" class="unit size1of2" />
					<input type="text" maxlength="1" readonly value="&#xf2005;" class="unitRight size1of2 talign-right" />
				</fieldset>
				<div class="fs0 bshadow0 clearfix noLiga-true">
					<span class="unit pvs fgc1">liga: </span>
					<input type="text" readonly value="" class="liga unitRight" />
				</div>
			</div>
			<div class="glyph fs1">
				<div class="clearfix bshadow0 pbs">
					<span class="icon-uF0074"></span><span class="mls"> icon-uF0074</span>
				</div>
				<fieldset class="fs0 size1of1 clearfix">
					<input type="text" readonly value="f2006" class="unit size1of2" />
					<input type="text" maxlength="1" readonly value="&#xf2006;" class="unitRight size1of2 talign-right" />
				</fieldset>
				<div class="fs0 bshadow0 clearfix noLiga-true">
					<span class="unit pvs fgc1">liga: </span>
					<input type="text" readonly value="" class="liga unitRight" />
				</div>
			</div>
			<div class="glyph fs1">
				<div class="clearfix bshadow0 pbs">
					<span class="icon-uF007D"></span><span class="mls"> icon-uF007D</span>
				</div>
				<fieldset class="fs0 size1of1 clearfix">
					<input type="text" readonly value="f2007" class="unit size1of2" />
					<input type="text" maxlength="1" readonly value="&#xf2007;" class="unitRight size1of2 talign-right" />
				</fieldset>
				<div class="fs0 bshadow0 clearfix noLiga-true">
					<span class="unit pvs fgc1">liga: </span>
					<input type="text" readonly value="" class="liga unitRight" />
				</div>
			</div>
			<div class="glyph fs1">
				<div class="clearfix bshadow0 pbs">
					<span class="icon-uF0080"></span><span class="mls"> icon-uF0080</span>
				</div>
				<fieldset class="fs0 size1of1 clearfix">
					<input type="text" readonly value="f2008" class="unit size1of2" />
					<input type="text" maxlength="1" readonly value="&#xf2008;" class="unitRight size1of2 talign-right" />
				</fieldset>
				<div class="fs0 bshadow0 clearfix noLiga-true">
					<span class="unit pvs fgc1">liga: </span>
					<input type="text" readonly value="" class="liga unitRight" />
				</div>
			</div>
			<div class="glyph fs1">
				<div class="clearfix bshadow0 pbs">
					<span class="icon-uF0083"></span><span class="mls"> icon-uF0083</span>
				</div>
				<fieldset class="fs0 size1of1 clearfix">
					<input type="text" readonly value="f2009" class="unit size1of2" />
					<input type="text" maxlength="1" readonly value="&#xf2009;" class="unitRight size1of2 talign-right" />
				</fieldset>
				<div class="fs0 bshadow0 clearfix noLiga-true">
					<span class="unit pvs fgc1">liga: </span>
					<input type="text" readonly value="" class="liga unitRight" />
				</div>
			</div>
			<div class="glyph fs1">
				<div class="clearfix bshadow0 pbs">
					<span class="icon-uF00BD"></span><span class="mls"> icon-uF00BD</span>
				</div>
				<fieldset class="fs0 size1of1 clearfix">
					<input type="text" readonly value="f200a" class="unit size1of2" />
					<input type="text" maxlength="1" readonly value="&#xf200a;" class="unitRight size1of2 talign-right" />
				</fieldset>
				<div class="fs0 bshadow0 clearfix noLiga-true">
					<span class="unit pvs fgc1">liga: </span>
					<input type="text" readonly value="" class="liga unitRight" />
				</div>
			</div>
			<div class="glyph fs1">
				<div class="clearfix bshadow0 pbs">
					<span class="icon-uF00BE"></span><span class="mls"> icon-uF00BE</span>
				</div>
				<fieldset class="fs0 size1of1 clearfix">
					<input type="text" readonly value="f200b" class="unit size1of2" />
					<input type="text" maxlength="1" readonly value="&#xf200b;" class="unitRight size1of2 talign-right" />
				</fieldset>
				<div class="fs0 bshadow0 clearfix noLiga-true">
					<span class="unit pvs fgc1">liga: </span>
					<input type="text" readonly value="" class="liga unitRight" />
				</div>
			</div>
			<div class="glyph fs1">
				<div class="clearfix bshadow0 pbs">
					<span class="icon-uF00BF"></span><span class="mls"> icon-uF00BF</span>
				</div>
				<fieldset class="fs0 size1of1 clearfix">
					<input type="text" readonly value="f200c" class="unit size1of2" />
					<input type="text" maxlength="1" readonly value="&#xf200c;" class="unitRight size1of2 talign-right" />
				</fieldset>
				<div class="fs0 bshadow0 clearfix noLiga-true">
					<span class="unit pvs fgc1">liga: </span>
					<input type="text" readonly value="" class="liga unitRight" />
				</div>
			</div>
			<div class="glyph fs1">
				<div class="clearfix bshadow0 pbs">
					<span class="icon-uF00C0"></span><span class="mls"> icon-uF00C0</span>
				</div>
				<fieldset class="fs0 size1of1 clearfix">
					<input type="text" readonly value="f200d" class="unit size1of2" />
					<input type="text" maxlength="1" readonly value="&#xf200d;" class="unitRight size1of2 talign-right" />
				</fieldset>
				<div class="fs0 bshadow0 clearfix noLiga-true">
					<span class="unit pvs fgc1">liga: </span>
					<input type="text" readonly value="" class="liga unitRight" />
				</div>
			</div>
			<div class="glyph fs1">
				<div class="clearfix bshadow0 pbs">
					<span class="icon-uF00C1"></span><span class="mls"> icon-uF00C1</span>
				</div>
				<fieldset class="fs0 size1of1 clearfix">
					<input type="text" readonly value="f200e" class="unit size1of2" />
					<input type="text" maxlength="1" readonly value="&#xf200e;" class="unitRight size1of2 talign-right" />
				</fieldset>
				<div class="fs0 bshadow0 clearfix noLiga-true">
					<span class="unit pvs fgc1">liga: </span>
					<input type="text" readonly value="" class="liga unitRight" />
				</div>
			</div>
			<div class="glyph fs1">
				<div class="clearfix bshadow0 pbs">
					<span class="icon-uF00C3"></span><span class="mls"> icon-uF00C3</span>
				</div>
				<fieldset class="fs0 size1of1 clearfix">
					<input type="text" readonly value="f200f" class="unit size1of2" />
					<input type="text" maxlength="1" readonly value="&#xf200f;" class="unitRight size1of2 talign-right" />
				</fieldset>
				<div class="fs0 bshadow0 clearfix noLiga-true">
					<span class="unit pvs fgc1">liga: </span>
					<input type="text" readonly value="" class="liga unitRight" />
				</div>
			</div>
			<div class="glyph fs1">
				<div class="clearfix bshadow0 pbs">
					<span class="icon-uF00C2"></span><span class="mls"> icon-uF00C2</span>
				</div>
				<fieldset class="fs0 size1of1 clearfix">
					<input type="text" readonly value="f2010" class="unit size1of2" />
					<input type="text" maxlength="1" readonly value="&#xf2010;" class="unitRight size1of2 talign-right" />
				</fieldset>
				<div class="fs0 bshadow0 clearfix noLiga-true">
					<span class="unit pvs fgc1">liga: </span>
					<input type="text" readonly value="" class="liga unitRight" />
				</div>
			</div>
			<div class="glyph fs1">
				<div class="clearfix bshadow0 pbs">
					<span class="icon-uF016A"></span><span class="mls"> icon-uF016A</span>
				</div>
				<fieldset class="fs0 size1of1 clearfix">
					<input type="text" readonly value="f2011" class="unit size1of2" />
					<input type="text" maxlength="1" readonly value="&#xf2011;" class="unitRight size1of2 talign-right" />
				</fieldset>
				<div class="fs0 bshadow0 clearfix noLiga-true">
					<span class="unit pvs fgc1">liga: </span>
					<input type="text" readonly value="" class="liga unitRight" />
				</div>
			</div>
			<div class="glyph fs1">
				<div class="clearfix bshadow0 pbs">
					<span class="icon-uF01C6"></span><span class="mls"> icon-uF01C6</span>
				</div>
				<fieldset class="fs0 size1of1 clearfix">
					<input type="text" readonly value="f2012" class="unit size1of2" />
					<input type="text" maxlength="1" readonly value="&#xf2012;" class="unitRight size1of2 talign-right" />
				</fieldset>
				<div class="fs0 bshadow0 clearfix noLiga-true">
					<span class="unit pvs fgc1">liga: </span>
					<input type="text" readonly value="" class="liga unitRight" />
				</div>
			</div>
			<div class="glyph fs1">
				<div class="clearfix bshadow0 pbs">
					<span class="icon-uF0079"></span><span class="mls"> icon-uF0079</span>
				</div>
				<fieldset class="fs0 size1of1 clearfix">
					<input type="text" readonly value="f2013" class="unit size1of2" />
					<input type="text" maxlength="1" readonly value="&#xf2013;" class="unitRight size1of2 talign-right" />
				</fieldset>
				<div class="fs0 bshadow0 clearfix noLiga-true">
					<span class="unit pvs fgc1">liga: </span>
					<input type="text" readonly value="" class="liga unitRight" />
				</div>
			</div>
			<div class="glyph fs1">
				<div class="clearfix bshadow0 pbs">
					<span class="icon-uF000F"></span><span class="mls"> icon-uF000F</span>
				</div>
				<fieldset class="fs0 size1of1 clearfix">
					<input type="text" readonly value="f2014" class="unit size1of2" />
					<input type="text" maxlength="1" readonly value="&#xf2014;" class="unitRight size1of2 talign-right" />
				</fieldset>
				<div class="fs0 bshadow0 clearfix noLiga-true">
					<span class="unit pvs fgc1">liga: </span>
					<input type="text" readonly value="" class="liga unitRight" />
				</div>
			</div>
			<div class="glyph fs1">
				<div class="clearfix bshadow0 pbs">
					<span class="icon-uF0010"></span><span class="mls"> icon-uF0010</span>
				</div>
				<fieldset class="fs0 size1of1 clearfix">
					<input type="text" readonly value="f2015" class="unit size1of2" />
					<input type="text" maxlength="1" readonly value="&#xf2015;" class="unitRight size1of2 talign-right" />
				</fieldset>
				<div class="fs0 bshadow0 clearfix noLiga-true">
					<span class="unit pvs fgc1">liga: </span>
					<input type="text" readonly value="" class="liga unitRight" />
				</div>
			</div>
			<div class="glyph fs1">
				<div class="clearfix bshadow0 pbs">
					<span class="icon-uni75"></span><span class="mls"> icon-uni75</span>
				</div>
				<fieldset class="fs0 size1of1 clearfix">
					<input type="text" readonly value="f2016" class="unit size1of2" />
					<input type="text" maxlength="1" readonly value="&#xf2016;" class="unitRight size1of2 talign-right" />
				</fieldset>
				<div class="fs0 bshadow0 clearfix noLiga-true">
					<span class="unit pvs fgc1">liga: </span>
					<input type="text" readonly value="" class="liga unitRight" />
				</div>
			</div>
			<div class="glyph fs1">
				<div class="clearfix bshadow0 pbs">
					<span class="icon-uni76"></span><span class="mls"> icon-uni76</span>
				</div>
				<fieldset class="fs0 size1of1 clearfix">
					<input type="text" readonly value="f2017" class="unit size1of2" />
					<input type="text" maxlength="1" readonly value="&#xf2017;" class="unitRight size1of2 talign-right" />
				</fieldset>
				<div class="fs0 bshadow0 clearfix noLiga-true">
					<span class="unit pvs fgc1">liga: </span>
					<input type="text" readonly value="" class="liga unitRight" />
				</div>
			</div>
			<div class="glyph fs1">
				<div class="clearfix bshadow0 pbs">
					<span class="icon-uF00BC"></span><span class="mls"> icon-uF00BC</span>
				</div>
				<fieldset class="fs0 size1of1 clearfix">
					<input type="text" readonly value="f2018" class="unit size1of2" />
					<input type="text" maxlength="1" readonly value="&#xf2018;" class="unitRight size1of2 talign-right" />
				</fieldset>
				<div class="fs0 bshadow0 clearfix noLiga-true">
					<span class="unit pvs fgc1">liga: </span>
					<input type="text" readonly value="" class="liga unitRight" />
				</div>
			</div>
			<div class="glyph fs1">
				<div class="clearfix bshadow0 pbs">
					<span class="icon-uniE006"></span><span class="mls"> icon-uniE006</span>
				</div>
				<fieldset class="fs0 size1of1 clearfix">
					<input type="text" readonly value="f2019" class="unit size1of2" />
					<input type="text" maxlength="1" readonly value="&#xf2019;" class="unitRight size1of2 talign-right" />
				</fieldset>
				<div class="fs0 bshadow0 clearfix noLiga-true">
					<span class="unit pvs fgc1">liga: </span>
					<input type="text" readonly value="" class="liga unitRight" />
				</div>
			</div>
			<div class="glyph fs1">
				<div class="clearfix bshadow0 pbs">
					<span class="icon-uniE007"></span><span class="mls"> icon-uniE007</span>
				</div>
				<fieldset class="fs0 size1of1 clearfix">
					<input type="text" readonly value="f201a" class="unit size1of2" />
					<input type="text" maxlength="1" readonly value="&#xf201a;" class="unitRight size1of2 talign-right" />
				</fieldset>
				<div class="fs0 bshadow0 clearfix noLiga-true">
					<span class="unit pvs fgc1">liga: </span>
					<input type="text" readonly value="" class="liga unitRight" />
				</div>
			</div>
			<div class="glyph fs1">
				<div class="clearfix bshadow0 pbs">
					<span class="icon-uF0043"></span><span class="mls"> icon-uF0043</span>
				</div>
				<fieldset class="fs0 size1of1 clearfix">
					<input type="text" readonly value="f201b" class="unit size1of2" />
					<input type="text" maxlength="1" readonly value="&#xf201b;" class="unitRight size1of2 talign-right" />
				</fieldset>
				<div class="fs0 bshadow0 clearfix noLiga-true">
					<span class="unit pvs fgc1">liga: </span>
					<input type="text" readonly value="" class="liga unitRight" />
				</div>
			</div>
			<div class="glyph fs1">
				<div class="clearfix bshadow0 pbs">
					<span class="icon-uni38"></span><span class="mls"> icon-uni38</span>
				</div>
				<fieldset class="fs0 size1of1 clearfix">
					<input type="text" readonly value="f201c" class="unit size1of2" />
					<input type="text" maxlength="1" readonly value="&#xf201c;" class="unitRight size1of2 talign-right" />
				</fieldset>
				<div class="fs0 bshadow0 clearfix noLiga-true">
					<span class="unit pvs fgc1">liga: </span>
					<input type="text" readonly value="" class="liga unitRight" />
				</div>
			</div>
			<div class="glyph fs1">
				<div class="clearfix bshadow0 pbs">
					<span class="icon-uni3A"></span><span class="mls"> icon-uni3A</span>
				</div>
				<fieldset class="fs0 size1of1 clearfix">
					<input type="text" readonly value="f201d" class="unit size1of2" />
					<input type="text" maxlength="1" readonly value="&#xf201d;" class="unitRight size1of2 talign-right" />
				</fieldset>
				<div class="fs0 bshadow0 clearfix noLiga-true">
					<span class="unit pvs fgc1">liga: </span>
					<input type="text" readonly value="" class="liga unitRight" />
				</div>
			</div>
			<div class="glyph fs1">
				<div class="clearfix bshadow0 pbs">
					<span class="icon-uni39"></span><span class="mls"> icon-uni39</span>
				</div>
				<fieldset class="fs0 size1of1 clearfix">
					<input type="text" readonly value="f201e" class="unit size1of2" />
					<input type="text" maxlength="1" readonly value="&#xf201e;" class="unitRight size1of2 talign-right" />
				</fieldset>
				<div class="fs0 bshadow0 clearfix noLiga-true">
					<span class="unit pvs fgc1">liga: </span>
					<input type="text" readonly value="" class="liga unitRight" />
				</div>
			</div>
			<div class="glyph fs1">
				<div class="clearfix bshadow0 pbs">
					<span class="icon-uF0007"></span><span class="mls"> icon-uF0007</span>
				</div>
				<fieldset class="fs0 size1of1 clearfix">
					<input type="text" readonly value="f201f" class="unit size1of2" />
					<input type="text" maxlength="1" readonly value="&#xf201f;" class="unitRight size1of2 talign-right" />
				</fieldset>
				<div class="fs0 bshadow0 clearfix noLiga-true">
					<span class="unit pvs fgc1">liga: </span>
					<input type="text" readonly value="" class="liga unitRight" />
				</div>
			</div>
			<div class="glyph fs1">
				<div class="clearfix bshadow0 pbs">
					<span class="icon-uF0077"></span><span class="mls"> icon-uF0077</span>
				</div>
				<fieldset class="fs0 size1of1 clearfix">
					<input type="text" readonly value="f2020" class="unit size1of2" />
					<input type="text" maxlength="1" readonly value="&#xf2020;" class="unitRight size1of2 talign-right" />
				</fieldset>
				<div class="fs0 bshadow0 clearfix noLiga-true">
					<span class="unit pvs fgc1">liga: </span>
					<input type="text" readonly value="" class="liga unitRight" />
				</div>
			</div>
			<div class="glyph fs1">
				<div class="clearfix bshadow0 pbs">
					<span class="icon-uni4A"></span><span class="mls"> icon-uni4A</span>
				</div>
				<fieldset class="fs0 size1of1 clearfix">
					<input type="text" readonly value="f2021" class="unit size1of2" />
					<input type="text" maxlength="1" readonly value="&#xf2021;" class="unitRight size1of2 talign-right" />
				</fieldset>
				<div class="fs0 bshadow0 clearfix noLiga-true">
					<span class="unit pvs fgc1">liga: </span>
					<input type="text" readonly value="" class="liga unitRight" />
				</div>
			</div>
			<div class="glyph fs1">
				<div class="clearfix bshadow0 pbs">
					<span class="icon-uni4C"></span><span class="mls"> icon-uni4C</span>
				</div>
				<fieldset class="fs0 size1of1 clearfix">
					<input type="text" readonly value="f2022" class="unit size1of2" />
					<input type="text" maxlength="1" readonly value="&#xf2022;" class="unitRight size1of2 talign-right" />
				</fieldset>
				<div class="fs0 bshadow0 clearfix noLiga-true">
					<span class="unit pvs fgc1">liga: </span>
					<input type="text" readonly value="" class="liga unitRight" />
				</div>
			</div>
			<div class="glyph fs1">
				<div class="clearfix bshadow0 pbs">
					<span class="icon-uni4B"></span><span class="mls"> icon-uni4B</span>
				</div>
				<fieldset class="fs0 size1of1 clearfix">
					<input type="text" readonly value="f2023" class="unit size1of2" />
					<input type="text" maxlength="1" readonly value="&#xf2023;" class="unitRight size1of2 talign-right" />
				</fieldset>
				<div class="fs0 bshadow0 clearfix noLiga-true">
					<span class="unit pvs fgc1">liga: </span>
					<input type="text" readonly value="" class="liga unitRight" />
				</div>
			</div>
			<div class="glyph fs1">
				<div class="clearfix bshadow0 pbs">
					<span class="icon-uF0062"></span><span class="mls"> icon-uF0062</span>
				</div>
				<fieldset class="fs0 size1of1 clearfix">
					<input type="text" readonly value="f2024" class="unit size1of2" />
					<input type="text" maxlength="1" readonly value="&#xf2024;" class="unitRight size1of2 talign-right" />
				</fieldset>
				<div class="fs0 bshadow0 clearfix noLiga-true">
					<span class="unit pvs fgc1">liga: </span>
					<input type="text" readonly value="" class="liga unitRight" />
				</div>
			</div>
			<div class="glyph fs1">
				<div class="clearfix bshadow0 pbs">
					<span class="icon-uF0085"></span><span class="mls"> icon-uF0085</span>
				</div>
				<fieldset class="fs0 size1of1 clearfix">
					<input type="text" readonly value="f2025" class="unit size1of2" />
					<input type="text" maxlength="1" readonly value="&#xf2025;" class="unitRight size1of2 talign-right" />
				</fieldset>
				<div class="fs0 bshadow0 clearfix noLiga-true">
					<span class="unit pvs fgc1">liga: </span>
					<input type="text" readonly value="" class="liga unitRight" />
				</div>
			</div>
			<div class="glyph fs1">
				<div class="clearfix bshadow0 pbs">
					<span class="icon-uni33"></span><span class="mls"> icon-uni33</span>
				</div>
				<fieldset class="fs0 size1of1 clearfix">
					<input type="text" readonly value="f3001" class="unit size1of2" />
					<input type="text" maxlength="1" readonly value="&#xf3001;" class="unitRight size1of2 talign-right" />
				</fieldset>
				<div class="fs0 bshadow0 clearfix noLiga-true">
					<span class="unit pvs fgc1">liga: </span>
					<input type="text" readonly value="" class="liga unitRight" />
				</div>
			</div>
			<div class="glyph fs1">
				<div class="clearfix bshadow0 pbs">
					<span class="icon-uF001C"></span><span class="mls"> icon-uF001C</span>
				</div>
				<fieldset class="fs0 size1of1 clearfix">
					<input type="text" readonly value="f3002" class="unit size1of2" />
					<input type="text" maxlength="1" readonly value="&#xf3002;" class="unitRight size1of2 talign-right" />
				</fieldset>
				<div class="fs0 bshadow0 clearfix noLiga-true">
					<span class="unit pvs fgc1">liga: </span>
					<input type="text" readonly value="" class="liga unitRight" />
				</div>
			</div>
			<div class="glyph fs1">
				<div class="clearfix bshadow0 pbs">
					<span class="icon-uF002A"></span><span class="mls"> icon-uF002A</span>
				</div>
				<fieldset class="fs0 size1of1 clearfix">
					<input type="text" readonly value="f3003" class="unit size1of2" />
					<input type="text" maxlength="1" readonly value="&#xf3003;" class="unitRight size1of2 talign-right" />
				</fieldset>
				<div class="fs0 bshadow0 clearfix noLiga-true">
					<span class="unit pvs fgc1">liga: </span>
					<input type="text" readonly value="" class="liga unitRight" />
				</div>
			</div>
			<div class="glyph fs1">
				<div class="clearfix bshadow0 pbs">
					<span class="icon-uF0030"></span><span class="mls"> icon-uF0030</span>
				</div>
				<fieldset class="fs0 size1of1 clearfix">
					<input type="text" readonly value="f3004" class="unit size1of2" />
					<input type="text" maxlength="1" readonly value="&#xf3004;" class="unitRight size1of2 talign-right" />
				</fieldset>
				<div class="fs0 bshadow0 clearfix noLiga-true">
					<span class="unit pvs fgc1">liga: </span>
					<input type="text" readonly value="" class="liga unitRight" />
				</div>
			</div>
			<div class="glyph fs1">
				<div class="clearfix bshadow0 pbs">
					<span class="icon-uF0058"></span><span class="mls"> icon-uF0058</span>
				</div>
				<fieldset class="fs0 size1of1 clearfix">
					<input type="text" readonly value="f3005" class="unit size1of2" />
					<input type="text" maxlength="1" readonly value="&#xf3005;" class="unitRight size1of2 talign-right" />
				</fieldset>
				<div class="fs0 bshadow0 clearfix noLiga-true">
					<span class="unit pvs fgc1">liga: </span>
					<input type="text" readonly value="" class="liga unitRight" />
				</div>
			</div>
			<div class="glyph fs1">
				<div class="clearfix bshadow0 pbs">
					<span class="icon-uF006A"></span><span class="mls"> icon-uF006A</span>
				</div>
				<fieldset class="fs0 size1of1 clearfix">
					<input type="text" readonly value="f3006" class="unit size1of2" />
					<input type="text" maxlength="1" readonly value="&#xf3006;" class="unitRight size1of2 talign-right" />
				</fieldset>
				<div class="fs0 bshadow0 clearfix noLiga-true">
					<span class="unit pvs fgc1">liga: </span>
					<input type="text" readonly value="" class="liga unitRight" />
				</div>
			</div>
			<div class="glyph fs1">
				<div class="clearfix bshadow0 pbs">
					<span class="icon-uF0154"></span><span class="mls"> icon-uF0154</span>
				</div>
				<fieldset class="fs0 size1of1 clearfix">
					<input type="text" readonly value="f3007" class="unit size1of2" />
					<input type="text" maxlength="1" readonly value="&#xf3007;" class="unitRight size1of2 talign-right" />
				</fieldset>
				<div class="fs0 bshadow0 clearfix noLiga-true">
					<span class="unit pvs fgc1">liga: </span>
					<input type="text" readonly value="" class="liga unitRight" />
				</div>
			</div>
			<div class="glyph fs1">
				<div class="clearfix bshadow0 pbs">
					<span class="icon-uF0153"></span><span class="mls"> icon-uF0153</span>
				</div>
				<fieldset class="fs0 size1of1 clearfix">
					<input type="text" readonly value="f3008" class="unit size1of2" />
					<input type="text" maxlength="1" readonly value="&#xf3008;" class="unitRight size1of2 talign-right" />
				</fieldset>
				<div class="fs0 bshadow0 clearfix noLiga-true">
					<span class="unit pvs fgc1">liga: </span>
					<input type="text" readonly value="" class="liga unitRight" />
				</div>
			</div>
			<div class="glyph fs1">
				<div class="clearfix bshadow0 pbs">
					<span class="icon-uF0155"></span><span class="mls"> icon-uF0155</span>
				</div>
				<fieldset class="fs0 size1of1 clearfix">
					<input type="text" readonly value="f3009" class="unit size1of2" />
					<input type="text" maxlength="1" readonly value="&#xf3009;" class="unitRight size1of2 talign-right" />
				</fieldset>
				<div class="fs0 bshadow0 clearfix noLiga-true">
					<span class="unit pvs fgc1">liga: </span>
					<input type="text" readonly value="" class="liga unitRight" />
				</div>
			</div>
			<div class="glyph fs1">
				<div class="clearfix bshadow0 pbs">
					<span class="icon-uni28"></span><span class="mls"> icon-uni28</span>
				</div>
				<fieldset class="fs0 size1of1 clearfix">
					<input type="text" readonly value="f300a" class="unit size1of2" />
					<input type="text" maxlength="1" readonly value="&#xf300a;" class="unitRight size1of2 talign-right" />
				</fieldset>
				<div class="fs0 bshadow0 clearfix noLiga-true">
					<span class="unit pvs fgc1">liga: </span>
					<input type="text" readonly value="" class="liga unitRight" />
				</div>
			</div>
			<div class="glyph fs1">
				<div class="clearfix bshadow0 pbs">
					<span class="icon-uni29"></span><span class="mls"> icon-uni29</span>
				</div>
				<fieldset class="fs0 size1of1 clearfix">
					<input type="text" readonly value="f300b" class="unit size1of2" />
					<input type="text" maxlength="1" readonly value="&#xf300b;" class="unitRight size1of2 talign-right" />
				</fieldset>
				<div class="fs0 bshadow0 clearfix noLiga-true">
					<span class="unit pvs fgc1">liga: </span>
					<input type="text" readonly value="" class="liga unitRight" />
				</div>
			</div>
			<div class="glyph fs1">
				<div class="clearfix bshadow0 pbs">
					<span class="icon-uni2A"></span><span class="mls"> icon-uni2A</span>
				</div>
				<fieldset class="fs0 size1of1 clearfix">
					<input type="text" readonly value="f300c" class="unit size1of2" />
					<input type="text" maxlength="1" readonly value="&#xf300c;" class="unitRight size1of2 talign-right" />
				</fieldset>
				<div class="fs0 bshadow0 clearfix noLiga-true">
					<span class="unit pvs fgc1">liga: </span>
					<input type="text" readonly value="" class="liga unitRight" />
				</div>
			</div>
			<div class="glyph fs1">
				<div class="clearfix bshadow0 pbs">
					<span class="icon-uni2B"></span><span class="mls"> icon-uni2B</span>
				</div>
				<fieldset class="fs0 size1of1 clearfix">
					<input type="text" readonly value="f300d" class="unit size1of2" />
					<input type="text" maxlength="1" readonly value="&#xf300d;" class="unitRight size1of2 talign-right" />
				</fieldset>
				<div class="fs0 bshadow0 clearfix noLiga-true">
					<span class="unit pvs fgc1">liga: </span>
					<input type="text" readonly value="" class="liga unitRight" />
				</div>
			</div>
			<div class="glyph fs1">
				<div class="clearfix bshadow0 pbs">
					<span class="icon-uni2C"></span><span class="mls"> icon-uni2C</span>
				</div>
				<fieldset class="fs0 size1of1 clearfix">
					<input type="text" readonly value="f300e" class="unit size1of2" />
					<input type="text" maxlength="1" readonly value="&#xf300e;" class="unitRight size1of2 talign-right" />
				</fieldset>
				<div class="fs0 bshadow0 clearfix noLiga-true">
					<span class="unit pvs fgc1">liga: </span>
					<input type="text" readonly value="" class="liga unitRight" />
				</div>
			</div>
			<div class="glyph fs1">
				<div class="clearfix bshadow0 pbs">
					<span class="icon-uni2D"></span><span class="mls"> icon-uni2D</span>
				</div>
				<fieldset class="fs0 size1of1 clearfix">
					<input type="text" readonly value="f300f" class="unit size1of2" />
					<input type="text" maxlength="1" readonly value="&#xf300f;" class="unitRight size1of2 talign-right" />
				</fieldset>
				<div class="fs0 bshadow0 clearfix noLiga-true">
					<span class="unit pvs fgc1">liga: </span>
					<input type="text" readonly value="" class="liga unitRight" />
				</div>
			</div>
			<div class="glyph fs1">
				<div class="clearfix bshadow0 pbs">
					<span class="icon-uni2E"></span><span class="mls"> icon-uni2E</span>
				</div>
				<fieldset class="fs0 size1of1 clearfix">
					<input type="text" readonly value="f3010" class="unit size1of2" />
					<input type="text" maxlength="1" readonly value="&#xf3010;" class="unitRight size1of2 talign-right" />
				</fieldset>
				<div class="fs0 bshadow0 clearfix noLiga-true">
					<span class="unit pvs fgc1">liga: </span>
					<input type="text" readonly value="" class="liga unitRight" />
				</div>
			</div>
			<div class="glyph fs1">
				<div class="clearfix bshadow0 pbs">
					<span class="icon-uni2F"></span><span class="mls"> icon-uni2F</span>
				</div>
				<fieldset class="fs0 size1of1 clearfix">
					<input type="text" readonly value="f3011" class="unit size1of2" />
					<input type="text" maxlength="1" readonly value="&#xf3011;" class="unitRight size1of2 talign-right" />
				</fieldset>
				<div class="fs0 bshadow0 clearfix noLiga-true">
					<span class="unit pvs fgc1">liga: </span>
					<input type="text" readonly value="" class="liga unitRight" />
				</div>
			</div>
			<div class="glyph fs1">
				<div class="clearfix bshadow0 pbs">
					<span class="icon-uni30"></span><span class="mls"> icon-uni30</span>
				</div>
				<fieldset class="fs0 size1of1 clearfix">
					<input type="text" readonly value="f3012" class="unit size1of2" />
					<input type="text" maxlength="1" readonly value="&#xf3012;" class="unitRight size1of2 talign-right" />
				</fieldset>
				<div class="fs0 bshadow0 clearfix noLiga-true">
					<span class="unit pvs fgc1">liga: </span>
					<input type="text" readonly value="" class="liga unitRight" />
				</div>
			</div>
			<div class="glyph fs1">
				<div class="clearfix bshadow0 pbs">
					<span class="icon-uF004C"></span><span class="mls"> icon-uF004C</span>
				</div>
				<fieldset class="fs0 size1of1 clearfix">
					<input type="text" readonly value="f3013" class="unit size1of2" />
					<input type="text" maxlength="1" readonly value="&#xf3013;" class="unitRight size1of2 talign-right" />
				</fieldset>
				<div class="fs0 bshadow0 clearfix noLiga-true">
					<span class="unit pvs fgc1">liga: </span>
					<input type="text" readonly value="" class="liga unitRight" />
				</div>
			</div>
			<div class="glyph fs1">
				<div class="clearfix bshadow0 pbs">
					<span class="icon-uF00B3"></span><span class="mls"> icon-uF00B3</span>
				</div>
				<fieldset class="fs0 size1of1 clearfix">
					<input type="text" readonly value="f3014" class="unit size1of2" />
					<input type="text" maxlength="1" readonly value="&#xf3014;" class="unitRight size1of2 talign-right" />
				</fieldset>
				<div class="fs0 bshadow0 clearfix noLiga-true">
					<span class="unit pvs fgc1">liga: </span>
					<input type="text" readonly value="" class="liga unitRight" />
				</div>
			</div>
			<div class="glyph fs1">
				<div class="clearfix bshadow0 pbs">
					<span class="icon-uF00B4"></span><span class="mls"> icon-uF00B4</span>
				</div>
				<fieldset class="fs0 size1of1 clearfix">
					<input type="text" readonly value="f3015" class="unit size1of2" />
					<input type="text" maxlength="1" readonly value="&#xf3015;" class="unitRight size1of2 talign-right" />
				</fieldset>
				<div class="fs0 bshadow0 clearfix noLiga-true">
					<span class="unit pvs fgc1">liga: </span>
					<input type="text" readonly value="" class="liga unitRight" />
				</div>
			</div>
			<div class="glyph fs1">
				<div class="clearfix bshadow0 pbs">
					<span class="icon-uF0016"></span><span class="mls"> icon-uF0016</span>
				</div>
				<fieldset class="fs0 size1of1 clearfix">
					<input type="text" readonly value="f3016" class="unit size1of2" />
					<input type="text" maxlength="1" readonly value="&#xf3016;" class="unitRight size1of2 talign-right" />
				</fieldset>
				<div class="fs0 bshadow0 clearfix noLiga-true">
					<span class="unit pvs fgc1">liga: </span>
					<input type="text" readonly value="" class="liga unitRight" />
				</div>
			</div>
			<div class="glyph fs1">
				<div class="clearfix bshadow0 pbs">
					<span class="icon-uni3444"></span><span class="mls"> icon-uni3444</span>
				</div>
				<fieldset class="fs0 size1of1 clearfix">
					<input type="text" readonly value="f3017" class="unit size1of2" />
					<input type="text" maxlength="1" readonly value="&#xf3017;" class="unitRight size1of2 talign-right" />
				</fieldset>
				<div class="fs0 bshadow0 clearfix noLiga-true">
					<span class="unit pvs fgc1">liga: </span>
					<input type="text" readonly value="" class="liga unitRight" />
				</div>
			</div>
			<div class="glyph fs1">
				<div class="clearfix bshadow0 pbs">
					<span class="icon-uF0037"></span><span class="mls"> icon-uF0037</span>
				</div>
				<fieldset class="fs0 size1of1 clearfix">
					<input type="text" readonly value="f3018" class="unit size1of2" />
					<input type="text" maxlength="1" readonly value="&#xf3018;" class="unitRight size1of2 talign-right" />
				</fieldset>
				<div class="fs0 bshadow0 clearfix noLiga-true">
					<span class="unit pvs fgc1">liga: </span>
					<input type="text" readonly value="" class="liga unitRight" />
				</div>
			</div>
			<div class="glyph fs1">
				<div class="clearfix bshadow0 pbs">
					<span class="icon-uni47"></span><span class="mls"> icon-uni47</span>
				</div>
				<fieldset class="fs0 size1of1 clearfix">
					<input type="text" readonly value="f3019" class="unit size1of2" />
					<input type="text" maxlength="1" readonly value="&#xf3019;" class="unitRight size1of2 talign-right" />
				</fieldset>
				<div class="fs0 bshadow0 clearfix noLiga-true">
					<span class="unit pvs fgc1">liga: </span>
					<input type="text" readonly value="" class="liga unitRight" />
				</div>
			</div>
			<div class="glyph fs1">
				<div class="clearfix bshadow0 pbs">
					<span class="icon-uni48"></span><span class="mls"> icon-uni48</span>
				</div>
				<fieldset class="fs0 size1of1 clearfix">
					<input type="text" readonly value="f301a" class="unit size1of2" />
					<input type="text" maxlength="1" readonly value="&#xf301a;" class="unitRight size1of2 talign-right" />
				</fieldset>
				<div class="fs0 bshadow0 clearfix noLiga-true">
					<span class="unit pvs fgc1">liga: </span>
					<input type="text" readonly value="" class="liga unitRight" />
				</div>
			</div>
			<div class="glyph fs1">
				<div class="clearfix bshadow0 pbs">
					<span class="icon-uni49"></span><span class="mls"> icon-uni49</span>
				</div>
				<fieldset class="fs0 size1of1 clearfix">
					<input type="text" readonly value="f301b" class="unit size1of2" />
					<input type="text" maxlength="1" readonly value="&#xf301b;" class="unitRight size1of2 talign-right" />
				</fieldset>
				<div class="fs0 bshadow0 clearfix noLiga-true">
					<span class="unit pvs fgc1">liga: </span>
					<input type="text" readonly value="" class="liga unitRight" />
				</div>
			</div>
			<div class="glyph fs1">
				<div class="clearfix bshadow0 pbs">
					<span class="icon-uF01BA"></span><span class="mls"> icon-uF01BA</span>
				</div>
				<fieldset class="fs0 size1of1 clearfix">
					<input type="text" readonly value="f301c" class="unit size1of2" />
					<input type="text" maxlength="1" readonly value="&#xf301c;" class="unitRight size1of2 talign-right" />
				</fieldset>
				<div class="fs0 bshadow0 clearfix noLiga-true">
					<span class="unit pvs fgc1">liga: </span>
					<input type="text" readonly value="" class="liga unitRight" />
				</div>
			</div>
			<div class="glyph fs1">
				<div class="clearfix bshadow0 pbs">
					<span class="icon-uF027C"></span><span class="mls"> icon-uF027C</span>
				</div>
				<fieldset class="fs0 size1of1 clearfix">
					<input type="text" readonly value="f301d" class="unit size1of2" />
					<input type="text" maxlength="1" readonly value="&#xf301d;" class="unitRight size1of2 talign-right" />
				</fieldset>
				<div class="fs0 bshadow0 clearfix noLiga-true">
					<span class="unit pvs fgc1">liga: </span>
					<input type="text" readonly value="" class="liga unitRight" />
				</div>
			</div>
			<div class="glyph fs1">
				<div class="clearfix bshadow0 pbs">
					<span class="icon-uF00C6"></span><span class="mls"> icon-uF00C6</span>
				</div>
				<fieldset class="fs0 size1of1 clearfix">
					<input type="text" readonly value="f4001" class="unit size1of2" />
					<input type="text" maxlength="1" readonly value="&#xf4001;" class="unitRight size1of2 talign-right" />
				</fieldset>
				<div class="fs0 bshadow0 clearfix noLiga-true">
					<span class="unit pvs fgc1">liga: </span>
					<input type="text" readonly value="" class="liga unitRight" />
				</div>
			</div>
			<div class="glyph fs1">
				<div class="clearfix bshadow0 pbs">
					<span class="icon-uF00C7"></span><span class="mls"> icon-uF00C7</span>
				</div>
				<fieldset class="fs0 size1of1 clearfix">
					<input type="text" readonly value="f4002" class="unit size1of2" />
					<input type="text" maxlength="1" readonly value="&#xf4002;" class="unitRight size1of2 talign-right" />
				</fieldset>
				<div class="fs0 bshadow0 clearfix noLiga-true">
					<span class="unit pvs fgc1">liga: </span>
					<input type="text" readonly value="" class="liga unitRight" />
				</div>
			</div>
			<div class="glyph fs1">
				<div class="clearfix bshadow0 pbs">
					<span class="icon-uF00C8"></span><span class="mls"> icon-uF00C8</span>
				</div>
				<fieldset class="fs0 size1of1 clearfix">
					<input type="text" readonly value="f4003" class="unit size1of2" />
					<input type="text" maxlength="1" readonly value="&#xf4003;" class="unitRight size1of2 talign-right" />
				</fieldset>
				<div class="fs0 bshadow0 clearfix noLiga-true">
					<span class="unit pvs fgc1">liga: </span>
					<input type="text" readonly value="" class="liga unitRight" />
				</div>
			</div>
			<div class="glyph fs1">
				<div class="clearfix bshadow0 pbs">
					<span class="icon-uF00C5"></span><span class="mls"> icon-uF00C5</span>
				</div>
				<fieldset class="fs0 size1of1 clearfix">
					<input type="text" readonly value="f4004" class="unit size1of2" />
					<input type="text" maxlength="1" readonly value="&#xf4004;" class="unitRight size1of2 talign-right" />
				</fieldset>
				<div class="fs0 bshadow0 clearfix noLiga-true">
					<span class="unit pvs fgc1">liga: </span>
					<input type="text" readonly value="" class="liga unitRight" />
				</div>
			</div>
			<div class="glyph fs1">
				<div class="clearfix bshadow0 pbs">
					<span class="icon-uni45"></span><span class="mls"> icon-uni45</span>
				</div>
				<fieldset class="fs0 size1of1 clearfix">
					<input type="text" readonly value="f4005" class="unit size1of2" />
					<input type="text" maxlength="1" readonly value="&#xf4005;" class="unitRight size1of2 talign-right" />
				</fieldset>
				<div class="fs0 bshadow0 clearfix noLiga-true">
					<span class="unit pvs fgc1">liga: </span>
					<input type="text" readonly value="" class="liga unitRight" />
				</div>
			</div>
			<div class="glyph fs1">
				<div class="clearfix bshadow0 pbs">
					<span class="icon-uni46"></span><span class="mls"> icon-uni46</span>
				</div>
				<fieldset class="fs0 size1of1 clearfix">
					<input type="text" readonly value="f4006" class="unit size1of2" />
					<input type="text" maxlength="1" readonly value="&#xf4006;" class="unitRight size1of2 talign-right" />
				</fieldset>
				<div class="fs0 bshadow0 clearfix noLiga-true">
					<span class="unit pvs fgc1">liga: </span>
					<input type="text" readonly value="" class="liga unitRight" />
				</div>
			</div>
			<div class="glyph fs1">
				<div class="clearfix bshadow0 pbs">
					<span class="icon-uni74"></span><span class="mls"> icon-uni74</span>
				</div>
				<fieldset class="fs0 size1of1 clearfix">
					<input type="text" readonly value="f5001" class="unit size1of2" />
					<input type="text" maxlength="1" readonly value="&#xf5001;" class="unitRight size1of2 talign-right" />
				</fieldset>
				<div class="fs0 bshadow0 clearfix noLiga-true">
					<span class="unit pvs fgc1">liga: </span>
					<input type="text" readonly value="" class="liga unitRight" />
				</div>
			</div>
			<div class="glyph fs1">
				<div class="clearfix bshadow0 pbs">
					<span class="icon-x"></span><span class="mls"> icon-x</span>
				</div>
				<fieldset class="fs0 size1of1 clearfix">
					<input type="text" readonly value="f5002" class="unit size1of2" />
					<input type="text" maxlength="1" readonly value="&#xf5002;" class="unitRight size1of2 talign-right" />
				</fieldset>
				<div class="fs0 bshadow0 clearfix noLiga-true">
					<span class="unit pvs fgc1">liga: </span>
					<input type="text" readonly value="" class="liga unitRight" />
				</div>
			</div>
			<div class="glyph fs1">
				<div class="clearfix bshadow0 pbs">
					<span class="icon-uni73"></span><span class="mls"> icon-uni73</span>
				</div>
				<fieldset class="fs0 size1of1 clearfix">
					<input type="text" readonly value="f5003" class="unit size1of2" />
					<input type="text" maxlength="1" readonly value="&#xf5003;" class="unitRight size1of2 talign-right" />
				</fieldset>
				<div class="fs0 bshadow0 clearfix noLiga-true">
					<span class="unit pvs fgc1">liga: </span>
					<input type="text" readonly value="" class="liga unitRight" />
				</div>
			</div>
			<div class="glyph fs1">
				<div class="clearfix bshadow0 pbs">
					<span class="icon-uF01B8"></span><span class="mls"> icon-uF01B8</span>
				</div>
				<fieldset class="fs0 size1of1 clearfix">
					<input type="text" readonly value="f5004" class="unit size1of2" />
					<input type="text" maxlength="1" readonly value="&#xf5004;" class="unitRight size1of2 talign-right" />
				</fieldset>
				<div class="fs0 bshadow0 clearfix noLiga-true">
					<span class="unit pvs fgc1">liga: </span>
					<input type="text" readonly value="" class="liga unitRight" />
				</div>
			</div>
			<div class="glyph fs1">
				<div class="clearfix bshadow0 pbs">
					<span class="icon-uF01B9"></span><span class="mls"> icon-uF01B9</span>
				</div>
				<fieldset class="fs0 size1of1 clearfix">
					<input type="text" readonly value="f5005" class="unit size1of2" />
					<input type="text" maxlength="1" readonly value="&#xf5005;" class="unitRight size1of2 talign-right" />
				</fieldset>
				<div class="fs0 bshadow0 clearfix noLiga-true">
					<span class="unit pvs fgc1">liga: </span>
					<input type="text" readonly value="" class="liga unitRight" />
				</div>
			</div>
			<div class="glyph fs1">
				<div class="clearfix bshadow0 pbs">
					<span class="icon-uni61"></span><span class="mls"> icon-uni61</span>
				</div>
				<fieldset class="fs0 size1of1 clearfix">
					<input type="text" readonly value="f5006" class="unit size1of2" />
					<input type="text" maxlength="1" readonly value="&#xf5006;" class="unitRight size1of2 talign-right" />
				</fieldset>
				<div class="fs0 bshadow0 clearfix noLiga-true">
					<span class="unit pvs fgc1">liga: </span>
					<input type="text" readonly value="" class="liga unitRight" />
				</div>
			</div>
			<div class="glyph fs1">
				<div class="clearfix bshadow0 pbs">
					<span class="icon-uni62"></span><span class="mls"> icon-uni62</span>
				</div>
				<fieldset class="fs0 size1of1 clearfix">
					<input type="text" readonly value="f5007" class="unit size1of2" />
					<input type="text" maxlength="1" readonly value="&#xf5007;" class="unitRight size1of2 talign-right" />
				</fieldset>
				<div class="fs0 bshadow0 clearfix noLiga-true">
					<span class="unit pvs fgc1">liga: </span>
					<input type="text" readonly value="" class="liga unitRight" />
				</div>
			</div>
			<div class="glyph fs1">
				<div class="clearfix bshadow0 pbs">
					<span class="icon-uF0066"></span><span class="mls"> icon-uF0066</span>
				</div>
				<fieldset class="fs0 size1of1 clearfix">
					<input type="text" readonly value="f5008" class="unit size1of2" />
					<input type="text" maxlength="1" readonly value="&#xf5008;" class="unitRight size1of2 talign-right" />
				</fieldset>
				<div class="fs0 bshadow0 clearfix noLiga-true">
					<span class="unit pvs fgc1">liga: </span>
					<input type="text" readonly value="" class="liga unitRight" />
				</div>
			</div>
			<div class="glyph fs1">
				<div class="clearfix bshadow0 pbs">
					<span class="icon-uF004A"></span><span class="mls"> icon-uF004A</span>
				</div>
				<fieldset class="fs0 size1of1 clearfix">
					<input type="text" readonly value="f5009" class="unit size1of2" />
					<input type="text" maxlength="1" readonly value="&#xf5009;" class="unitRight size1of2 talign-right" />
				</fieldset>
				<div class="fs0 bshadow0 clearfix noLiga-true">
					<span class="unit pvs fgc1">liga: </span>
					<input type="text" readonly value="" class="liga unitRight" />
				</div>
			</div>
			<div class="glyph fs1">
				<div class="clearfix bshadow0 pbs">
					<span class="icon-uni3447"></span><span class="mls"> icon-uni3447</span>
				</div>
				<fieldset class="fs0 size1of1 clearfix">
					<input type="text" readonly value="f500a" class="unit size1of2" />
					<input type="text" maxlength="1" readonly value="&#xf500a;" class="unitRight size1of2 talign-right" />
				</fieldset>
				<div class="fs0 bshadow0 clearfix noLiga-true">
					<span class="unit pvs fgc1">liga: </span>
					<input type="text" readonly value="" class="liga unitRight" />
				</div>
			</div>
			<div class="glyph fs1">
				<div class="clearfix bshadow0 pbs">
					<span class="icon-uni3465"></span><span class="mls"> icon-uni3465</span>
				</div>
				<fieldset class="fs0 size1of1 clearfix">
					<input type="text" readonly value="f500b" class="unit size1of2" />
					<input type="text" maxlength="1" readonly value="&#xf500b;" class="unitRight size1of2 talign-right" />
				</fieldset>
				<div class="fs0 bshadow0 clearfix noLiga-true">
					<span class="unit pvs fgc1">liga: </span>
					<input type="text" readonly value="" class="liga unitRight" />
				</div>
			</div>
			<div class="glyph fs1">
				<div class="clearfix bshadow0 pbs">
					<span class="icon-uniE01C"></span><span class="mls"> icon-uniE01C</span>
				</div>
				<fieldset class="fs0 size1of1 clearfix">
					<input type="text" readonly value="f500c" class="unit size1of2" />
					<input type="text" maxlength="1" readonly value="&#xf500c;" class="unitRight size1of2 talign-right" />
				</fieldset>
				<div class="fs0 bshadow0 clearfix noLiga-true">
					<span class="unit pvs fgc1">liga: </span>
					<input type="text" readonly value="" class="liga unitRight" />
				</div>
			</div>
			<div class="glyph fs1">
				<div class="clearfix bshadow0 pbs">
					<span class="icon-uni3467"></span><span class="mls"> icon-uni3467</span>
				</div>
				<fieldset class="fs0 size1of1 clearfix">
					<input type="text" readonly value="f500d" class="unit size1of2" />
					<input type="text" maxlength="1" readonly value="&#xf500d;" class="unitRight size1of2 talign-right" />
				</fieldset>
				<div class="fs0 bshadow0 clearfix noLiga-true">
					<span class="unit pvs fgc1">liga: </span>
					<input type="text" readonly value="" class="liga unitRight" />
				</div>
			</div>
			<div class="glyph fs1">
				<div class="clearfix bshadow0 pbs">
					<span class="icon-uF00B5"></span><span class="mls"> icon-uF00B5</span>
				</div>
				<fieldset class="fs0 size1of1 clearfix">
					<input type="text" readonly value="f500e" class="unit size1of2" />
					<input type="text" maxlength="1" readonly value="&#xf500e;" class="unitRight size1of2 talign-right" />
				</fieldset>
				<div class="fs0 bshadow0 clearfix noLiga-true">
					<span class="unit pvs fgc1">liga: </span>
					<input type="text" readonly value="" class="liga unitRight" />
				</div>
			</div>
			<div class="glyph fs1">
				<div class="clearfix bshadow0 pbs">
					<span class="icon-uF00B6"></span><span class="mls"> icon-uF00B6</span>
				</div>
				<fieldset class="fs0 size1of1 clearfix">
					<input type="text" readonly value="f500f" class="unit size1of2" />
					<input type="text" maxlength="1" readonly value="&#xf500f;" class="unitRight size1of2 talign-right" />
				</fieldset>
				<div class="fs0 bshadow0 clearfix noLiga-true">
					<span class="unit pvs fgc1">liga: </span>
					<input type="text" readonly value="" class="liga unitRight" />
				</div>
			</div>
			<div class="glyph fs1">
				<div class="clearfix bshadow0 pbs">
					<span class="icon-uF00B2"></span><span class="mls"> icon-uF00B2</span>
				</div>
				<fieldset class="fs0 size1of1 clearfix">
					<input type="text" readonly value="f5010" class="unit size1of2" />
					<input type="text" maxlength="1" readonly value="&#xf5010;" class="unitRight size1of2 talign-right" />
				</fieldset>
				<div class="fs0 bshadow0 clearfix noLiga-true">
					<span class="unit pvs fgc1">liga: </span>
					<input type="text" readonly value="" class="liga unitRight" />
				</div>
			</div>
			<div class="glyph fs1">
				<div class="clearfix bshadow0 pbs">
					<span class="icon-uni65"></span><span class="mls"> icon-uni65</span>
				</div>
				<fieldset class="fs0 size1of1 clearfix">
					<input type="text" readonly value="f5011" class="unit size1of2" />
					<input type="text" maxlength="1" readonly value="&#xf5011;" class="unitRight size1of2 talign-right" />
				</fieldset>
				<div class="fs0 bshadow0 clearfix noLiga-true">
					<span class="unit pvs fgc1">liga: </span>
					<input type="text" readonly value="" class="liga unitRight" />
				</div>
			</div>
			<div class="glyph fs1">
				<div class="clearfix bshadow0 pbs">
					<span class="icon-uni66"></span><span class="mls"> icon-uni66</span>
				</div>
				<fieldset class="fs0 size1of1 clearfix">
					<input type="text" readonly value="f5012" class="unit size1of2" />
					<input type="text" maxlength="1" readonly value="&#xf5012;" class="unitRight size1of2 talign-right" />
				</fieldset>
				<div class="fs0 bshadow0 clearfix noLiga-true">
					<span class="unit pvs fgc1">liga: </span>
					<input type="text" readonly value="" class="liga unitRight" />
				</div>
			</div>
			<div class="glyph fs1">
				<div class="clearfix bshadow0 pbs">
					<span class="icon-uni67"></span><span class="mls"> icon-uni67</span>
				</div>
				<fieldset class="fs0 size1of1 clearfix">
					<input type="text" readonly value="f5013" class="unit size1of2" />
					<input type="text" maxlength="1" readonly value="&#xf5013;" class="unitRight size1of2 talign-right" />
				</fieldset>
				<div class="fs0 bshadow0 clearfix noLiga-true">
					<span class="unit pvs fgc1">liga: </span>
					<input type="text" readonly value="" class="liga unitRight" />
				</div>
			</div>
			<div class="glyph fs1">
				<div class="clearfix bshadow0 pbs">
					<span class="icon-uF013E"></span><span class="mls"> icon-uF013E</span>
				</div>
				<fieldset class="fs0 size1of1 clearfix">
					<input type="text" readonly value="f5014" class="unit size1of2" />
					<input type="text" maxlength="1" readonly value="&#xf5014;" class="unitRight size1of2 talign-right" />
				</fieldset>
				<div class="fs0 bshadow0 clearfix noLiga-true">
					<span class="unit pvs fgc1">liga: </span>
					<input type="text" readonly value="" class="liga unitRight" />
				</div>
			</div>
			<div class="glyph fs1">
				<div class="clearfix bshadow0 pbs">
					<span class="icon-uni5E"></span><span class="mls"> icon-uni5E</span>
				</div>
				<fieldset class="fs0 size1of1 clearfix">
					<input type="text" readonly value="f5015" class="unit size1of2" />
					<input type="text" maxlength="1" readonly value="&#xf5015;" class="unitRight size1of2 talign-right" />
				</fieldset>
				<div class="fs0 bshadow0 clearfix noLiga-true">
					<span class="unit pvs fgc1">liga: </span>
					<input type="text" readonly value="" class="liga unitRight" />
				</div>
			</div>
			<div class="glyph fs1">
				<div class="clearfix bshadow0 pbs">
					<span class="icon-uF001E"></span><span class="mls"> icon-uF001E</span>
				</div>
				<fieldset class="fs0 size1of1 clearfix">
					<input type="text" readonly value="f5016" class="unit size1of2" />
					<input type="text" maxlength="1" readonly value="&#xf5016;" class="unitRight size1of2 talign-right" />
				</fieldset>
				<div class="fs0 bshadow0 clearfix noLiga-true">
					<span class="unit pvs fgc1">liga: </span>
					<input type="text" readonly value="" class="liga unitRight" />
				</div>
			</div>
			<div class="glyph fs1">
				<div class="clearfix bshadow0 pbs">
					<span class="icon-uni346A"></span><span class="mls"> icon-uni346A</span>
				</div>
				<fieldset class="fs0 size1of1 clearfix">
					<input type="text" readonly value="f5017" class="unit size1of2" />
					<input type="text" maxlength="1" readonly value="&#xf5017;" class="unitRight size1of2 talign-right" />
				</fieldset>
				<div class="fs0 bshadow0 clearfix noLiga-true">
					<span class="unit pvs fgc1">liga: </span>
					<input type="text" readonly value="" class="liga unitRight" />
				</div>
			</div>
			<div class="glyph fs1">
				<div class="clearfix bshadow0 pbs">
					<span class="icon-uni5F"></span><span class="mls"> icon-uni5F</span>
				</div>
				<fieldset class="fs0 size1of1 clearfix">
					<input type="text" readonly value="f5018" class="unit size1of2" />
					<input type="text" maxlength="1" readonly value="&#xf5018;" class="unitRight size1of2 talign-right" />
				</fieldset>
				<div class="fs0 bshadow0 clearfix noLiga-true">
					<span class="unit pvs fgc1">liga: </span>
					<input type="text" readonly value="" class="liga unitRight" />
				</div>
			</div>
			<div class="glyph fs1">
				<div class="clearfix bshadow0 pbs">
					<span class="icon-uF018D"></span><span class="mls"> icon-uF018D</span>
				</div>
				<fieldset class="fs0 size1of1 clearfix">
					<input type="text" readonly value="f5019" class="unit size1of2" />
					<input type="text" maxlength="1" readonly value="&#xf5019;" class="unitRight size1of2 talign-right" />
				</fieldset>
				<div class="fs0 bshadow0 clearfix noLiga-true">
					<span class="unit pvs fgc1">liga: </span>
					<input type="text" readonly value="" class="liga unitRight" />
				</div>
			</div>
			<div class="glyph fs1">
				<div class="clearfix bshadow0 pbs">
					<span class="icon-uni60"></span><span class="mls"> icon-uni60</span>
				</div>
				<fieldset class="fs0 size1of1 clearfix">
					<input type="text" readonly value="f501a" class="unit size1of2" />
					<input type="text" maxlength="1" readonly value="&#xf501a;" class="unitRight size1of2 talign-right" />
				</fieldset>
				<div class="fs0 bshadow0 clearfix noLiga-true">
					<span class="unit pvs fgc1">liga: </span>
					<input type="text" readonly value="" class="liga unitRight" />
				</div>
			</div>
			<div class="glyph fs1">
				<div class="clearfix bshadow0 pbs">
					<span class="icon-uF00E8"></span><span class="mls"> icon-uF00E8</span>
				</div>
				<fieldset class="fs0 size1of1 clearfix">
					<input type="text" readonly value="f501b" class="unit size1of2" />
					<input type="text" maxlength="1" readonly value="&#xf501b;" class="unitRight size1of2 talign-right" />
				</fieldset>
				<div class="fs0 bshadow0 clearfix noLiga-true">
					<span class="unit pvs fgc1">liga: </span>
					<input type="text" readonly value="" class="liga unitRight" />
				</div>
			</div>
			<div class="glyph fs1">
				<div class="clearfix bshadow0 pbs">
					<span class="icon-uF0166"></span><span class="mls"> icon-uF0166</span>
				</div>
				<fieldset class="fs0 size1of1 clearfix">
					<input type="text" readonly value="f501c" class="unit size1of2" />
					<input type="text" maxlength="1" readonly value="&#xf501c;" class="unitRight size1of2 talign-right" />
				</fieldset>
				<div class="fs0 bshadow0 clearfix noLiga-true">
					<span class="unit pvs fgc1">liga: </span>
					<input type="text" readonly value="" class="liga unitRight" />
				</div>
			</div>
			<div class="glyph fs1">
				<div class="clearfix bshadow0 pbs">
					<span class="icon-uF010D"></span><span class="mls"> icon-uF010D</span>
				</div>
				<fieldset class="fs0 size1of1 clearfix">
					<input type="text" readonly value="f501d" class="unit size1of2" />
					<input type="text" maxlength="1" readonly value="&#xf501d;" class="unitRight size1of2 talign-right" />
				</fieldset>
				<div class="fs0 bshadow0 clearfix noLiga-true">
					<span class="unit pvs fgc1">liga: </span>
					<input type="text" readonly value="" class="liga unitRight" />
				</div>
			</div>
			<div class="glyph fs1">
				<div class="clearfix bshadow0 pbs">
					<span class="icon-uF003A"></span><span class="mls"> icon-uF003A</span>
				</div>
				<fieldset class="fs0 size1of1 clearfix">
					<input type="text" readonly value="f501e" class="unit size1of2" />
					<input type="text" maxlength="1" readonly value="&#xf501e;" class="unitRight size1of2 talign-right" />
				</fieldset>
				<div class="fs0 bshadow0 clearfix noLiga-true">
					<span class="unit pvs fgc1">liga: </span>
					<input type="text" readonly value="" class="liga unitRight" />
				</div>
			</div>
			<div class="glyph fs1">
				<div class="clearfix bshadow0 pbs">
					<span class="icon-uni345E"></span><span class="mls"> icon-uni345E</span>
				</div>
				<fieldset class="fs0 size1of1 clearfix">
					<input type="text" readonly value="f501f" class="unit size1of2" />
					<input type="text" maxlength="1" readonly value="&#xf501f;" class="unitRight size1of2 talign-right" />
				</fieldset>
				<div class="fs0 bshadow0 clearfix noLiga-true">
					<span class="unit pvs fgc1">liga: </span>
					<input type="text" readonly value="" class="liga unitRight" />
				</div>
			</div>
			<div class="glyph fs1">
				<div class="clearfix bshadow0 pbs">
					<span class="icon-uni63"></span><span class="mls"> icon-uni63</span>
				</div>
				<fieldset class="fs0 size1of1 clearfix">
					<input type="text" readonly value="f5020" class="unit size1of2" />
					<input type="text" maxlength="1" readonly value="&#xf5020;" class="unitRight size1of2 talign-right" />
				</fieldset>
				<div class="fs0 bshadow0 clearfix noLiga-true">
					<span class="unit pvs fgc1">liga: </span>
					<input type="text" readonly value="" class="liga unitRight" />
				</div>
			</div>
			<div class="glyph fs1">
				<div class="clearfix bshadow0 pbs">
					<span class="icon-uni64"></span><span class="mls"> icon-uni64</span>
				</div>
				<fieldset class="fs0 size1of1 clearfix">
					<input type="text" readonly value="f5021" class="unit size1of2" />
					<input type="text" maxlength="1" readonly value="&#xf5021;" class="unitRight size1of2 talign-right" />
				</fieldset>
				<div class="fs0 bshadow0 clearfix noLiga-true">
					<span class="unit pvs fgc1">liga: </span>
					<input type="text" readonly value="" class="liga unitRight" />
				</div>
			</div>
			<div class="glyph fs1">
				<div class="clearfix bshadow0 pbs">
					<span class="icon-uni3462"></span><span class="mls"> icon-uni3462</span>
				</div>
				<fieldset class="fs0 size1of1 clearfix">
					<input type="text" readonly value="f5022" class="unit size1of2" />
					<input type="text" maxlength="1" readonly value="&#xf5022;" class="unitRight size1of2 talign-right" />
				</fieldset>
				<div class="fs0 bshadow0 clearfix noLiga-true">
					<span class="unit pvs fgc1">liga: </span>
					<input type="text" readonly value="" class="liga unitRight" />
				</div>
			</div>
			<div class="glyph fs1">
				<div class="clearfix bshadow0 pbs">
					<span class="icon-uF003E"></span><span class="mls"> icon-uF003E</span>
				</div>
				<fieldset class="fs0 size1of1 clearfix">
					<input type="text" readonly value="f5023" class="unit size1of2" />
					<input type="text" maxlength="1" readonly value="&#xf5023;" class="unitRight size1of2 talign-right" />
				</fieldset>
				<div class="fs0 bshadow0 clearfix noLiga-true">
					<span class="unit pvs fgc1">liga: </span>
					<input type="text" readonly value="" class="liga unitRight" />
				</div>
			</div>
			<div class="glyph fs1">
				<div class="clearfix bshadow0 pbs">
					<span class="icon-uni71"></span><span class="mls"> icon-uni71</span>
				</div>
				<fieldset class="fs0 size1of1 clearfix">
					<input type="text" readonly value="f5024" class="unit size1of2" />
					<input type="text" maxlength="1" readonly value="&#xf5024;" class="unitRight size1of2 talign-right" />
				</fieldset>
				<div class="fs0 bshadow0 clearfix noLiga-true">
					<span class="unit pvs fgc1">liga: </span>
					<input type="text" readonly value="" class="liga unitRight" />
				</div>
			</div>
			<div class="glyph fs1">
				<div class="clearfix bshadow0 pbs">
					<span class="icon-uni72"></span><span class="mls"> icon-uni72</span>
				</div>
				<fieldset class="fs0 size1of1 clearfix">
					<input type="text" readonly value="f5025" class="unit size1of2" />
					<input type="text" maxlength="1" readonly value="&#xf5025;" class="unitRight size1of2 talign-right" />
				</fieldset>
				<div class="fs0 bshadow0 clearfix noLiga-true">
					<span class="unit pvs fgc1">liga: </span>
					<input type="text" readonly value="" class="liga unitRight" />
				</div>
			</div>
			<div class="glyph fs1">
				<div class="clearfix bshadow0 pbs">
					<span class="icon-uni344D"></span><span class="mls"> icon-uni344D</span>
				</div>
				<fieldset class="fs0 size1of1 clearfix">
					<input type="text" readonly value="f5026" class="unit size1of2" />
					<input type="text" maxlength="1" readonly value="&#xf5026;" class="unitRight size1of2 talign-right" />
				</fieldset>
				<div class="fs0 bshadow0 clearfix noLiga-true">
					<span class="unit pvs fgc1">liga: </span>
					<input type="text" readonly value="" class="liga unitRight" />
				</div>
			</div>
			<div class="glyph fs1">
				<div class="clearfix bshadow0 pbs">
					<span class="icon-uF0092"></span><span class="mls"> icon-uF0092</span>
				</div>
				<fieldset class="fs0 size1of1 clearfix">
					<input type="text" readonly value="f5027" class="unit size1of2" />
					<input type="text" maxlength="1" readonly value="&#xf5027;" class="unitRight size1of2 talign-right" />
				</fieldset>
				<div class="fs0 bshadow0 clearfix noLiga-true">
					<span class="unit pvs fgc1">liga: </span>
					<input type="text" readonly value="" class="liga unitRight" />
				</div>
			</div>
			<div class="glyph fs1">
				<div class="clearfix bshadow0 pbs">
					<span class="icon-uni5A"></span><span class="mls"> icon-uni5A</span>
				</div>
				<fieldset class="fs0 size1of1 clearfix">
					<input type="text" readonly value="f5028" class="unit size1of2" />
					<input type="text" maxlength="1" readonly value="&#xf5028;" class="unitRight size1of2 talign-right" />
				</fieldset>
				<div class="fs0 bshadow0 clearfix noLiga-true">
					<span class="unit pvs fgc1">liga: </span>
					<input type="text" readonly value="" class="liga unitRight" />
				</div>
			</div>
			<div class="glyph fs1">
				<div class="clearfix bshadow0 pbs">
					<span class="icon-uni5B"></span><span class="mls"> icon-uni5B</span>
				</div>
				<fieldset class="fs0 size1of1 clearfix">
					<input type="text" readonly value="f5029" class="unit size1of2" />
					<input type="text" maxlength="1" readonly value="&#xf5029;" class="unitRight size1of2 talign-right" />
				</fieldset>
				<div class="fs0 bshadow0 clearfix noLiga-true">
					<span class="unit pvs fgc1">liga: </span>
					<input type="text" readonly value="" class="liga unitRight" />
				</div>
			</div>
			<div class="glyph fs1">
				<div class="clearfix bshadow0 pbs">
					<span class="icon-uni3433"></span><span class="mls"> icon-uni3433</span>
				</div>
				<fieldset class="fs0 size1of1 clearfix">
					<input type="text" readonly value="f502a" class="unit size1of2" />
					<input type="text" maxlength="1" readonly value="&#xf502a;" class="unitRight size1of2 talign-right" />
				</fieldset>
				<div class="fs0 bshadow0 clearfix noLiga-true">
					<span class="unit pvs fgc1">liga: </span>
					<input type="text" readonly value="" class="liga unitRight" />
				</div>
			</div>
			<div class="glyph fs1">
				<div class="clearfix bshadow0 pbs">
					<span class="icon-uF001A"></span><span class="mls"> icon-uF001A</span>
				</div>
				<fieldset class="fs0 size1of1 clearfix">
					<input type="text" readonly value="f502b" class="unit size1of2" />
					<input type="text" maxlength="1" readonly value="&#xf502b;" class="unitRight size1of2 talign-right" />
				</fieldset>
				<div class="fs0 bshadow0 clearfix noLiga-true">
					<span class="unit pvs fgc1">liga: </span>
					<input type="text" readonly value="" class="liga unitRight" />
				</div>
			</div>
			<div class="glyph fs1">
				<div class="clearfix bshadow0 pbs">
					<span class="icon-uF001B"></span><span class="mls"> icon-uF001B</span>
				</div>
				<fieldset class="fs0 size1of1 clearfix">
					<input type="text" readonly value="f502c" class="unit size1of2" />
					<input type="text" maxlength="1" readonly value="&#xf502c;" class="unitRight size1of2 talign-right" />
				</fieldset>
				<div class="fs0 bshadow0 clearfix noLiga-true">
					<span class="unit pvs fgc1">liga: </span>
					<input type="text" readonly value="" class="liga unitRight" />
				</div>
			</div>
			<div class="glyph fs1">
				<div class="clearfix bshadow0 pbs">
					<span class="icon-uni3463"></span><span class="mls"> icon-uni3463</span>
				</div>
				<fieldset class="fs0 size1of1 clearfix">
					<input type="text" readonly value="f502d" class="unit size1of2" />
					<input type="text" maxlength="1" readonly value="&#xf502d;" class="unitRight size1of2 talign-right" />
				</fieldset>
				<div class="fs0 bshadow0 clearfix noLiga-true">
					<span class="unit pvs fgc1">liga: </span>
					<input type="text" readonly value="" class="liga unitRight" />
				</div>
			</div>
			<div class="glyph fs1">
				<div class="clearfix bshadow0 pbs">
					<span class="icon-uF01BC"></span><span class="mls"> icon-uF01BC</span>
				</div>
				<fieldset class="fs0 size1of1 clearfix">
					<input type="text" readonly value="f502e" class="unit size1of2" />
					<input type="text" maxlength="1" readonly value="&#xf502e;" class="unitRight size1of2 talign-right" />
				</fieldset>
				<div class="fs0 bshadow0 clearfix noLiga-true">
					<span class="unit pvs fgc1">liga: </span>
					<input type="text" readonly value="" class="liga unitRight" />
				</div>
			</div>
			<div class="glyph fs1">
				<div class="clearfix bshadow0 pbs">
					<span class="icon-uni343E"></span><span class="mls"> icon-uni343E</span>
				</div>
				<fieldset class="fs0 size1of1 clearfix">
					<input type="text" readonly value="f502f" class="unit size1of2" />
					<input type="text" maxlength="1" readonly value="&#xf502f;" class="unitRight size1of2 talign-right" />
				</fieldset>
				<div class="fs0 bshadow0 clearfix noLiga-true">
					<span class="unit pvs fgc1">liga: </span>
					<input type="text" readonly value="" class="liga unitRight" />
				</div>
			</div>
			<div class="glyph fs1">
				<div class="clearfix bshadow0 pbs">
					<span class="icon-uni3432"></span><span class="mls"> icon-uni3432</span>
				</div>
				<fieldset class="fs0 size1of1 clearfix">
					<input type="text" readonly value="f5030" class="unit size1of2" />
					<input type="text" maxlength="1" readonly value="&#xf5030;" class="unitRight size1of2 talign-right" />
				</fieldset>
				<div class="fs0 bshadow0 clearfix noLiga-true">
					<span class="unit pvs fgc1">liga: </span>
					<input type="text" readonly value="" class="liga unitRight" />
				</div>
			</div>
			<div class="glyph fs1">
				<div class="clearfix bshadow0 pbs">
					<span class="icon-uF0025"></span><span class="mls"> icon-uF0025</span>
				</div>
				<fieldset class="fs0 size1of1 clearfix">
					<input type="text" readonly value="f5031" class="unit size1of2" />
					<input type="text" maxlength="1" readonly value="&#xf5031;" class="unitRight size1of2 talign-right" />
				</fieldset>
				<div class="fs0 bshadow0 clearfix noLiga-true">
					<span class="unit pvs fgc1">liga: </span>
					<input type="text" readonly value="" class="liga unitRight" />
				</div>
			</div>
			<div class="glyph fs1">
				<div class="clearfix bshadow0 pbs">
					<span class="icon-uF002F"></span><span class="mls"> icon-uF002F</span>
				</div>
				<fieldset class="fs0 size1of1 clearfix">
					<input type="text" readonly value="f5032" class="unit size1of2" />
					<input type="text" maxlength="1" readonly value="&#xf5032;" class="unitRight size1of2 talign-right" />
				</fieldset>
				<div class="fs0 bshadow0 clearfix noLiga-true">
					<span class="unit pvs fgc1">liga: </span>
					<input type="text" readonly value="" class="liga unitRight" />
				</div>
			</div>
			<div class="glyph fs1">
				<div class="clearfix bshadow0 pbs">
					<span class="icon-uni4D"></span><span class="mls"> icon-uni4D</span>
				</div>
				<fieldset class="fs0 size1of1 clearfix">
					<input type="text" readonly value="f5033" class="unit size1of2" />
					<input type="text" maxlength="1" readonly value="&#xf5033;" class="unitRight size1of2 talign-right" />
				</fieldset>
				<div class="fs0 bshadow0 clearfix noLiga-true">
					<span class="unit pvs fgc1">liga: </span>
					<input type="text" readonly value="" class="liga unitRight" />
				</div>
			</div>
			<div class="glyph fs1">
				<div class="clearfix bshadow0 pbs">
					<span class="icon-uni4E"></span><span class="mls"> icon-uni4E</span>
				</div>
				<fieldset class="fs0 size1of1 clearfix">
					<input type="text" readonly value="f5034" class="unit size1of2" />
					<input type="text" maxlength="1" readonly value="&#xf5034;" class="unitRight size1of2 talign-right" />
				</fieldset>
				<div class="fs0 bshadow0 clearfix noLiga-true">
					<span class="unit pvs fgc1">liga: </span>
					<input type="text" readonly value="" class="liga unitRight" />
				</div>
			</div>
			<div class="glyph fs1">
				<div class="clearfix bshadow0 pbs">
					<span class="icon-uni4F"></span><span class="mls"> icon-uni4F</span>
				</div>
				<fieldset class="fs0 size1of1 clearfix">
					<input type="text" readonly value="f5035" class="unit size1of2" />
					<input type="text" maxlength="1" readonly value="&#xf5035;" class="unitRight size1of2 talign-right" />
				</fieldset>
				<div class="fs0 bshadow0 clearfix noLiga-true">
					<span class="unit pvs fgc1">liga: </span>
					<input type="text" readonly value="" class="liga unitRight" />
				</div>
			</div>
			<div class="glyph fs1">
				<div class="clearfix bshadow0 pbs">
					<span class="icon-uni50"></span><span class="mls"> icon-uni50</span>
				</div>
				<fieldset class="fs0 size1of1 clearfix">
					<input type="text" readonly value="f5036" class="unit size1of2" />
					<input type="text" maxlength="1" readonly value="&#xf5036;" class="unitRight size1of2 talign-right" />
				</fieldset>
				<div class="fs0 bshadow0 clearfix noLiga-true">
					<span class="unit pvs fgc1">liga: </span>
					<input type="text" readonly value="" class="liga unitRight" />
				</div>
			</div>
			<div class="glyph fs1">
				<div class="clearfix bshadow0 pbs">
					<span class="icon-uF0144"></span><span class="mls"> icon-uF0144</span>
				</div>
				<fieldset class="fs0 size1of1 clearfix">
					<input type="text" readonly value="f5037" class="unit size1of2" />
					<input type="text" maxlength="1" readonly value="&#xf5037;" class="unitRight size1of2 talign-right" />
				</fieldset>
				<div class="fs0 bshadow0 clearfix noLiga-true">
					<span class="unit pvs fgc1">liga: </span>
					<input type="text" readonly value="" class="liga unitRight" />
				</div>
			</div>
			<div class="glyph fs1">
				<div class="clearfix bshadow0 pbs">
					<span class="icon-uF0290"></span><span class="mls"> icon-uF0290</span>
				</div>
				<fieldset class="fs0 size1of1 clearfix">
					<input type="text" readonly value="f5038" class="unit size1of2" />
					<input type="text" maxlength="1" readonly value="&#xf5038;" class="unitRight size1of2 talign-right" />
				</fieldset>
				<div class="fs0 bshadow0 clearfix noLiga-true">
					<span class="unit pvs fgc1">liga: </span>
					<input type="text" readonly value="" class="liga unitRight" />
				</div>
			</div>
			<div class="glyph fs1">
				<div class="clearfix bshadow0 pbs">
					<span class="icon-uniE026"></span><span class="mls"> icon-uniE026</span>
				</div>
				<fieldset class="fs0 size1of1 clearfix">
					<input type="text" readonly value="f5039" class="unit size1of2" />
					<input type="text" maxlength="1" readonly value="&#xf5039;" class="unitRight size1of2 talign-right" />
				</fieldset>
				<div class="fs0 bshadow0 clearfix noLiga-true">
					<span class="unit pvs fgc1">liga: </span>
					<input type="text" readonly value="" class="liga unitRight" />
				</div>
			</div>
			<div class="glyph fs1">
				<div class="clearfix bshadow0 pbs">
					<span class="icon-uni3491"></span><span class="mls"> icon-uni3491</span>
				</div>
				<fieldset class="fs0 size1of1 clearfix">
					<input type="text" readonly value="f503a" class="unit size1of2" />
					<input type="text" maxlength="1" readonly value="&#xf503a;" class="unitRight size1of2 talign-right" />
				</fieldset>
				<div class="fs0 bshadow0 clearfix noLiga-true">
					<span class="unit pvs fgc1">liga: </span>
					<input type="text" readonly value="" class="liga unitRight" />
				</div>
			</div>
			<div class="glyph fs1">
				<div class="clearfix bshadow0 pbs">
					<span class="icon-uF0142"></span><span class="mls"> icon-uF0142</span>
				</div>
				<fieldset class="fs0 size1of1 clearfix">
					<input type="text" readonly value="f503b" class="unit size1of2" />
					<input type="text" maxlength="1" readonly value="&#xf503b;" class="unitRight size1of2 talign-right" />
				</fieldset>
				<div class="fs0 bshadow0 clearfix noLiga-true">
					<span class="unit pvs fgc1">liga: </span>
					<input type="text" readonly value="" class="liga unitRight" />
				</div>
			</div>
			<div class="glyph fs1">
				<div class="clearfix bshadow0 pbs">
					<span class="icon-uF0050"></span><span class="mls"> icon-uF0050</span>
				</div>
				<fieldset class="fs0 size1of1 clearfix">
					<input type="text" readonly value="f503c" class="unit size1of2" />
					<input type="text" maxlength="1" readonly value="&#xf503c;" class="unitRight size1of2 talign-right" />
				</fieldset>
				<div class="fs0 bshadow0 clearfix noLiga-true">
					<span class="unit pvs fgc1">liga: </span>
					<input type="text" readonly value="" class="liga unitRight" />
				</div>
			</div>
			<div class="glyph fs1">
				<div class="clearfix bshadow0 pbs">
					<span class="icon-uF0159"></span><span class="mls"> icon-uF0159</span>
				</div>
				<fieldset class="fs0 size1of1 clearfix">
					<input type="text" readonly value="f503d" class="unit size1of2" />
					<input type="text" maxlength="1" readonly value="&#xf503d;" class="unitRight size1of2 talign-right" />
				</fieldset>
				<div class="fs0 bshadow0 clearfix noLiga-true">
					<span class="unit pvs fgc1">liga: </span>
					<input type="text" readonly value="" class="liga unitRight" />
				</div>
			</div>
			<div class="glyph fs1">
				<div class="clearfix bshadow0 pbs">
					<span class="icon-uF017A"></span><span class="mls"> icon-uF017A</span>
				</div>
				<fieldset class="fs0 size1of1 clearfix">
					<input type="text" readonly value="f503e" class="unit size1of2" />
					<input type="text" maxlength="1" readonly value="&#xf503e;" class="unitRight size1of2 talign-right" />
				</fieldset>
				<div class="fs0 bshadow0 clearfix noLiga-true">
					<span class="unit pvs fgc1">liga: </span>
					<input type="text" readonly value="" class="liga unitRight" />
				</div>
			</div>
			<div class="glyph fs1">
				<div class="clearfix bshadow0 pbs">
					<span class="icon-uni3B"></span><span class="mls"> icon-uni3B</span>
				</div>
				<fieldset class="fs0 size1of1 clearfix">
					<input type="text" readonly value="f503f" class="unit size1of2" />
					<input type="text" maxlength="1" readonly value="&#xf503f;" class="unitRight size1of2 talign-right" />
				</fieldset>
				<div class="fs0 bshadow0 clearfix noLiga-true">
					<span class="unit pvs fgc1">liga: </span>
					<input type="text" readonly value="" class="liga unitRight" />
				</div>
			</div>
			<div class="glyph fs1">
				<div class="clearfix bshadow0 pbs">
					<span class="icon-uF01FF"></span><span class="mls"> icon-uF01FF</span>
				</div>
				<fieldset class="fs0 size1of1 clearfix">
					<input type="text" readonly value="f5040" class="unit size1of2" />
					<input type="text" maxlength="1" readonly value="&#xf5040;" class="unitRight size1of2 talign-right" />
				</fieldset>
				<div class="fs0 bshadow0 clearfix noLiga-true">
					<span class="unit pvs fgc1">liga: </span>
					<input type="text" readonly value="" class="liga unitRight" />
				</div>
			</div>
			<div class="glyph fs1">
				<div class="clearfix bshadow0 pbs">
					<span class="icon-uniE01A"></span><span class="mls"> icon-uniE01A</span>
				</div>
				<fieldset class="fs0 size1of1 clearfix">
					<input type="text" readonly value="f5041" class="unit size1of2" />
					<input type="text" maxlength="1" readonly value="&#xf5041;" class="unitRight size1of2 talign-right" />
				</fieldset>
				<div class="fs0 bshadow0 clearfix noLiga-true">
					<span class="unit pvs fgc1">liga: </span>
					<input type="text" readonly value="" class="liga unitRight" />
				</div>
			</div>
			<div class="glyph fs1">
				<div class="clearfix bshadow0 pbs">
					<span class="icon-uF0174"></span><span class="mls"> icon-uF0174</span>
				</div>
				<fieldset class="fs0 size1of1 clearfix">
					<input type="text" readonly value="f5042" class="unit size1of2" />
					<input type="text" maxlength="1" readonly value="&#xf5042;" class="unitRight size1of2 talign-right" />
				</fieldset>
				<div class="fs0 bshadow0 clearfix noLiga-true">
					<span class="unit pvs fgc1">liga: </span>
					<input type="text" readonly value="" class="liga unitRight" />
				</div>
			</div>
			<div class="glyph fs1">
				<div class="clearfix bshadow0 pbs">
					<span class="icon-uF0197"></span><span class="mls"> icon-uF0197</span>
				</div>
				<fieldset class="fs0 size1of1 clearfix">
					<input type="text" readonly value="f5043" class="unit size1of2" />
					<input type="text" maxlength="1" readonly value="&#xf5043;" class="unitRight size1of2 talign-right" />
				</fieldset>
				<div class="fs0 bshadow0 clearfix noLiga-true">
					<span class="unit pvs fgc1">liga: </span>
					<input type="text" readonly value="" class="liga unitRight" />
				</div>
			</div>
			<div class="glyph fs1">
				<div class="clearfix bshadow0 pbs">
					<span class="icon-uF00DD"></span><span class="mls"> icon-uF00DD</span>
				</div>
				<fieldset class="fs0 size1of1 clearfix">
					<input type="text" readonly value="f5044" class="unit size1of2" />
					<input type="text" maxlength="1" readonly value="&#xf5044;" class="unitRight size1of2 talign-right" />
				</fieldset>
				<div class="fs0 bshadow0 clearfix noLiga-true">
					<span class="unit pvs fgc1">liga: </span>
					<input type="text" readonly value="" class="liga unitRight" />
				</div>
			</div>
			<div class="glyph fs1">
				<div class="clearfix bshadow0 pbs">
					<span class="icon-uni6F"></span><span class="mls"> icon-uni6F</span>
				</div>
				<fieldset class="fs0 size1of1 clearfix">
					<input type="text" readonly value="f5045" class="unit size1of2" />
					<input type="text" maxlength="1" readonly value="&#xf5045;" class="unitRight size1of2 talign-right" />
				</fieldset>
				<div class="fs0 bshadow0 clearfix noLiga-true">
					<span class="unit pvs fgc1">liga: </span>
					<input type="text" readonly value="" class="liga unitRight" />
				</div>
			</div>
			<div class="glyph fs1">
				<div class="clearfix bshadow0 pbs">
					<span class="icon-uni70"></span><span class="mls"> icon-uni70</span>
				</div>
				<fieldset class="fs0 size1of1 clearfix">
					<input type="text" readonly value="f5046" class="unit size1of2" />
					<input type="text" maxlength="1" readonly value="&#xf5046;" class="unitRight size1of2 talign-right" />
				</fieldset>
				<div class="fs0 bshadow0 clearfix noLiga-true">
					<span class="unit pvs fgc1">liga: </span>
					<input type="text" readonly value="" class="liga unitRight" />
				</div>
			</div>
			<div class="glyph fs1">
				<div class="clearfix bshadow0 pbs">
					<span class="icon-uF004F"></span><span class="mls"> icon-uF004F</span>
				</div>
				<fieldset class="fs0 size1of1 clearfix">
					<input type="text" readonly value="f5047" class="unit size1of2" />
					<input type="text" maxlength="1" readonly value="&#xf5047;" class="unitRight size1of2 talign-right" />
				</fieldset>
				<div class="fs0 bshadow0 clearfix noLiga-true">
					<span class="unit pvs fgc1">liga: </span>
					<input type="text" readonly value="" class="liga unitRight" />
				</div>
			</div>
			<div class="glyph fs1">
				<div class="clearfix bshadow0 pbs">
					<span class="icon-uni346F"></span><span class="mls"> icon-uni346F</span>
				</div>
				<fieldset class="fs0 size1of1 clearfix">
					<input type="text" readonly value="f5048" class="unit size1of2" />
					<input type="text" maxlength="1" readonly value="&#xf5048;" class="unitRight size1of2 talign-right" />
				</fieldset>
				<div class="fs0 bshadow0 clearfix noLiga-true">
					<span class="unit pvs fgc1">liga: </span>
					<input type="text" readonly value="" class="liga unitRight" />
				</div>
			</div>
			<div class="glyph fs1">
				<div class="clearfix bshadow0 pbs">
					<span class="icon-uF017F"></span><span class="mls"> icon-uF017F</span>
				</div>
				<fieldset class="fs0 size1of1 clearfix">
					<input type="text" readonly value="f5049" class="unit size1of2" />
					<input type="text" maxlength="1" readonly value="&#xf5049;" class="unitRight size1of2 talign-right" />
				</fieldset>
				<div class="fs0 bshadow0 clearfix noLiga-true">
					<span class="unit pvs fgc1">liga: </span>
					<input type="text" readonly value="" class="liga unitRight" />
				</div>
			</div>
			<div class="glyph fs1">
				<div class="clearfix bshadow0 pbs">
					<span class="icon-uF0180"></span><span class="mls"> icon-uF0180</span>
				</div>
				<fieldset class="fs0 size1of1 clearfix">
					<input type="text" readonly value="f504a" class="unit size1of2" />
					<input type="text" maxlength="1" readonly value="&#xf504a;" class="unitRight size1of2 talign-right" />
				</fieldset>
				<div class="fs0 bshadow0 clearfix noLiga-true">
					<span class="unit pvs fgc1">liga: </span>
					<input type="text" readonly value="" class="liga unitRight" />
				</div>
			</div>
			<div class="glyph fs1">
				<div class="clearfix bshadow0 pbs">
					<span class="icon-uF0181"></span><span class="mls"> icon-uF0181</span>
				</div>
				<fieldset class="fs0 size1of1 clearfix">
					<input type="text" readonly value="f504b" class="unit size1of2" />
					<input type="text" maxlength="1" readonly value="&#xf504b;" class="unitRight size1of2 talign-right" />
				</fieldset>
				<div class="fs0 bshadow0 clearfix noLiga-true">
					<span class="unit pvs fgc1">liga: </span>
					<input type="text" readonly value="" class="liga unitRight" />
				</div>
			</div>
			<div class="glyph fs1">
				<div class="clearfix bshadow0 pbs">
					<span class="icon-uF0182"></span><span class="mls"> icon-uF0182</span>
				</div>
				<fieldset class="fs0 size1of1 clearfix">
					<input type="text" readonly value="f504c" class="unit size1of2" />
					<input type="text" maxlength="1" readonly value="&#xf504c;" class="unitRight size1of2 talign-right" />
				</fieldset>
				<div class="fs0 bshadow0 clearfix noLiga-true">
					<span class="unit pvs fgc1">liga: </span>
					<input type="text" readonly value="" class="liga unitRight" />
				</div>
			</div>
			<div class="glyph fs1">
				<div class="clearfix bshadow0 pbs">
					<span class="icon-uF0183"></span><span class="mls"> icon-uF0183</span>
				</div>
				<fieldset class="fs0 size1of1 clearfix">
					<input type="text" readonly value="f504d" class="unit size1of2" />
					<input type="text" maxlength="1" readonly value="&#xf504d;" class="unitRight size1of2 talign-right" />
				</fieldset>
				<div class="fs0 bshadow0 clearfix noLiga-true">
					<span class="unit pvs fgc1">liga: </span>
					<input type="text" readonly value="" class="liga unitRight" />
				</div>
			</div>
			<div class="glyph fs1">
				<div class="clearfix bshadow0 pbs">
					<span class="icon-uF0184"></span><span class="mls"> icon-uF0184</span>
				</div>
				<fieldset class="fs0 size1of1 clearfix">
					<input type="text" readonly value="f504e" class="unit size1of2" />
					<input type="text" maxlength="1" readonly value="&#xf504e;" class="unitRight size1of2 talign-right" />
				</fieldset>
				<div class="fs0 bshadow0 clearfix noLiga-true">
					<span class="unit pvs fgc1">liga: </span>
					<input type="text" readonly value="" class="liga unitRight" />
				</div>
			</div>
			<div class="glyph fs1">
				<div class="clearfix bshadow0 pbs">
					<span class="icon-uF0185"></span><span class="mls"> icon-uF0185</span>
				</div>
				<fieldset class="fs0 size1of1 clearfix">
					<input type="text" readonly value="f504f" class="unit size1of2" />
					<input type="text" maxlength="1" readonly value="&#xf504f;" class="unitRight size1of2 talign-right" />
				</fieldset>
				<div class="fs0 bshadow0 clearfix noLiga-true">
					<span class="unit pvs fgc1">liga: </span>
					<input type="text" readonly value="" class="liga unitRight" />
				</div>
			</div>
			<div class="glyph fs1">
				<div class="clearfix bshadow0 pbs">
					<span class="icon-uF0186"></span><span class="mls"> icon-uF0186</span>
				</div>
				<fieldset class="fs0 size1of1 clearfix">
					<input type="text" readonly value="f5050" class="unit size1of2" />
					<input type="text" maxlength="1" readonly value="&#xf5050;" class="unitRight size1of2 talign-right" />
				</fieldset>
				<div class="fs0 bshadow0 clearfix noLiga-true">
					<span class="unit pvs fgc1">liga: </span>
					<input type="text" readonly value="" class="liga unitRight" />
				</div>
			</div>
			<div class="glyph fs1">
				<div class="clearfix bshadow0 pbs">
					<span class="icon-uF0187"></span><span class="mls"> icon-uF0187</span>
				</div>
				<fieldset class="fs0 size1of1 clearfix">
					<input type="text" readonly value="f5051" class="unit size1of2" />
					<input type="text" maxlength="1" readonly value="&#xf5051;" class="unitRight size1of2 talign-right" />
				</fieldset>
				<div class="fs0 bshadow0 clearfix noLiga-true">
					<span class="unit pvs fgc1">liga: </span>
					<input type="text" readonly value="" class="liga unitRight" />
				</div>
			</div>
			<div class="glyph fs1">
				<div class="clearfix bshadow0 pbs">
					<span class="icon-uF0198"></span><span class="mls"> icon-uF0198</span>
				</div>
				<fieldset class="fs0 size1of1 clearfix">
					<input type="text" readonly value="f5052" class="unit size1of2" />
					<input type="text" maxlength="1" readonly value="&#xf5052;" class="unitRight size1of2 talign-right" />
				</fieldset>
				<div class="fs0 bshadow0 clearfix noLiga-true">
					<span class="unit pvs fgc1">liga: </span>
					<input type="text" readonly value="" class="liga unitRight" />
				</div>
			</div>
			<div class="glyph fs1">
				<div class="clearfix bshadow0 pbs">
					<span class="icon-uF00F7"></span><span class="mls"> icon-uF00F7</span>
				</div>
				<fieldset class="fs0 size1of1 clearfix">
					<input type="text" readonly value="f5053" class="unit size1of2" />
					<input type="text" maxlength="1" readonly value="&#xf5053;" class="unitRight size1of2 talign-right" />
				</fieldset>
				<div class="fs0 bshadow0 clearfix noLiga-true">
					<span class="unit pvs fgc1">liga: </span>
					<input type="text" readonly value="" class="liga unitRight" />
				</div>
			</div>
			<div class="glyph fs1">
				<div class="clearfix bshadow0 pbs">
					<span class="icon-uni344F"></span><span class="mls"> icon-uni344F</span>
				</div>
				<fieldset class="fs0 size1of1 clearfix">
					<input type="text" readonly value="f5054" class="unit size1of2" />
					<input type="text" maxlength="1" readonly value="&#xf5054;" class="unitRight size1of2 talign-right" />
				</fieldset>
				<div class="fs0 bshadow0 clearfix noLiga-true">
					<span class="unit pvs fgc1">liga: </span>
					<input type="text" readonly value="" class="liga unitRight" />
				</div>
			</div>
			<div class="glyph fs1">
				<div class="clearfix bshadow0 pbs">
					<span class="icon-uni348E"></span><span class="mls"> icon-uni348E</span>
				</div>
				<fieldset class="fs0 size1of1 clearfix">
					<input type="text" readonly value="f5055" class="unit size1of2" />
					<input type="text" maxlength="1" readonly value="&#xf5055;" class="unitRight size1of2 talign-right" />
				</fieldset>
				<div class="fs0 bshadow0 clearfix noLiga-true">
					<span class="unit pvs fgc1">liga: </span>
					<input type="text" readonly value="" class="liga unitRight" />
				</div>
			</div>
			<div class="glyph fs1">
				<div class="clearfix bshadow0 pbs">
					<span class="icon-uF00E9"></span><span class="mls"> icon-uF00E9</span>
				</div>
				<fieldset class="fs0 size1of1 clearfix">
					<input type="text" readonly value="f5056" class="unit size1of2" />
					<input type="text" maxlength="1" readonly value="&#xf5056;" class="unitRight size1of2 talign-right" />
				</fieldset>
				<div class="fs0 bshadow0 clearfix noLiga-true">
					<span class="unit pvs fgc1">liga: </span>
					<input type="text" readonly value="" class="liga unitRight" />
				</div>
			</div>
			<div class="glyph fs1">
				<div class="clearfix bshadow0 pbs">
					<span class="icon-uF00EA"></span><span class="mls"> icon-uF00EA</span>
				</div>
				<fieldset class="fs0 size1of1 clearfix">
					<input type="text" readonly value="f5057" class="unit size1of2" />
					<input type="text" maxlength="1" readonly value="&#xf5057;" class="unitRight size1of2 talign-right" />
				</fieldset>
				<div class="fs0 bshadow0 clearfix noLiga-true">
					<span class="unit pvs fgc1">liga: </span>
					<input type="text" readonly value="" class="liga unitRight" />
				</div>
			</div>
			<div class="glyph fs1">
				<div class="clearfix bshadow0 pbs">
					<span class="icon-uF01C0"></span><span class="mls"> icon-uF01C0</span>
				</div>
				<fieldset class="fs0 size1of1 clearfix">
					<input type="text" readonly value="f5058" class="unit size1of2" />
					<input type="text" maxlength="1" readonly value="&#xf5058;" class="unitRight size1of2 talign-right" />
				</fieldset>
				<div class="fs0 bshadow0 clearfix noLiga-true">
					<span class="unit pvs fgc1">liga: </span>
					<input type="text" readonly value="" class="liga unitRight" />
				</div>
			</div>
			<div class="glyph fs1">
				<div class="clearfix bshadow0 pbs">
					<span class="icon-uF01C1"></span><span class="mls"> icon-uF01C1</span>
				</div>
				<fieldset class="fs0 size1of1 clearfix">
					<input type="text" readonly value="f5059" class="unit size1of2" />
					<input type="text" maxlength="1" readonly value="&#xf5059;" class="unitRight size1of2 talign-right" />
				</fieldset>
				<div class="fs0 bshadow0 clearfix noLiga-true">
					<span class="unit pvs fgc1">liga: </span>
					<input type="text" readonly value="" class="liga unitRight" />
				</div>
			</div>
			<div class="glyph fs1">
				<div class="clearfix bshadow0 pbs">
					<span class="icon-uF01B6"></span><span class="mls"> icon-uF01B6</span>
				</div>
				<fieldset class="fs0 size1of1 clearfix">
					<input type="text" readonly value="f505a" class="unit size1of2" />
					<input type="text" maxlength="1" readonly value="&#xf505a;" class="unitRight size1of2 talign-right" />
				</fieldset>
				<div class="fs0 bshadow0 clearfix noLiga-true">
					<span class="unit pvs fgc1">liga: </span>
					<input type="text" readonly value="" class="liga unitRight" />
				</div>
			</div>
			<div class="glyph fs1">
				<div class="clearfix bshadow0 pbs">
					<span class="icon-uF01B7"></span><span class="mls"> icon-uF01B7</span>
				</div>
				<fieldset class="fs0 size1of1 clearfix">
					<input type="text" readonly value="f505b" class="unit size1of2" />
					<input type="text" maxlength="1" readonly value="&#xf505b;" class="unitRight size1of2 talign-right" />
				</fieldset>
				<div class="fs0 bshadow0 clearfix noLiga-true">
					<span class="unit pvs fgc1">liga: </span>
					<input type="text" readonly value="" class="liga unitRight" />
				</div>
			</div>
			<div class="glyph fs1">
				<div class="clearfix bshadow0 pbs">
					<span class="icon-uni54"></span><span class="mls"> icon-uni54</span>
				</div>
				<fieldset class="fs0 size1of1 clearfix">
					<input type="text" readonly value="f505c" class="unit size1of2" />
					<input type="text" maxlength="1" readonly value="&#xf505c;" class="unitRight size1of2 talign-right" />
				</fieldset>
				<div class="fs0 bshadow0 clearfix noLiga-true">
					<span class="unit pvs fgc1">liga: </span>
					<input type="text" readonly value="" class="liga unitRight" />
				</div>
			</div>
			<div class="glyph fs1">
				<div class="clearfix bshadow0 pbs">
					<span class="icon-uni55"></span><span class="mls"> icon-uni55</span>
				</div>
				<fieldset class="fs0 size1of1 clearfix">
					<input type="text" readonly value="f505d" class="unit size1of2" />
					<input type="text" maxlength="1" readonly value="&#xf505d;" class="unitRight size1of2 talign-right" />
				</fieldset>
				<div class="fs0 bshadow0 clearfix noLiga-true">
					<span class="unit pvs fgc1">liga: </span>
					<input type="text" readonly value="" class="liga unitRight" />
				</div>
			</div>
			<div class="glyph fs1">
				<div class="clearfix bshadow0 pbs">
					<span class="icon-uF01ED"></span><span class="mls"> icon-uF01ED</span>
				</div>
				<fieldset class="fs0 size1of1 clearfix">
					<input type="text" readonly value="f505e" class="unit size1of2" />
					<input type="text" maxlength="1" readonly value="&#xf505e;" class="unitRight size1of2 talign-right" />
				</fieldset>
				<div class="fs0 bshadow0 clearfix noLiga-true">
					<span class="unit pvs fgc1">liga: </span>
					<input type="text" readonly value="" class="liga unitRight" />
				</div>
			</div>
			<div class="glyph fs1">
				<div class="clearfix bshadow0 pbs">
					<span class="icon-uni68"></span><span class="mls"> icon-uni68</span>
				</div>
				<fieldset class="fs0 size1of1 clearfix">
					<input type="text" readonly value="f505f" class="unit size1of2" />
					<input type="text" maxlength="1" readonly value="&#xf505f;" class="unitRight size1of2 talign-right" />
				</fieldset>
				<div class="fs0 bshadow0 clearfix noLiga-true">
					<span class="unit pvs fgc1">liga: </span>
					<input type="text" readonly value="" class="liga unitRight" />
				</div>
			</div>
			<div class="glyph fs1">
				<div class="clearfix bshadow0 pbs">
					<span class="icon-uni69"></span><span class="mls"> icon-uni69</span>
				</div>
				<fieldset class="fs0 size1of1 clearfix">
					<input type="text" readonly value="f5060" class="unit size1of2" />
					<input type="text" maxlength="1" readonly value="&#xf5060;" class="unitRight size1of2 talign-right" />
				</fieldset>
				<div class="fs0 bshadow0 clearfix noLiga-true">
					<span class="unit pvs fgc1">liga: </span>
					<input type="text" readonly value="" class="liga unitRight" />
				</div>
			</div>
			<div class="glyph fs1">
				<div class="clearfix bshadow0 pbs">
					<span class="icon-uF0038"></span><span class="mls"> icon-uF0038</span>
				</div>
				<fieldset class="fs0 size1of1 clearfix">
					<input type="text" readonly value="f5061" class="unit size1of2" />
					<input type="text" maxlength="1" readonly value="&#xf5061;" class="unitRight size1of2 talign-right" />
				</fieldset>
				<div class="fs0 bshadow0 clearfix noLiga-true">
					<span class="unit pvs fgc1">liga: </span>
					<input type="text" readonly value="" class="liga unitRight" />
				</div>
			</div>
			<div class="glyph fs1">
				<div class="clearfix bshadow0 pbs">
					<span class="icon-uF0039"></span><span class="mls"> icon-uF0039</span>
				</div>
				<fieldset class="fs0 size1of1 clearfix">
					<input type="text" readonly value="f5062" class="unit size1of2" />
					<input type="text" maxlength="1" readonly value="&#xf5062;" class="unitRight size1of2 talign-right" />
				</fieldset>
				<div class="fs0 bshadow0 clearfix noLiga-true">
					<span class="unit pvs fgc1">liga: </span>
					<input type="text" readonly value="" class="liga unitRight" />
				</div>
			</div>
			<div class="glyph fs1">
				<div class="clearfix bshadow0 pbs">
					<span class="icon-uF0102"></span><span class="mls"> icon-uF0102</span>
				</div>
				<fieldset class="fs0 size1of1 clearfix">
					<input type="text" readonly value="f5063" class="unit size1of2" />
					<input type="text" maxlength="1" readonly value="&#xf5063;" class="unitRight size1of2 talign-right" />
				</fieldset>
				<div class="fs0 bshadow0 clearfix noLiga-true">
					<span class="unit pvs fgc1">liga: </span>
					<input type="text" readonly value="" class="liga unitRight" />
				</div>
			</div>
			<div class="glyph fs1">
				<div class="clearfix bshadow0 pbs">
					<span class="icon-uni58"></span><span class="mls"> icon-uni58</span>
				</div>
				<fieldset class="fs0 size1of1 clearfix">
					<input type="text" readonly value="f5064" class="unit size1of2" />
					<input type="text" maxlength="1" readonly value="&#xf5064;" class="unitRight size1of2 talign-right" />
				</fieldset>
				<div class="fs0 bshadow0 clearfix noLiga-true">
					<span class="unit pvs fgc1">liga: </span>
					<input type="text" readonly value="" class="liga unitRight" />
				</div>
			</div>
			<div class="glyph fs1">
				<div class="clearfix bshadow0 pbs">
					<span class="icon-uni59"></span><span class="mls"> icon-uni59</span>
				</div>
				<fieldset class="fs0 size1of1 clearfix">
					<input type="text" readonly value="f5065" class="unit size1of2" />
					<input type="text" maxlength="1" readonly value="&#xf5065;" class="unitRight size1of2 talign-right" />
				</fieldset>
				<div class="fs0 bshadow0 clearfix noLiga-true">
					<span class="unit pvs fgc1">liga: </span>
					<input type="text" readonly value="" class="liga unitRight" />
				</div>
			</div>
			<div class="glyph fs1">
				<div class="clearfix bshadow0 pbs">
					<span class="icon-uni6A"></span><span class="mls"> icon-uni6A</span>
				</div>
				<fieldset class="fs0 size1of1 clearfix">
					<input type="text" readonly value="f5066" class="unit size1of2" />
					<input type="text" maxlength="1" readonly value="&#xf5066;" class="unitRight size1of2 talign-right" />
				</fieldset>
				<div class="fs0 bshadow0 clearfix noLiga-true">
					<span class="unit pvs fgc1">liga: </span>
					<input type="text" readonly value="" class="liga unitRight" />
				</div>
			</div>
			<div class="glyph fs1">
				<div class="clearfix bshadow0 pbs">
					<span class="icon-uni6B"></span><span class="mls"> icon-uni6B</span>
				</div>
				<fieldset class="fs0 size1of1 clearfix">
					<input type="text" readonly value="f5067" class="unit size1of2" />
					<input type="text" maxlength="1" readonly value="&#xf5067;" class="unitRight size1of2 talign-right" />
				</fieldset>
				<div class="fs0 bshadow0 clearfix noLiga-true">
					<span class="unit pvs fgc1">liga: </span>
					<input type="text" readonly value="" class="liga unitRight" />
				</div>
			</div>
			<div class="glyph fs1">
				<div class="clearfix bshadow0 pbs">
					<span class="icon-uni6C"></span><span class="mls"> icon-uni6C</span>
				</div>
				<fieldset class="fs0 size1of1 clearfix">
					<input type="text" readonly value="f5068" class="unit size1of2" />
					<input type="text" maxlength="1" readonly value="&#xf5068;" class="unitRight size1of2 talign-right" />
				</fieldset>
				<div class="fs0 bshadow0 clearfix noLiga-true">
					<span class="unit pvs fgc1">liga: </span>
					<input type="text" readonly value="" class="liga unitRight" />
				</div>
			</div>
			<div class="glyph fs1">
				<div class="clearfix bshadow0 pbs">
					<span class="icon-uF007C"></span><span class="mls"> icon-uF007C</span>
				</div>
				<fieldset class="fs0 size1of1 clearfix">
					<input type="text" readonly value="f5069" class="unit size1of2" />
					<input type="text" maxlength="1" readonly value="&#xf5069;" class="unitRight size1of2 talign-right" />
				</fieldset>
				<div class="fs0 bshadow0 clearfix noLiga-true">
					<span class="unit pvs fgc1">liga: </span>
					<input type="text" readonly value="" class="liga unitRight" />
				</div>
			</div>
			<div class="glyph fs1">
				<div class="clearfix bshadow0 pbs">
					<span class="icon-uni6D"></span><span class="mls"> icon-uni6D</span>
				</div>
				<fieldset class="fs0 size1of1 clearfix">
					<input type="text" readonly value="f506a" class="unit size1of2" />
					<input type="text" maxlength="1" readonly value="&#xf506a;" class="unitRight size1of2 talign-right" />
				</fieldset>
				<div class="fs0 bshadow0 clearfix noLiga-true">
					<span class="unit pvs fgc1">liga: </span>
					<input type="text" readonly value="" class="liga unitRight" />
				</div>
			</div>
			<div class="glyph fs1">
				<div class="clearfix bshadow0 pbs">
					<span class="icon-uni6E"></span><span class="mls"> icon-uni6E</span>
				</div>
				<fieldset class="fs0 size1of1 clearfix">
					<input type="text" readonly value="f506b" class="unit size1of2" />
					<input type="text" maxlength="1" readonly value="&#xf506b;" class="unitRight size1of2 talign-right" />
				</fieldset>
				<div class="fs0 bshadow0 clearfix noLiga-true">
					<span class="unit pvs fgc1">liga: </span>
					<input type="text" readonly value="" class="liga unitRight" />
				</div>
			</div>
			<div class="glyph fs1">
				<div class="clearfix bshadow0 pbs">
					<span class="icon-uniE015"></span><span class="mls"> icon-uniE015</span>
				</div>
				<fieldset class="fs0 size1of1 clearfix">
					<input type="text" readonly value="f506c" class="unit size1of2" />
					<input type="text" maxlength="1" readonly value="&#xf506c;" class="unitRight size1of2 talign-right" />
				</fieldset>
				<div class="fs0 bshadow0 clearfix noLiga-true">
					<span class="unit pvs fgc1">liga: </span>
					<input type="text" readonly value="" class="liga unitRight" />
				</div>
			</div>
			<div class="glyph fs1">
				<div class="clearfix bshadow0 pbs">
					<span class="icon-uniE016"></span><span class="mls"> icon-uniE016</span>
				</div>
				<fieldset class="fs0 size1of1 clearfix">
					<input type="text" readonly value="f506d" class="unit size1of2" />
					<input type="text" maxlength="1" readonly value="&#xf506d;" class="unitRight size1of2 talign-right" />
				</fieldset>
				<div class="fs0 bshadow0 clearfix noLiga-true">
					<span class="unit pvs fgc1">liga: </span>
					<input type="text" readonly value="" class="liga unitRight" />
				</div>
			</div>
			<div class="glyph fs1">
				<div class="clearfix bshadow0 pbs">
					<span class="icon-uniE017"></span><span class="mls"> icon-uniE017</span>
				</div>
				<fieldset class="fs0 size1of1 clearfix">
					<input type="text" readonly value="f506e" class="unit size1of2" />
					<input type="text" maxlength="1" readonly value="&#xf506e;" class="unitRight size1of2 talign-right" />
				</fieldset>
				<div class="fs0 bshadow0 clearfix noLiga-true">
					<span class="unit pvs fgc1">liga: </span>
					<input type="text" readonly value="" class="liga unitRight" />
				</div>
			</div>
			<div class="glyph fs1">
				<div class="clearfix bshadow0 pbs">
					<span class="icon-uniE018"></span><span class="mls"> icon-uniE018</span>
				</div>
				<fieldset class="fs0 size1of1 clearfix">
					<input type="text" readonly value="f506f" class="unit size1of2" />
					<input type="text" maxlength="1" readonly value="&#xf506f;" class="unitRight size1of2 talign-right" />
				</fieldset>
				<div class="fs0 bshadow0 clearfix noLiga-true">
					<span class="unit pvs fgc1">liga: </span>
					<input type="text" readonly value="" class="liga unitRight" />
				</div>
			</div>
			<div class="glyph fs1">
				<div class="clearfix bshadow0 pbs">
					<span class="icon-uniE019"></span><span class="mls"> icon-uniE019</span>
				</div>
				<fieldset class="fs0 size1of1 clearfix">
					<input type="text" readonly value="f5070" class="unit size1of2" />
					<input type="text" maxlength="1" readonly value="&#xf5070;" class="unitRight size1of2 talign-right" />
				</fieldset>
				<div class="fs0 bshadow0 clearfix noLiga-true">
					<span class="unit pvs fgc1">liga: </span>
					<input type="text" readonly value="" class="liga unitRight" />
				</div>
			</div>
			<div class="glyph fs1">
				<div class="clearfix bshadow0 pbs">
					<span class="icon-uniE01B"></span><span class="mls"> icon-uniE01B</span>
				</div>
				<fieldset class="fs0 size1of1 clearfix">
					<input type="text" readonly value="f5071" class="unit size1of2" />
					<input type="text" maxlength="1" readonly value="&#xf5071;" class="unitRight size1of2 talign-right" />
				</fieldset>
				<div class="fs0 bshadow0 clearfix noLiga-true">
					<span class="unit pvs fgc1">liga: </span>
					<input type="text" readonly value="" class="liga unitRight" />
				</div>
			</div>
			<div class="glyph fs1">
				<div class="clearfix bshadow0 pbs">
					<span class="icon-uniE01D"></span><span class="mls"> icon-uniE01D</span>
				</div>
				<fieldset class="fs0 size1of1 clearfix">
					<input type="text" readonly value="f5072" class="unit size1of2" />
					<input type="text" maxlength="1" readonly value="&#xf5072;" class="unitRight size1of2 talign-right" />
				</fieldset>
				<div class="fs0 bshadow0 clearfix noLiga-true">
					<span class="unit pvs fgc1">liga: </span>
					<input type="text" readonly value="" class="liga unitRight" />
				</div>
			</div>
			<div class="glyph fs1">
				<div class="clearfix bshadow0 pbs">
					<span class="icon-uniE01E"></span><span class="mls"> icon-uniE01E</span>
				</div>
				<fieldset class="fs0 size1of1 clearfix">
					<input type="text" readonly value="f5073" class="unit size1of2" />
					<input type="text" maxlength="1" readonly value="&#xf5073;" class="unitRight size1of2 talign-right" />
				</fieldset>
				<div class="fs0 bshadow0 clearfix noLiga-true">
					<span class="unit pvs fgc1">liga: </span>
					<input type="text" readonly value="" class="liga unitRight" />
				</div>
			</div>
			<div class="glyph fs1">
				<div class="clearfix bshadow0 pbs">
					<span class="icon-uniE01F"></span><span class="mls"> icon-uniE01F</span>
				</div>
				<fieldset class="fs0 size1of1 clearfix">
					<input type="text" readonly value="f5074" class="unit size1of2" />
					<input type="text" maxlength="1" readonly value="&#xf5074;" class="unitRight size1of2 talign-right" />
				</fieldset>
				<div class="fs0 bshadow0 clearfix noLiga-true">
					<span class="unit pvs fgc1">liga: </span>
					<input type="text" readonly value="" class="liga unitRight" />
				</div>
			</div>
			<div class="glyph fs1">
				<div class="clearfix bshadow0 pbs">
					<span class="icon-uniE020"></span><span class="mls"> icon-uniE020</span>
				</div>
				<fieldset class="fs0 size1of1 clearfix">
					<input type="text" readonly value="f5075" class="unit size1of2" />
					<input type="text" maxlength="1" readonly value="&#xf5075;" class="unitRight size1of2 talign-right" />
				</fieldset>
				<div class="fs0 bshadow0 clearfix noLiga-true">
					<span class="unit pvs fgc1">liga: </span>
					<input type="text" readonly value="" class="liga unitRight" />
				</div>
			</div>
			<div class="glyph fs1">
				<div class="clearfix bshadow0 pbs">
					<span class="icon-uniE022"></span><span class="mls"> icon-uniE022</span>
				</div>
				<fieldset class="fs0 size1of1 clearfix">
					<input type="text" readonly value="f5076" class="unit size1of2" />
					<input type="text" maxlength="1" readonly value="&#xf5076;" class="unitRight size1of2 talign-right" />
				</fieldset>
				<div class="fs0 bshadow0 clearfix noLiga-true">
					<span class="unit pvs fgc1">liga: </span>
					<input type="text" readonly value="" class="liga unitRight" />
				</div>
			</div>
			<div class="glyph fs1">
				<div class="clearfix bshadow0 pbs">
					<span class="icon-uniE023"></span><span class="mls"> icon-uniE023</span>
				</div>
				<fieldset class="fs0 size1of1 clearfix">
					<input type="text" readonly value="f5077" class="unit size1of2" />
					<input type="text" maxlength="1" readonly value="&#xf5077;" class="unitRight size1of2 talign-right" />
				</fieldset>
				<div class="fs0 bshadow0 clearfix noLiga-true">
					<span class="unit pvs fgc1">liga: </span>
					<input type="text" readonly value="" class="liga unitRight" />
				</div>
			</div>
			<div class="glyph fs1">
				<div class="clearfix bshadow0 pbs">
					<span class="icon-uniE024"></span><span class="mls"> icon-uniE024</span>
				</div>
				<fieldset class="fs0 size1of1 clearfix">
					<input type="text" readonly value="f5078" class="unit size1of2" />
					<input type="text" maxlength="1" readonly value="&#xf5078;" class="unitRight size1of2 talign-right" />
				</fieldset>
				<div class="fs0 bshadow0 clearfix noLiga-true">
					<span class="unit pvs fgc1">liga: </span>
					<input type="text" readonly value="" class="liga unitRight" />
				</div>
			</div>
			<div class="glyph fs1">
				<div class="clearfix bshadow0 pbs">
					<span class="icon-uniE025"></span><span class="mls"> icon-uniE025</span>
				</div>
				<fieldset class="fs0 size1of1 clearfix">
					<input type="text" readonly value="f5079" class="unit size1of2" />
					<input type="text" maxlength="1" readonly value="&#xf5079;" class="unitRight size1of2 talign-right" />
				</fieldset>
				<div class="fs0 bshadow0 clearfix noLiga-true">
					<span class="unit pvs fgc1">liga: </span>
					<input type="text" readonly value="" class="liga unitRight" />
				</div>
			</div>
			<div class="glyph fs1">
				<div class="clearfix bshadow0 pbs">
					<span class="icon-uni346B"></span><span class="mls"> icon-uni346B</span>
				</div>
				<fieldset class="fs0 size1of1 clearfix">
					<input type="text" readonly value="f507a" class="unit size1of2" />
					<input type="text" maxlength="1" readonly value="&#xf507a;" class="unitRight size1of2 talign-right" />
				</fieldset>
				<div class="fs0 bshadow0 clearfix noLiga-true">
					<span class="unit pvs fgc1">liga: </span>
					<input type="text" readonly value="" class="liga unitRight" />
				</div>
			</div>
			<div class="glyph fs1">
				<div class="clearfix bshadow0 pbs">
					<span class="icon-uF0044"></span><span class="mls"> icon-uF0044</span>
				</div>
				<fieldset class="fs0 size1of1 clearfix">
					<input type="text" readonly value="f507b" class="unit size1of2" />
					<input type="text" maxlength="1" readonly value="&#xf507b;" class="unitRight size1of2 talign-right" />
				</fieldset>
				<div class="fs0 bshadow0 clearfix noLiga-true">
					<span class="unit pvs fgc1">liga: </span>
					<input type="text" readonly value="" class="liga unitRight" />
				</div>
			</div>
			<div class="glyph fs1">
				<div class="clearfix bshadow0 pbs">
					<span class="icon-uF004B"></span><span class="mls"> icon-uF004B</span>
				</div>
				<fieldset class="fs0 size1of1 clearfix">
					<input type="text" readonly value="f507c" class="unit size1of2" />
					<input type="text" maxlength="1" readonly value="&#xf507c;" class="unitRight size1of2 talign-right" />
				</fieldset>
				<div class="fs0 bshadow0 clearfix noLiga-true">
					<span class="unit pvs fgc1">liga: </span>
					<input type="text" readonly value="" class="liga unitRight" />
				</div>
			</div>
			<div class="glyph fs1">
				<div class="clearfix bshadow0 pbs">
					<span class="icon-uF0051"></span><span class="mls"> icon-uF0051</span>
				</div>
				<fieldset class="fs0 size1of1 clearfix">
					<input type="text" readonly value="f507d" class="unit size1of2" />
					<input type="text" maxlength="1" readonly value="&#xf507d;" class="unitRight size1of2 talign-right" />
				</fieldset>
				<div class="fs0 bshadow0 clearfix noLiga-true">
					<span class="unit pvs fgc1">liga: </span>
					<input type="text" readonly value="" class="liga unitRight" />
				</div>
			</div>
			<div class="glyph fs1">
				<div class="clearfix bshadow0 pbs">
					<span class="icon-uF0089"></span><span class="mls"> icon-uF0089</span>
				</div>
				<fieldset class="fs0 size1of1 clearfix">
					<input type="text" readonly value="f507e" class="unit size1of2" />
					<input type="text" maxlength="1" readonly value="&#xf507e;" class="unitRight size1of2 talign-right" />
				</fieldset>
				<div class="fs0 bshadow0 clearfix noLiga-true">
					<span class="unit pvs fgc1">liga: </span>
					<input type="text" readonly value="" class="liga unitRight" />
				</div>
			</div>
			<div class="glyph fs1">
				<div class="clearfix bshadow0 pbs">
					<span class="icon-uF00AF"></span><span class="mls"> icon-uF00AF</span>
				</div>
				<fieldset class="fs0 size1of1 clearfix">
					<input type="text" readonly value="f507f" class="unit size1of2" />
					<input type="text" maxlength="1" readonly value="&#xf507f;" class="unitRight size1of2 talign-right" />
				</fieldset>
				<div class="fs0 bshadow0 clearfix noLiga-true">
					<span class="unit pvs fgc1">liga: </span>
					<input type="text" readonly value="" class="liga unitRight" />
				</div>
			</div>
			<div class="glyph fs1">
				<div class="clearfix bshadow0 pbs">
					<span class="icon-uF0107"></span><span class="mls"> icon-uF0107</span>
				</div>
				<fieldset class="fs0 size1of1 clearfix">
					<input type="text" readonly value="f5080" class="unit size1of2" />
					<input type="text" maxlength="1" readonly value="&#xf5080;" class="unitRight size1of2 talign-right" />
				</fieldset>
				<div class="fs0 bshadow0 clearfix noLiga-true">
					<span class="unit pvs fgc1">liga: </span>
					<input type="text" readonly value="" class="liga unitRight" />
				</div>
			</div>
			<div class="glyph fs1">
				<div class="clearfix bshadow0 pbs">
					<span class="icon-uF0152"></span><span class="mls"> icon-uF0152</span>
				</div>
				<fieldset class="fs0 size1of1 clearfix">
					<input type="text" readonly value="f5081" class="unit size1of2" />
					<input type="text" maxlength="1" readonly value="&#xf5081;" class="unitRight size1of2 talign-right" />
				</fieldset>
				<div class="fs0 bshadow0 clearfix noLiga-true">
					<span class="unit pvs fgc1">liga: </span>
					<input type="text" readonly value="" class="liga unitRight" />
				</div>
			</div>
			<div class="glyph fs1">
				<div class="clearfix bshadow0 pbs">
					<span class="icon-uF0105"></span><span class="mls"> icon-uF0105</span>
				</div>
				<fieldset class="fs0 size1of1 clearfix">
					<input type="text" readonly value="f5082" class="unit size1of2" />
					<input type="text" maxlength="1" readonly value="&#xf5082;" class="unitRight size1of2 talign-right" />
				</fieldset>
				<div class="fs0 bshadow0 clearfix noLiga-true">
					<span class="unit pvs fgc1">liga: </span>
					<input type="text" readonly value="" class="liga unitRight" />
				</div>
			</div>
			<div class="glyph fs1">
				<div class="clearfix bshadow0 pbs">
					<span class="icon-uF0196"></span><span class="mls"> icon-uF0196</span>
				</div>
				<fieldset class="fs0 size1of1 clearfix">
					<input type="text" readonly value="f5083" class="unit size1of2" />
					<input type="text" maxlength="1" readonly value="&#xf5083;" class="unitRight size1of2 talign-right" />
				</fieldset>
				<div class="fs0 bshadow0 clearfix noLiga-true">
					<span class="unit pvs fgc1">liga: </span>
					<input type="text" readonly value="" class="liga unitRight" />
				</div>
			</div>
			<div class="glyph fs1">
				<div class="clearfix bshadow0 pbs">
					<span class="icon-uF01B2"></span><span class="mls"> icon-uF01B2</span>
				</div>
				<fieldset class="fs0 size1of1 clearfix">
					<input type="text" readonly value="f5084" class="unit size1of2" />
					<input type="text" maxlength="1" readonly value="&#xf5084;" class="unitRight size1of2 talign-right" />
				</fieldset>
				<div class="fs0 bshadow0 clearfix noLiga-true">
					<span class="unit pvs fgc1">liga: </span>
					<input type="text" readonly value="" class="liga unitRight" />
				</div>
			</div>
			<div class="glyph fs1">
				<div class="clearfix bshadow0 pbs">
					<span class="icon-uF01BB"></span><span class="mls"> icon-uF01BB</span>
				</div>
				<fieldset class="fs0 size1of1 clearfix">
					<input type="text" readonly value="f5085" class="unit size1of2" />
					<input type="text" maxlength="1" readonly value="&#xf5085;" class="unitRight size1of2 talign-right" />
				</fieldset>
				<div class="fs0 bshadow0 clearfix noLiga-true">
					<span class="unit pvs fgc1">liga: </span>
					<input type="text" readonly value="" class="liga unitRight" />
				</div>
			</div>
			<div class="glyph fs1">
				<div class="clearfix bshadow0 pbs">
					<span class="icon-uF018C"></span><span class="mls"> icon-uF018C</span>
				</div>
				<fieldset class="fs0 size1of1 clearfix">
					<input type="text" readonly value="f5086" class="unit size1of2" />
					<input type="text" maxlength="1" readonly value="&#xf5086;" class="unitRight size1of2 talign-right" />
				</fieldset>
				<div class="fs0 bshadow0 clearfix noLiga-true">
					<span class="unit pvs fgc1">liga: </span>
					<input type="text" readonly value="" class="liga unitRight" />
				</div>
			</div>
			<div class="glyph fs1">
				<div class="clearfix bshadow0 pbs">
					<span class="icon-uF01C7"></span><span class="mls"> icon-uF01C7</span>
				</div>
				<fieldset class="fs0 size1of1 clearfix">
					<input type="text" readonly value="f5087" class="unit size1of2" />
					<input type="text" maxlength="1" readonly value="&#xf5087;" class="unitRight size1of2 talign-right" />
				</fieldset>
				<div class="fs0 bshadow0 clearfix noLiga-true">
					<span class="unit pvs fgc1">liga: </span>
					<input type="text" readonly value="" class="liga unitRight" />
				</div>
			</div>
			<div class="glyph fs1">
				<div class="clearfix bshadow0 pbs">
					<span class="icon-uF01AF"></span><span class="mls"> icon-uF01AF</span>
				</div>
				<fieldset class="fs0 size1of1 clearfix">
					<input type="text" readonly value="f5088" class="unit size1of2" />
					<input type="text" maxlength="1" readonly value="&#xf5088;" class="unitRight size1of2 talign-right" />
				</fieldset>
				<div class="fs0 bshadow0 clearfix noLiga-true">
					<span class="unit pvs fgc1">liga: </span>
					<input type="text" readonly value="" class="liga unitRight" />
				</div>
			</div>
			<div class="glyph fs1">
				<div class="clearfix bshadow0 pbs">
					<span class="icon-uF0200"></span><span class="mls"> icon-uF0200</span>
				</div>
				<fieldset class="fs0 size1of1 clearfix">
					<input type="text" readonly value="f5089" class="unit size1of2" />
					<input type="text" maxlength="1" readonly value="&#xf5089;" class="unitRight size1of2 talign-right" />
				</fieldset>
				<div class="fs0 bshadow0 clearfix noLiga-true">
					<span class="unit pvs fgc1">liga: </span>
					<input type="text" readonly value="" class="liga unitRight" />
				</div>
			</div>
			<div class="glyph fs1">
				<div class="clearfix bshadow0 pbs">
					<span class="icon-uF028B"></span><span class="mls"> icon-uF028B</span>
				</div>
				<fieldset class="fs0 size1of1 clearfix">
					<input type="text" readonly value="f508a" class="unit size1of2" />
					<input type="text" maxlength="1" readonly value="&#xf508a;" class="unitRight size1of2 talign-right" />
				</fieldset>
				<div class="fs0 bshadow0 clearfix noLiga-true">
					<span class="unit pvs fgc1">liga: </span>
					<input type="text" readonly value="" class="liga unitRight" />
				</div>
			</div>
			<div class="glyph fs1">
				<div class="clearfix bshadow0 pbs">
					<span class="icon-uni51"></span><span class="mls"> icon-uni51</span>
				</div>
				<fieldset class="fs0 size1of1 clearfix">
					<input type="text" readonly value="f508b" class="unit size1of2" />
					<input type="text" maxlength="1" readonly value="&#xf508b;" class="unitRight size1of2 talign-right" />
				</fieldset>
				<div class="fs0 bshadow0 clearfix noLiga-true">
					<span class="unit pvs fgc1">liga: </span>
					<input type="text" readonly value="" class="liga unitRight" />
				</div>
			</div>
		</div>
		<div class="bgc1 clearfix">
			<p class="mhl">Generated by <a href="http://icomoon.io/app">IcoMoon</a></p>
		</div>
	</div>
</body>
</html>