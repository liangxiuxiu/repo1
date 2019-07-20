package com.hanweb.elasticsearch.util;

import com.hanweb.common.util.StringUtil;

public class FilterUtil {

	 /**
     * 判断URL带的参数是否有特殊字符
     * 
     * @param strPara
     * @return
     */
    public static boolean isOK(String strPara) {
        boolean bl = true;
        if(StringUtil.isNotEmpty(strPara)){
        	 strPara = strPara.toLowerCase();
             if (strPara.indexOf("%") >= 0 || strPara.indexOf("|") >= 0
                     || strPara.indexOf("+") >= 0
                     || strPara.indexOf("alert") >= 0
                     || strPara.indexOf("script") >= 0 || strPara.indexOf("\"") >= 0
                     || strPara.indexOf("\'") >= 0 || strPara.indexOf("<") >= 0
                     || strPara.indexOf("set") >= 0 || strPara.indexOf("exec") >= 0
                     || strPara.indexOf("delete") >= 0
                     || strPara.indexOf("update") >= 0
                     || strPara.indexOf("declare") >= 0
                     || strPara.indexOf("cast") >= 0) {
                 bl = false; 
             }
        }
        return bl;
    }
    
    /**
     * 过滤特殊字符  包含sql注入过滤和跨站脚本过滤
     * @param strPara
     * @return
     */
    public static boolean isSqlOK(String strPara) {
        boolean bl = true;
        if(StringUtil.isNotEmpty(strPara)){
             strPara = strPara.toLowerCase();
             if (strPara.indexOf("%") >= 0 || strPara.indexOf("|") >= 0 || strPara.indexOf("&") >= 0
                     || strPara.indexOf("+") >= 0 || strPara.indexOf("alert") >= 0
                     || strPara.indexOf("script") >= 0 || strPara.indexOf("\"") >= 0
                     || strPara.indexOf("\'") >= 0 || strPara.indexOf("<") >= 0
                     || strPara.indexOf("set") >= 0 || strPara.indexOf("exec") >= 0
                     || strPara.indexOf("delete") >= 0 || strPara.indexOf("update") >= 0
                     || strPara.indexOf("declare") >= 0 || strPara.indexOf("cast") >= 0
                     || strPara.indexOf("master") >= 0 || strPara.indexOf("or") >= 0
                     || strPara.indexOf("and") >= 0 || strPara.indexOf("select") >= 0
                     || strPara.indexOf("if") >= 0 || strPara.indexOf("sysdate") >= 0
                     || strPara.indexOf("sleep") >= 0 || strPara.indexOf("truncate") >= 0
                     || strPara.indexOf("insert") >= 0 || strPara.indexOf("waitfor") >= 0
                     || strPara.indexOf("union") >= 0 || strPara.indexOf("delay") >= 0
                     || strPara.indexOf("count") >= 0 || strPara.indexOf("_") >= 0
                     || strPara.indexOf("onmouseover") >= 0 || strPara.indexOf("prompt") >= 0) { 
                 bl = false;
             }
        }
        return bl;
    }
    
    /**
     * 过滤参数为url 
     * @param strPara
     * @return
     */
    public static boolean isUrlOK(String strPara){
        boolean bl = true;
        if(StringUtil.isNotEmpty(strPara)){
             strPara = strPara.toLowerCase();
             if (strPara.indexOf("alert") >= 0 || strPara.indexOf("iframe") >= 0
                     || strPara.indexOf("script") >= 0 || strPara.indexOf("set") >= 0 
                     || strPara.indexOf("delete") >= 0 || strPara.indexOf("update") >= 0
                     || strPara.indexOf("declare") >= 0 || strPara.indexOf("cast") >= 0
                     || strPara.indexOf("master") >= 0 || strPara.indexOf("select") >= 0
                     || strPara.indexOf("sysdate") >= 0 || strPara.indexOf("prompt") >= 0
                     || strPara.indexOf("sleep") >= 0 || strPara.indexOf("truncate") >= 0
                     || strPara.indexOf("insert") >= 0 || strPara.indexOf("waitfor") >= 0
                     || strPara.indexOf("union") >= 0 || strPara.indexOf("delay") >= 0
                     || strPara.indexOf("exec") >= 0 || strPara.indexOf("onmouseover") >= 0) { 
                 bl = false;
             }
        }
        return bl;
    }
    
