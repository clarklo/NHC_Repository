<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*,java.io.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="org.json.simple.*" %>
<%

/**
 * KindEditor JSP
 *
 * 本JSP程式是演示程式，建議不要直接在實際項目中使用。
 * 如果您確定直接使用本程式，使用之前請仔細確認相關安全設定。
 *
 */

//根目錄路徑，可以指定絕對路徑，比如 /var/www/attached/
String rootPath = pageContext.getServletContext().getRealPath("/") + "attached/";
//根目錄URL，可以指定絕對路徑，比如 http://www.yoursite.com/attached/
String rootUrl  = request.getContextPath() + "/attached/";
//圖片擴展名
String[] fileTypes = new String[]{"gif", "jpg", "jpeg", "png", "bmp"};

String dirName = request.getParameter("dir");
if (dirName != null) {
	if(!Arrays.<String>asList(new String[]{"image", "flash", "media", "file"}).contains(dirName)){
		out.println("Invalid Directory name.");
		return;
	}
	rootPath += dirName + "/";
	rootUrl += dirName + "/";
	File saveDirFile = new File(rootPath);
	if (!saveDirFile.exists()) {
		saveDirFile.mkdirs();
	}
}
//根據path參數，設定各路徑和URL
String path = request.getParameter("path") != null ? request.getParameter("path") : "";
String currentPath = rootPath + path;
String currentUrl = rootUrl + path;
String currentDirPath = path;
String moveupDirPath = "";
if (!"".equals(path)) {
	String str = currentDirPath.substring(0, currentDirPath.length() - 1);
	moveupDirPath = str.lastIndexOf("/") >= 0 ? str.substring(0, str.lastIndexOf("/") + 1) : "";
}

//排序形式，name or size or type
String order = request.getParameter("order") != null ? request.getParameter("order").toLowerCase() : "name";

//不允許使用..移動到上一級目錄
if (path.indexOf("..") >= 0) {
	out.println("Access is not allowed.");
	return;
}
//最後一個字符不是/
if (!"".equals(path) && !path.endsWith("/")) {
	out.println("Parameter is not valid.");
	return;
}
//目錄不存在或不是目錄
File currentPathFile = new File(currentPath);
if(!currentPathFile.isDirectory()){
	out.println("Directory does not exist.");
	return;
}

//遍歷目錄取的檔案訊息
List<Hashtable> fileList = new ArrayList<Hashtable>();
if(currentPathFile.listFiles() != null) {
	for (File file : currentPathFile.listFiles()) {
		Hashtable<String, Object> hash = new Hashtable<String, Object>();
		String fileName = file.getName();
		if(file.isDirectory()) {
			hash.put("is_dir", true);
			hash.put("has_file", (file.listFiles() != null));
			hash.put("filesize", 0L);
			hash.put("is_photo", false);
			hash.put("filetype", "");
		} else if(file.isFile()){
			String fileExt = fileName.substring(fileName.lastIndexOf(".") + 1).toLowerCase();
			hash.put("is_dir", false);
			hash.put("has_file", false);
			hash.put("filesize", file.length());
			hash.put("is_photo", Arrays.<String>asList(fileTypes).contains(fileExt));
			hash.put("filetype", fileExt);
		}
		hash.put("filename", fileName);
		hash.put("datetime", new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(file.lastModified()));
		fileList.add(hash);
	}
}

if ("size".equals(order)) {
	Collections.sort(fileList, new SizeComparator());
} else if ("type".equals(order)) {
	Collections.sort(fileList, new TypeComparator());
} else {
	Collections.sort(fileList, new NameComparator());
}
JSONObject result = new JSONObject();
result.put("moveup_dir_path", moveupDirPath);
result.put("current_dir_path", currentDirPath);
result.put("current_url", currentUrl);
result.put("total_count", fileList.size());
result.put("file_list", fileList);

response.setContentType("application/json; charset=UTF-8");
out.println(result.toJSONString());
%>
<%!
public class NameComparator implements Comparator {
	public int compare(Object a, Object b) {
		Hashtable hashA = (Hashtable)a;
		Hashtable hashB = (Hashtable)b;
		if (((Boolean)hashA.get("is_dir")) && !((Boolean)hashB.get("is_dir"))) {
			return -1;
		} else if (!((Boolean)hashA.get("is_dir")) && ((Boolean)hashB.get("is_dir"))) {
			return 1;
		} else {
			return ((String)hashA.get("filename")).compareTo((String)hashB.get("filename"));
		}
	}
}
public class SizeComparator implements Comparator {
	public int compare(Object a, Object b) {
		Hashtable hashA = (Hashtable)a;
		Hashtable hashB = (Hashtable)b;
		if (((Boolean)hashA.get("is_dir")) && !((Boolean)hashB.get("is_dir"))) {
			return -1;
		} else if (!((Boolean)hashA.get("is_dir")) && ((Boolean)hashB.get("is_dir"))) {
			return 1;
		} else {
			if (((Long)hashA.get("filesize")) > ((Long)hashB.get("filesize"))) {
				return 1;
			} else if (((Long)hashA.get("filesize")) < ((Long)hashB.get("filesize"))) {
				return -1;
			} else {
				return 0;
			}
		}
	}
}
public class TypeComparator implements Comparator {
	public int compare(Object a, Object b) {
		Hashtable hashA = (Hashtable)a;
		Hashtable hashB = (Hashtable)b;
		if (((Boolean)hashA.get("is_dir")) && !((Boolean)hashB.get("is_dir"))) {
			return -1;
		} else if (!((Boolean)hashA.get("is_dir")) && ((Boolean)hashB.get("is_dir"))) {
			return 1;
		} else {
			return ((String)hashA.get("filetype")).compareTo((String)hashB.get("filetype"));
		}
	}
}
%>