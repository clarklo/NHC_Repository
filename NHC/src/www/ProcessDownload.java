package www;

/**
 * <p>Title: 整站系統1.0</p>
 *
 * <p>Description: 處理檔案JavaBean</p>
 *
 * <p>Copyright: Copyright (c) 2013</p>
 *
 * <p>Company: web</p>
 *
 * @version 1.0
 */
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Calendar;

import com.web.database.Operation;
import com.web.util.ReplaceAll;

public class ProcessDownload {
	//數據庫操作對象
	private Operation op;
	//SQL語句
	private String sql;
	//記錄集對象
	private ResultSet rs;
	//檔案對象
	private Download download;
	//當前路徑
	private String currPath;
	//返回訊息
	private String msg;
	//返回狀態
	private boolean status;

    public ProcessDownload() {
		op = null;
		sql = "";
		rs = null;
		download = new Download();
		msg = "";
		status = false;
    }

    public Download getDownload() {
        return download;
    }

    public String getMsg() {
        return msg;
    }

    public boolean isStatus() {
        return status;
    }

    public String getCurrPath() {
        return currPath;
    }

    public void setDownload(Download download) {
        this.download = download;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    public void setCurrPath(String currPath) {
        this.currPath = currPath;
    }

	/*
	 *根據模板生成靜態頁面
	 */
	private void genHtml()throws Exception, IOException{
		try{
			op = new Operation();
			ResultSet rs = null;
			String sql = "";

			//讀入首頁模板
			String file = currPath + "template" + java.io.File.separator +
				"file.html";
			FileInputStream in = new FileInputStream(file);
			int len = in.available();
			byte template[] = new byte[len];
			in.read(template);
			in.close();
			String index = new String(template);

			//生成選單
			String menu = "";
			sql = "SELECT * FROM cms_class WHERE cms_class_fatid=0 ORDER BY cms_class_orderid ASC";
			rs = op.query(sql);
			int id0 = 0;
			String name0 = "";
			String url0 = "";
			while(rs.next()){
				id0 = rs.getInt("cms_class_id");
				name0 = rs.getString("cms_class_name");
				url0 = rs.getString("cms_class_href");
				url0 = url0.trim();
				if(!url0.equals("")){
					menu += "<a href='"+url0+"'>" + name0 + "</a> | ";
				}
				else{
					menu += "<a href='../../../../html/"+id0+"c1p.html'>" + name0 + "</a> | ";
				}
			}

			//網站配置
			sql = "SELECT * FROM cms_config";
			rs = op.query(sql);
			String sitename = "";
			String sitelogo = "";
			String sitebanner = "";
			String sitedescription = "";
			String copyright = "";
			if(rs.next()){
				sitename = rs.getString("cms_config_site");
				sitelogo = rs.getString("cms_config_logo");
				sitedescription = rs.getString("cms_config_info");
				sitebanner = rs.getString("cms_config_head");
				copyright = rs.getString("cms_config_foot");
			}
			index = ReplaceAll.replace(index, "<$LOGO$>", sitelogo);
			index = ReplaceAll.replace(index, "<$BANNER$>", sitebanner);
			index = ReplaceAll.replace(index, "<$COPYRIGHT$>", copyright);

			//生成當前路徑
			sql = "SELECT * FROM cms_class WHERE cms_class_id="+download.getCid();
			rs = op.query(sql);
			String path = "";
			String currPathId = "0::";
			String currPathName = "::";
			String cpid[] = null;
			String cpname[] = null;
			if(rs.next()){
				String name = rs.getString("cms_class_name");
				String pathId = rs.getString("cms_class_pathid");
				String pathName = rs.getString("cms_class_pathname");

				currPathId = pathId  + download.getCid() + "::";
				currPathName = pathName + name + "::";
			}
			cpid = currPathId.split("::");
			cpname = currPathName.split("::");

			for(int i=1;i<cpname.length;i++){
				if(i != cpname.length-1){
					path += "<a href='../../../../html/" + cpid[i] + "c1p.html'>" + cpname[i] +
						"</a>" + " >> ";
				}
				else{
					path += "<a href='../../../../html/" + cpid[i] + "c1p.html'>" + cpname[i] +
						"</a>";
				}
			}

			//替換標籤
			index = ReplaceAll.replace(index, "<$MENU$>", menu);
			index = ReplaceAll.replace(index, "<$CURRENTPATH$>", path + " >> " +download.getTitle());
			index = ReplaceAll.replace(index, "<$SIZE$>", String.valueOf(download.getSize()));
			index = ReplaceAll.replace(index, "<$TITLE$>", download.getTitle());
			index = ReplaceAll.replace(index, "<$AUTHOR$>", download.getAuthor());
			index = ReplaceAll.replace(index, "<$FROM$>", download.getFrom());
			index = ReplaceAll.replace(index, "<$PLATFORM$>", download.getPlatform());
			index = ReplaceAll.replace(index, "<$LANGUAGE$>", download.getLanguage());
			index = ReplaceAll.replace(index, "<$GRANT$>", download.getGrant());
			index = ReplaceAll.replace(index, "<$TIME$>", download.getTime());
			index = ReplaceAll.replace(index, "<$USERNAME$>", download.getUsername());
			if(download.getComment()==1){
                index = ReplaceAll.replace(index, "<$COMMENT$>",
                    "【<a href='../../../../comment.jsp?id=" + download.getId() +
                                           "'>評論</a>】");
            }
			else{
				index = ReplaceAll.replace(index, "<$COMMENT$>", "");
			}

			index = ReplaceAll.replace(index, "<$COUNT$>", "<iframe name='count' frameborder=0 width=30 height=20 scrolling=no src='../../../../count.jsp?id="+download.getId()+"&type=2'></iframe>");
			index = ReplaceAll.replace(index, "<$KEYWORDS$>", download.getKeyword());
			index = ReplaceAll.replace(index, "<$ADDRESS$>", "<a href='../../../../upload/files/"+download.getFilename()+"'>本地下載</a>");
			if(download.getIndexImage() != ""){
				index = ReplaceAll.replace(index, "<$IMAGE$>", "<img src='../../../../upload/images/"+download.getIndexImage()+"' width=175 height=175>");
			}
			else{
				index = ReplaceAll.replace(index, "<$IMAGE$>", "<img src='../../../../images/download.jpg' width=175 height=175>");
			}
			index = ReplaceAll.replace(index, "<$CONTENT$>", download.getContent());

			//生成article.html檔案
			Calendar calendar = Calendar.getInstance();
			String p = calendar.get(Calendar.YEAR) + File.separator + (calendar.get(Calendar.MONTH)+1) + File.separator + calendar.get(Calendar.DAY_OF_MONTH);
			//生成目錄
			File f1 = new File(currPath + "html" + File.separator + p);
			if(!f1.exists()){
				f1.mkdirs();
			}
			//生成html檔案
			FileOutputStream fos = new FileOutputStream(currPath + "html" + File.separator + p + File.separator + download.getId() + ".html");
			byte contentByte[] = index.getBytes();
			fos.write(contentByte);
			fos.close();
			download.setHtml(calendar.get(Calendar.YEAR) + "/" + (calendar.get(Calendar.MONTH)+1) + "/" + calendar.get(Calendar.DAY_OF_MONTH) + "/" + download.getId() + ".html");
		}
		catch(Exception e){
			msg = e.getMessage();
		}
		finally{
			op.closestmt();
			op.closeconn();
		}
	}

    /**
	 *添蓋文件
	 */
	public void add(String imgfile) throws ClassNotFoundException, SQLException{
		try{

			genHtml();

			op = new Operation();

			sql = "INSERT INTO cms_infodata (cms_infodata_id, cms_infodata_name, cms_infodata_type, cms_infodata_class, cms_infodata_from, cms_infodata_indexpic,cms_infodata_keyword,cms_infodata_descripte,cms_infodata_releasetime,cms_infodata_releaseman,cms_infodata_html,cms_infodata_iscoment) VALUES ('" + download.getId() + "','"+download.getTitle()+"', 2, " + download.getCid() + ", '" + download.getFrom() + "', '" + download.getIndexImage() + "','"+download.getKeyword()+"','"+download.getSummary()+"','"+download.getTime()+"','"+download.getUsername()+"','"+download.getHtml()+"',"+download.getComment()+")";
			op.update(sql);
			sql = "INSERT INTO cms_infodata2(cms_infodata2_id, cms_infodata2_productor, cms_infodata2_rune, cms_infodata2_size, cms_infodata2_lang, cms_infodata2_info, cms_infodata2_authtype, cms_infodata2_downtimes, cms_infodata2_downurl) VALUES ('" + download.getId() + "','"+download.getAuthor()+"','"+download.getPlatform()+"',"+download.getSize()+",'"+download.getLanguage()+"','" + download.getContent() + "','"+download.getGrant()+"', " + download.getCount() + ",'"+download.getFilename()+"')";
			op.update(sql);
			if(download.getCommend() == 1){
				sql = "INSERT INTO cms_commend(cms_commend_info, cms_commend_grade,cms_commend_class) VALUES ('" + download.getId() + "'," + download.getLevel() + ","+download.getCid()+")";
				op.update(sql);
			}
			if(download.getScroll() == 1){
				sql = "INSERT INTO cms_rolls(cms_rolls_info,cms_rolls_class) VALUES ('" + download.getId() + "',"+download.getCid()+")";
				op.update(sql);
			}
			if(download.getTop() == 1){
				sql = "INSERT INTO cms_topinfo(cms_topinfo_info,cms_topinfo_class) VALUES ('" + download.getId() + "',"+download.getCid()+")";
				op.update(sql);
			}

			//處理上傳的圖片
			String file[] = null;
			if(imgfile != null && imgfile != ""){
				file = imgfile.split(":");

				Picture picture = new Picture();
				ProcessPicture processPicture = new ProcessPicture();
				picture.setCid(download.getId());
				//表示訊息圖片
				picture.setType(1);

				for(int i=0;i<file.length;i++){
					picture.setFile(file[i]);
					processPicture.setPicture(picture);
					processPicture.add();
					if (!processPicture.isStatus()) {
						status = false;
						msg = processPicture.getMsg();
						return;
					}
				}
			}

			status = true;
		}
		catch(Exception e){
			msg = e.getMessage();
		}
		finally{
			op.closeconn();
		}
	}

	/*
	 *根據模板修改靜態頁面
	 */
	private void modHtml()throws Exception, IOException{
		try{
			op = new Operation();
			ResultSet rs = null;
			String sql = "";

			//刪除以前的html
			sql = "SELECT * FROM cms_infodata WHERE cms_infodata_id='"+download.getId()+"'";
			rs = op.query(sql);
			if(rs.next()){
				String f = rs.getString("cms_infodata_html");
				File htm = new File(currPath + "html" + java.io.File.separator + f);
				if(htm.exists()){
					htm.delete();
				}
			}

			//讀入首頁模板
			String file = currPath + "template" + java.io.File.separator +
				"file.html";
			FileInputStream in = new FileInputStream(file);
			int len = in.available();
			byte template[] = new byte[len];
			in.read(template);
			in.close();
			
			String index = new String(template);

			//生成選單
			String menu = "";
			sql = "SELECT * FROM cms_class WHERE cms_class_id=0 ORDER BY cms_class_orderid ASC";
			rs = op.query(sql);
			int id0 = 0;
			String name0 = "";
			String url0 = "";
			while(rs.next()){
				id0 = rs.getInt("cms_class_id");
				name0 = rs.getString("cms_class_name");
				url0 = rs.getString("cms_class_href");
				url0 = url0.trim();
				if(!url0.equals("")){
					menu += "<a href='"+url0+"'>" + name0 + "</a> | ";
				}
				else{
					menu += "<a href='../../../../html/"+id0+"c1p.html'>" + name0 + "</a> | ";
				}
			}

			//網站配置
			sql = "SELECT * FROM cms_config";
			rs = op.query(sql);
			String sitename = "";
			String sitelogo = "";
			String sitebanner = "";
			String sitedescription = "";
			String copyright = "";
			if(rs.next()){
				sitename = rs.getString("cms_config_site");
				sitelogo = rs.getString("cms_config_logo");
				sitedescription = rs.getString("cms_config_info");
				sitebanner = rs.getString("cms_config_head");
				copyright = rs.getString("cms_config_foot");
			}
				
			index = ReplaceAll.replace(index, "<$LOGO$>", sitelogo);
			index = ReplaceAll.replace(index, "<$BANNER$>", sitebanner);
			index = ReplaceAll.replace(index, "<$COPYRIGHT$>", copyright);
	
			//生成當前路徑
			sql = "SELECT * FROM cms_class WHERE cms_class_id="+download.getCid();
			rs = op.query(sql);
			String path = "";
			String currPathId = "0::";
			String currPathName = "::";
			String cpid[] = null;
			String cpname[] = null;
			if(rs.next()){
				String name = rs.getString("cms_class_name");
				String pathId = rs.getString("cms_class_pathid");
				String pathName = rs.getString("cms_class_pathname");

				currPathId = pathId  + download.getCid() + "::";
				currPathName = pathName + name + "::";
			}
			cpid = currPathId.split("::");
			cpname = currPathName.split("::");

			for(int i=1;i<cpname.length;i++){
				
				if(i != cpname.length-1){
					path += "<a href='../../../../html/" + cpid[i] + "c1p.html'>" + cpname[i] +
						"</a>" + " >> ";
				}
				else{
					path += "<a href='../../../../html/" + cpid[i] + "c1p.html'>" + cpname[i] +
						"</a>";
				}
			}

		
			//替換標籤
			index = ReplaceAll.replace(index, "<$MENU$>", menu);
			index = ReplaceAll.replace(index, "<$CURRENTPATH$>", path + " >> " +download.getTitle());
			index = ReplaceAll.replace(index, "<$SIZE$>", String.valueOf(download.getSize()));
			index = ReplaceAll.replace(index, "<$TITLE$>", download.getTitle());
			index = ReplaceAll.replace(index, "<$AUTHOR$>", download.getAuthor());
			index = ReplaceAll.replace(index, "<$FROM$>", download.getFrom());
			index = ReplaceAll.replace(index, "<$PLATFORM$>", download.getPlatform());
			index = ReplaceAll.replace(index, "<$LANGUAGE$>", download.getLanguage());
			index = ReplaceAll.replace(index, "<$GRANT$>", download.getGrant());
			index = ReplaceAll.replace(index, "<$TIME$>", download.getTime());
			index = ReplaceAll.replace(index, "<$USERNAME$>", download.getUsername());
			
			if(download.getComment()==1){
                index = ReplaceAll.replace(index, "<$COMMENT$>",
                    "【<a href='../../../../comment.jsp?id=" + download.getId() +
                                           "'>評論</a>】");
            }
			else{
				index = ReplaceAll.replace(index, "<$COMMENT$>", "");
			}
			index = ReplaceAll.replace(index, "<$COUNT$>", "<iframe name='count' frameborder=0 width=30 height=20 scrolling=no src='../../../../count.jsp?id="+download.getId()+"&type=2'></iframe>");
			index = ReplaceAll.replace(index, "<$KEYWORDS$>", download.getKeyword());
			index = ReplaceAll.replace(index, "<$ADDRESS$>", "<a href='../../../../upload/files/"+download.getFilename()+"'>本地下載</a>");
			System.out.println("download.getIndexImage()"+download.getIndexImage());
			System.out.println("download.getIndexImage()"+download.getIndexImage().length());
			if(!download.getIndexImage().trim().equals("")){
				index = ReplaceAll.replace(index, "<$IMAGE$>", "<img src='../../../../upload/images/"+download.getIndexImage()+"' width=175 height=175>");
			}
			else{
				index = ReplaceAll.replace(index, "<$IMAGE$>", "<img src='../../../../images/download.jpg' width=175 height=175>");
			}
			index = ReplaceAll.replace(index, "<$CONTENT$>", download.getContent());

			
			//生成article.html檔案
			Calendar calendar = Calendar.getInstance();
			String p = calendar.get(Calendar.YEAR) + File.separator + (calendar.get(Calendar.MONTH)+1) + File.separator + calendar.get(Calendar.DAY_OF_MONTH);
			//生成目錄
			
		
			File f1 = new File(currPath + "html" + File.separator + p);
			
			if(!f1.exists()){
				f1.mkdirs();
			}
			
			System.out.println(currPath + "html" + File.separator + p + File.separator + download.getId() + ".html");
			
			//生成html檔案
			FileOutputStream fos = new FileOutputStream(currPath + "html" + File.separator + p + File.separator + download.getId() + ".html");
			
			byte contentByte[] = index.getBytes();
						
			fos.write(contentByte);
			fos.close();
			download.setHtml(calendar.get(Calendar.YEAR) + "/" + (calendar.get(Calendar.MONTH)+1) + "/" + calendar.get(Calendar.DAY_OF_MONTH) + "/" + download.getId() + ".html");
		}
		catch(Exception e){
			msg = e.getMessage();
			System.out.println(e.toString());
			e.printStackTrace();
		}
		finally{
			op.closestmt();
			op.closeconn();
		}
	}
	/**
	 * 修改檔案
	 */
	public void mod(String imgfile) throws ClassNotFoundException, SQLException{
		try{
			modHtml();
			op = new Operation();
			sql = "UPDATE cms_infodata SET cms_infodata_name='"+download.getTitle()+"', cms_infodata_from='" + download.getFrom() + "', cms_infodata_indexpic='" + download.getIndexImage() + "', cms_infodata_keyword='"+download.getKeyword()+"', cms_infodata_descripte='"+download.getSummary()+"',cms_infodata_releasetime='"+download.getTime()+"',cms_infodata_html='"+download.getHtml()+"',cms_infodata_iscoment="+download.getComment()+" WHERE cms_infodata_id='" + download.getId() + "'";
			op.update(sql);
			sql = "UPDATE cms_infodata2 SET cms_infodata2_productor='"+download.getAuthor()+"',cms_infodata2_rune='"+download.getPlatform()+"',cms_infodata2_size="+download.getSize()+",cms_infodata2_lang='"+download.getLanguage()+"', cms_infodata2_info='" + download.getContent() + "',cms_infodata2_authtype='"+download.getGrant()+"',cms_infodata2_downurl='"+download.getFilename()+"' WHERE cms_infodata2_id='" + download.getId() + "'";
			op.update(sql);

			sql = "DELETE FROM cms_commend WHERE cms_commend_info='" + download.getId() + "'";
			op.update(sql);
			sql = "DELETE FROM cms_rolls WHERE cms_rolls_info='" + download.getId() + "'";
			op.update(sql);
			sql = "DELETE FROM cms_topinfo WHERE cms_topinfo_info='" + download.getId() + "'";
			op.update(sql);

			if(download.getCommend() == 1){
				sql = "INSERT INTO cms_commend(cms_commend_info, cms_commend_grade,cms_commend_class) VALUES ('" + download.getId() + "'," + download.getLevel() + ","+download.getCid()+")";
				op.update(sql);
			}
			if(download.getScroll() == 1){
				sql = "INSERT INTO cms_rolls(cms_rolls_info,cms_rolls_class) VALUES ('" + download.getId() + "',"+download.getCid()+")";
				op.update(sql);
			}
			if(download.getTop() == 1){
				sql = "INSERT INTO cms_topinfo(cms_topinfo_info,cms_topinfo_class) VALUES ('" + download.getId() + "',"+download.getCid()+")";
				op.update(sql);
			}
			//處理上傳的圖片
			String file[] = null;
			if(imgfile != null && imgfile != ""){
				file = imgfile.split(":");

				Picture picture = new Picture();
				ProcessPicture processPicture = new ProcessPicture();
				picture.setCid(download.getId());
				//表示訊息圖片
				picture.setType(1);

				for(int i=0;i<file.length;i++){
					picture.setFile(file[i]);
					processPicture.setPicture(picture);
					processPicture.add();
					if (!processPicture.isStatus()) {
						status = false;
						msg = processPicture.getMsg();
						return;
					}
				}
			}

			status = true;
		}
		catch(Exception e){
			msg = e.getMessage();
		}
		finally{
			op.closeconn();
		}
	}

	/**
	 * 刪除檔案
	 */
	public void del(String path, String id) throws ClassNotFoundException, SQLException{
		try{
			op = new Operation();

			//刪除html
			sql = "SELECT * FROM cms_infodata WHERE cms_infodata_id='"+id+"'";
			rs = op.query(sql);
			if(rs.next()){
				String f = rs.getString("cms_infodata_html");
				File htm = new File(path + "html" + java.io.File.separator + f);
				if(htm.exists()){
					htm.delete();
				}
			}

			//刪除檔案
			sql = "SELECT * FROM cms_infodata2 WHERE cms_infodata2_id='" +id+ "'";
			rs = op.query(sql);
			if(rs.next()){
				String f = rs.getString("cms_infodata2_downurl");
				File file = new File(path + "upload" + java.io.File.separator + "files" + java.io.File.separator + f);
				if(file.exists()){
					file.delete();
				}
			}

			sql = "DELETE FROM cms_infodata WHERE cms_infodata_id='" +id+ "'";
			op.update(sql);
			sql = "DELETE FROM cms_infodata1 WHERE cms_infodata1_id='" +id+ "'";
			op.update(sql);
			sql = "DELETE FROM cms_infodata2 WHERE cms_infodata2_id='" +id+ "'";
			op.update(sql);
			sql = "DELETE FROM cms_topinfo WHERE cms_topinfo_info='" +id+ "'";
			op.update(sql);
			sql = "DELETE FROM cms_commend WHERE cms_commend_info='" +id+ "'";
			op.update(sql);
			sql = "DELETE FROM cms_rolls WHERE cms_rolls_info='" +id+ "'";
			op.update(sql);

			//刪除評論訊息
			sql = "DELETE FROM cms_comment WHERE cms_comment_info='" +id+ "'";
			op.update(sql);

			//刪除檔案圖片
			ProcessPicture processPicture = new ProcessPicture();
			processPicture.del(path, id, 1);

			status = true;
		}
		catch(Exception e){
			msg = e.getMessage();
		}
		finally{
			op.closestmt();
			op.closeconn();
		}
	}
}