    /**
     * 是否是数字
     * @param str
     * @return
     */
    public static boolean isNumeric(String str) {
        if (str.matches("\\d*")) {
            return true;
        } else {
            return false;
        }
    }
	/**
	 * 
	 * @param strContent
	 * @return
	 */
	public static String filterJs(String strContent) {
		strContent = getValue(strContent);
		strContent = replaceString(strContent, "/**/", "");
		strContent = replaceString(strContent, "<", "&#60;");
		strContent = replaceString(strContent, ">", "&#62;");
		strContent = replaceStringNoCase(strContent, "%3C", "&#60;");
		strContent = replaceStringNoCase(strContent, "%3E", "&#62;");
		strContent = replaceStringNoCase(strContent, "expression",
				"\uFF45\uFF58\uFF50\uFF52\uFF45\uFF53\uFF53\uFF49\uFF4F\uFF4E");
		strContent = replaceStringNoCase(strContent, "javascript",
				"\uFF4A\uFF41\uFF56\uFF41\uFF53\uFF43\uFF52\uFF49\uFF50\uFF54");
		strContent = replaceStringNoCase(strContent, "%250D%250A", " ");
		strContent = replaceStringNoCase(strContent, "%0D%0A", " ");
		strContent = replaceStringNoCase(strContent, "%0A", " ");
		strContent = replaceStringNoCase(strContent, "alert", "ＡＬＥＲＴ");
		strContent = replaceStringNoCase(strContent, "window", "ｗｉｎｄｏｗ");
		strContent = replaceStringNoCase(strContent, "location", "ｌｏｃａｔｉｏｎ");
		strContent = replaceStringNoCase(strContent, "eval", "ｅｖａｌ");
		return strContent;
	}

	/**
	 * 
	 * @param strData
	 * @param strFrom
	 * @param strTo
	 * @return
	 */
	private static String replaceString(String strData, String strFrom,
			String strTo) {
		if (strData == null || strData.trim().length() == 0){
			return "";
		}
		strFrom = strFrom != null ? strFrom : "";
		strTo = strTo != null ? strTo : "";
		if (!strFrom.equals("\t") && !strFrom.equals("\r")
				&& !strFrom.equals("\n") && !strFrom.equals("\b")
				&& !strFrom.equals("\f")){
			strFrom = strFrom.trim();
		}
		if (!strTo.equals("\t") && !strTo.equals("\r") && !strTo.equals("\n")
				&& !strTo.equals("\b") && !strTo.equals("\f")){
			strTo = strTo.trim();
		}
		if (strFrom.equals(strTo)){
			return strData;
		}
			
		int nIndex = strData.indexOf(strFrom);
		String strResult = "";
		for (; nIndex != -1; nIndex = strData.indexOf(strFrom)) {
			strResult = strResult + strData.substring(0, nIndex) + strTo;
			strData = strData.substring(nIndex + strFrom.length());
		}

		strResult = strResult + strData;
		return strResult;
	}

	/**
	 * 
	 * @param strData
	 * @param strFrom
	 * @param strTo
	 * @return
	 */
	private static String replaceStringNoCase(String strData, String strFrom,
			String strTo) {
		if (strData == null || strData.trim().length() == 0){
			return "";
		}
		strFrom = getValue(strFrom);
		strTo = getValue(strTo);
		if (strFrom.toLowerCase().trim().equals(strTo.toLowerCase().trim())){
			return strData;
		}
		if (strFrom.length() == 0){
			return strData;
		}
		int nIndex = strData.toUpperCase().indexOf(strFrom.toUpperCase());
		String strResult = "";
		for (; nIndex != -1; nIndex = strData.toUpperCase().indexOf(
				strFrom.toUpperCase())) {
			strResult = strResult + strData.substring(0, nIndex) + strTo;
			strData = strData.substring(nIndex + strFrom.length());
		}

		strResult = strResult + strData;
		return strResult;
	}

	/**
	 * 
	 * @param strValue
	 * @return
	 */
	private static String getValue(String strValue) {
		if (strValue == null){
			strValue = "";
		}
		return strValue.trim();
	}
	/**
	 * 判断字符串只有数字和字母
	 */
	
	   public static boolean isOnly(String str) {
	        if (str.matches("[a-zA-Z0-9]+")) {
	            return true;
	        } else {
	            return false;
	        }
	    }
}
