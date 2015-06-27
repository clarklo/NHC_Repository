package com.web.www;

/**
 * <p>Title: 整站系統1.0</p>
 *
 * <p>Description: </p>
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
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import com.web.database.Operation;
import com.web.util.ReplaceAll;

public class ProcessArticle {
	//數據庫操作對象
	private Operation op;
	//SQL語句
	private String sql;
	//記錄集對象
	private ResultSet rs;
	//文章對象
	private Article article;
	//當前路徑
	private String currPath;
	//返回訊息
	private String msg;
	//返回狀態
	private boolean status;

    public ProcessArticle() {
		op = null;
		sql = "";
		rs = null;
		article = new Article();
		msg = "";
		status = false;
    }

    public Article getArticle() {
        return article;
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

    public void setArticle(Article article) {
        this.article = article;
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

    /**
	 *添蓋文章
	 */
	public void add(String imgfile) throws ClassNotFoundException, SQLException{
		try{
			//產生hmtl檔案
			//System.out.println("333333333333333333");
			

			op = new Operation();

			sql = "INSERT INTO cms_infodata (cms_infodata_id, cms_infodata_name, cms_infodata_type, cms_infodata_class, cms_infodata_from, cms_infodata_indexpic,cms_infodata_keyword,cms_infodata_descripte,cms_infodata_releasetime,cms_infodata_releaseman,cms_infodata_html,cms_infodata_iscoment) VALUES ('" + article.getId() + "','"+article.getTitle()+"', 1, " + article.getCid() + ", '" + article.getFrom() + "', '" + article.getIndexImage() + "','"+article.getKeyword()+"','"+article.getSummary()+"','"+article.getTime()+"','"+article.getUsername()+"','"+article.getHtml()+"',"+article.getComment()+")";
			System.out.println(sql);
			op.update(sql);
			sql = "INSERT INTO cms_infodata1(cms_infodata1_id, cms_infodata1_author, cms_infodata1_content, cms_infodata1_hits) VALUES ('" + article.getId() + "','"+article.getAuthor()+"','" + article.getContent() + "', " + article.getCount() + ")";
			System.out.println(sql);
			op.update(sql);
			if(article.getCommend() == 1){
				sql = "INSERT INTO cms_commend(cms_commend_info, cms_commend_grade, cms_commend_class) VALUES ('" + article.getId() + "'," + article.getLevel() + ","+article.getCid()+")";
				System.out.println(sql);
				op.update(sql);
			}
			if(article.getScroll() == 1){
				sql = "INSERT INTO cms_rolls(cms_rolls_info,cms_rolls_class) VALUES ('" + article.getId() + "',"+article.getCid()+")";
				System.out.println(sql);
				op.update(sql);
			}
			if(article.getTop() == 1){
				sql = "INSERT INTO cms_topinfo(cms_topinfo_info,cms_topinfo_class) VALUES ('" + article.getId() + "',"+article.getCid()+")";
				System.out.println(sql);
				op.update(sql);
			}

			
			//處理上傳的圖片
			String file[] = null;
			if(imgfile != null && !"".equals(imgfile)){
				file = imgfile.split(":");

				Picture picture = new Picture();
				ProcessPicture processPicture = new ProcessPicture();
				picture.setCid(article.getId());
				//表示訊息圖片
				picture.setType(1);

				for(int i=0;i<file.length;i++){
					picture.setFile(file[i]);
					processPicture.setPicture(picture);
					processPicture.add();
					if (!processPicture.isStatus()) {
						status = false;
						msg = processPicture.getMsg();
						//System.out.println("ProcessPicture.java error:"+msg);
						return;
					}
				}
			}

			status = true;
			
		}
		catch(Exception e){
			msg = e.getMessage();
			System.out.println("ProcessArtical.java error:"+msg);
			System.out.println("ProcessArtical.java status="+status);
		}
		finally{
			op.closeconn();
		}
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
                "article.html";
            FileInputStream in = new FileInputStream(file);
            int len = in.available();
            byte template[] = new byte[len];
            in.read(template);
            in.close();
            String index = new String(template);

			//生成選單
			String menu = "";
			sql = "SELECT * FROM cms_class WHERE cms_class_fatid=0 ORDER BY cms_class_orderid ASC";
			System.out.println(sql);
			
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
			sql = "SELECT * FROM cms_class WHERE cms_class_id="+article.getCid();
			System.out.println(sql);
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

				currPathId = pathId  + article.getCid() + "::";
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
			index = ReplaceAll.replace(index, "<$CURRENTPATH$>", path + " >> " +article.getTitle());
			index = ReplaceAll.replace(index, "<$TITLE$>", article.getTitle());
			index = ReplaceAll.replace(index, "<$AUTHOR$>", article.getAuthor());
			index = ReplaceAll.replace(index, "<$FROM$>", article.getFrom());
			index = ReplaceAll.replace(index, "<$TIME$>", article.getTime());
			index = ReplaceAll.replace(index, "<$USERNAME$>", article.getUsername());
			if(article.getComment()==1){
                index = ReplaceAll.replace(index, "<$COMMENT$>",
                    "【<a href='../../../../comment.jsp?id=" + article.getId() +
                                           "'>評論</a>】");
            }
			else{
				index = ReplaceAll.replace(index, "<$COMMENT$>", "");
			}

			index = ReplaceAll.replace(index, "<$COUNT$>", "<iframe name='count' frameborder=0 width=30 height=20 scrolling=no src='../../../../count.jsp?id="+article.getId()+"&type=1'></iframe>");
			index = ReplaceAll.replace(index, "<$KEYWORDS$>", article.getKeyword());
			index = ReplaceAll.replace(index, "<$CONTENT$>", article.getContent());

			//生成article.html檔案
			Calendar calendar = Calendar.getInstance();
			String p = calendar.get(Calendar.YEAR) + File.separator + (calendar.get(Calendar.MONTH)+1) + File.separator + calendar.get(Calendar.DAY_OF_MONTH);
			//生成目錄
			File f1 = new File(currPath + "html" + File.separator + p);
			if(!f1.exists()){
				f1.mkdirs();
			}
			//生成html檔案
			FileOutputStream fos = new FileOutputStream(currPath + "html" + File.separator + p + File.separator + article.getId() + ".html");
			byte contentByte[] = index.getBytes();
			fos.write(contentByte);
			fos.close();
			article.setHtml(calendar.get(Calendar.YEAR) + "/" + (calendar.get(Calendar.MONTH)+1) + "/" + calendar.get(Calendar.DAY_OF_MONTH) + "/" + article.getId() + ".html");
        }
		catch(Exception e){
			msg = e.getMessage();
		}
		finally{
			op.closestmt();
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
			sql = "SELECT * FROM cms_infodata WHERE cms_infodata_id='"+article.getId()+"'";
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
				"article.html";
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
			sql = "SELECT * FROM cms_class WHERE cms_class_id="+article.getCid();
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

				currPathId = pathId  + article.getCid() + "::";
				currPathName = pathName + name + "::";
			}
			System.out.println("#####"+currPathId);
			System.out.println("#####"+currPathName);
			
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
			index = ReplaceAll.replace(index, "<$CURRENTPATH$>", path + " >> " +article.getTitle());
			index = ReplaceAll.replace(index, "<$TITLE$>", article.getTitle());
			index = ReplaceAll.replace(index, "<$AUTHOR$>", article.getAuthor());
			index = ReplaceAll.replace(index, "<$FROM$>", article.getFrom());
			index = ReplaceAll.replace(index, "<$TIME$>", article.getTime());
			index = ReplaceAll.replace(index, "<$USERNAME$>", article.getUsername());
			if(article.getComment()==1){
                index = ReplaceAll.replace(index, "<$COMMENT$>",
                    "【<a href='../../../../comment.jsp?id=" + article.getId() +
                                           "'>評論</a>】");
            }
			else{
				index = ReplaceAll.replace(index, "<$COMMENT$>", "");
			}

			index = ReplaceAll.replace(index, "<$COUNT$>", "<iframe name='count' frameborder=0 width=30 height=20 scrolling=no src='../../../../count.jsp?id="+article.getId()+"&type=1'></iframe>");
			index = ReplaceAll.replace(index, "<$KEYWORDS$>", article.getKeyword());
			index = ReplaceAll.replace(index, "<$CONTENT$>", article.getContent());

			//生成article.html檔案
			Calendar calendar = Calendar.getInstance();
			String p = calendar.get(Calendar.YEAR) + File.separator + (calendar.get(Calendar.MONTH)+1) + File.separator + calendar.get(Calendar.DAY_OF_MONTH);
			//生成目錄
			File f1 = new File(currPath + "html" + File.separator + p);
			if(!f1.exists()){
				f1.mkdirs();
			}
			//生成html檔案
			FileOutputStream fos = new FileOutputStream(currPath + "html" + File.separator + p + File.separator + article.getId() + ".html");
			System.out.println("**********");
			
			System.out.println(fos.toString());
			System.out.println("**********");
			
			byte contentByte[] = index.getBytes();

			System.out.println("");
			System.out.println("**********");
			
			System.out.println(fos.toString());
			System.out.println("**********");
			
			fos.write(contentByte);
			fos.close();
			article.setHtml(calendar.get(Calendar.YEAR) + "/" + (calendar.get(Calendar.MONTH)+1) + "/" + calendar.get(Calendar.DAY_OF_MONTH) + "/" + article.getId() + ".html");
		}
		catch(Exception e){
			System.out.print(e.toString());
			msg = e.getMessage();
		}
		finally{
			op.closestmt();
			op.closeconn();
		}
	}

	/**
	 * 修改文章
	 */
	public void mod(String imgfile) throws ClassNotFoundException, SQLException{
		try{

			modHtml();

			op = new Operation();
			//sql = "UPDATE cms_infodata SET cms_infodata_name='"+article.getTitle()+"', cms_infodata_from='" + article.getFrom() + "', cms_infodata_indexpic='" + article.getIndexImage() + "', cms_infodata_keyword='"+article.getKeyword()+"', cms_infodata_descripte='"+article.getSummary()+"',cms_infodata_releasetime='"+article.getTime()+"',cms_infodata_html='"+article.getHtml()+"',cms_infodata_iscoment="+article.getComment()+" WHERE cms_infodata_id='" + article.getId() + "'";
			
			sql = "UPDATE cms_infodata SET cms_infodata_name='"+article.getTitle()+"', cms_infodata_from='" + article.getFrom() + "', cms_infodata_indexpic='" + article.getIndexImage() + "', cms_infodata_keyword='"+article.getKeyword()+"', cms_infodata_descripte='"+article.getSummary()+"',cms_infodata_releasetime='"+article.getTime()+"',cms_infodata_html='"+article.getHtml()+"',cms_infodata_iscoment="+article.getComment()+" ,cms_infodata_uptime='"+article.getTime1()+"',cms_infodata_dntime='"+article.getTime2()+"' WHERE cms_infodata_id='" + article.getId() + "'";
			
			
			
			
			
			System.out.println("A:sql:"+sql);
			op.update(sql);
			sql = "UPDATE cms_infodata1 SET cms_infodata1_author='"+article.getAuthor()+"', cms_infodata1_content='" + article.getContent() + "' WHERE cms_infodata1_id='" + article.getId() + "'";
			System.out.println("B:sql:"+sql);
			op.update(sql);

			sql = "DELETE FROM cms_commend WHERE cms_commend_info='" + article.getId() + "'";
			System.out.println("C:sql:"+sql);
			op.update(sql);
			sql = "DELETE FROM cms_rolls WHERE cms_rolls_info='" + article.getId() + "'";
			System.out.println("D:sql:"+sql);
			op.update(sql);
			sql = "DELETE FROM cms_topinfo WHERE cms_topinfo_info='" + article.getId() + "'";
			System.out.println("E:sql:"+sql);
			op.update(sql);
			if(article.getCommend() == 1){
				sql = "INSERT INTO cms_commend(cms_commend_info, cms_commend_grade,cms_commend_class) VALUES ('" + article.getId() + "'," + article.getLevel() + ","+article.getCid()+")";
				System.out.println("F:sql:"+sql);
				op.update(sql);
			}
			if(article.getScroll() == 1){
				sql = "INSERT INTO cms_rolls(cms_rolls_info,cms_rolls_class) VALUES ('" + article.getId() + "',"+article.getCid()+")";
				System.out.println("G:sql:"+sql);
				op.update(sql);
			}
			if(article.getTop() == 1){
				sql = "INSERT INTO cms_topinfo(cms_topinfo_info,cms_topinfo_class) VALUES ('" + article.getId() + "',"+article.getCid()+")";
				System.out.println("H:sql:"+sql);
				op.update(sql);
			}
			//處理上傳的圖片
			String file[] = null;

			if(imgfile != null &&!"".equals(imgfile)){ 
				file = imgfile.split(":");

				Picture picture = new Picture();
				ProcessPicture processPicture = new ProcessPicture();
				picture.setCid(article.getId());
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
	 * 刪除文章
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

			//刪除公告圖片
			ProcessPicture processPicture = new ProcessPicture();
			processPicture.del(path, id, 1);

			status = true;
		}
		catch(Exception e){
			msg = e.getMessage();
		}
		finally{
			op.closeconn();
		}
	}
	
	public List query(int limit,String classid)
	{
		List li=new ArrayList();
		try
		{
			op=new Operation();
			if(limit==0)
				sql="select cms_infodata_id,cms_infodata_name,cms_infodata_html,cms_infodata_releasetime from cms_infodata where  cms_infodata_class="+classid+" and cms_infodata_iscoment=1 order by cms_infodata_id desc";
				
			else
			//sql="select cms_infodata_id,cms_infodata_name,cms_infodata_html,cms_infodata_releasetime from cms_infodata where  cms_infodata_class="+classid+" and cms_infodata_iscoment=1 order by cms_infodata_id desc";
			//mysql//sql="select cms_infodata_id,cms_infodata_name,cms_infodata_html,cms_infodata_releasetime from cms_infodata where  cms_infodata_class="+classid+" order by cms_infodata_id desc limit "+limit;
			sql="select cms_infodata_id,cms_infodata_name,cms_infodata_html,cms_infodata_releasetime from cms_infodata where  cms_infodata_class="+classid+" and cms_infodata_uptime<='"+article.getTime()+"' and cms_infodata_dntime>='"+article.getTime()+"' and cms_infodata_iscoment=1 order by cms_infodata_id desc";
			
			System.out.println(sql);
			rs=op.query(sql);
			while(rs.next())
			{
				Article article=new Article();
				article.setId(rs.getString("cms_infodata_id"));
				article.setTitle(rs.getString("cms_infodata_name"));
				article.setTime(rs.getString("cms_infodata_releasetime"));
				
				
				li.add(article);
			}
		}
		catch(Exception e)
		{
			msg=e.getMessage();
			System.out.println("query() error:"+msg);
		}finally{
			
			op.closestmt();
			op.closeconn();
		}
		return li;
	}
	public void getOnedate(String id)
	{
		op=new Operation();
		sql="select cms_infodata_id,cms_infodata_name,cms_infodata_releasetime," +
		"cms_infodata_class,cms_infodata1_content  " +
		"from cms_infodata,cms_infodata1 where cms_infodata_id=cms_infodata1_id and cms_infodata_id="+id;
		System.out.println("sql:"+sql);
		rs=op.query(sql);
		try
		{
			if(rs.next())
			{
				
				article.setCid(rs.getInt("cms_infodata_class"));
				
				article.setContent(rs.getString("cms_infodata1_content"));
				article.setTitle(rs.getString("cms_infodata_name"));
				article.setTime(rs.getString("cms_infodata_releasetime"));
				
			}
			
		}
		catch(Exception e){
			System.out.println("exception:"+e.getMessage());
			msg = e.getMessage();
		}
		finally{
			
			op.closestmt();
			op.closeconn();
		}
		
	}
	
	public String queryclassNameByid(String id)
	{
		String classname="";
		op=new Operation();
		sql="select cms_class_name from cms_class,cms_infodata where cms_class_id=cms_infodata_class and cms_infodata_id="+id;
		
		rs=op.query(sql);
		try
		{
			if(rs.next())
			{
				
				classname=rs.getString(1);
				
			}
			
		}
		catch(Exception e){
			System.out.println("exception:"+e.getMessage());
			msg = e.getMessage();
		}
		finally{
			
			op.closestmt();
			op.closeconn();
		}
		return classname;
	}
	
}