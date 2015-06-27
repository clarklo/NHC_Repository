package com.web.www;

/**
 * <p>Title: 整站系統1.0</p>
 *
 * <p>Description: 文章JavaBean</p>
 *
 * <p>Copyright: Copyright (c) 2013</p>
 *
 * <p>Company: web</p>
 *
 * @version 1.0
 */
import com.web.util.GetDate;

public class Article {
	//文章編號
	private String id;
	//所在類別
	private int cid;
	//文章標題
	private String title;
	//作者
	private String author;
	//文章來源
	private String from;
	//關鍵字
	private String keyword;
	//摘要
	private String summary;
	//文章內容
	private String content;
	//首頁圖片
	private String indexImage;
	//固頂
	private int top;
	//滾動
	private int scroll;
	//推薦
	private int commend;
	//推薦等級
	private int level;
	//HTML檔案
	private String html;
	//發布時間
	private String time;
	//發布時間
	private String time1;
	//發布時間
	private String time2;
	//發布人
	private String username;
	//點擊次數
	private int count;
	//允許評論否
	private int comment;

    public Article() {
		id = String.valueOf(System.currentTimeMillis());
		cid = 0;
		title = "";
		author = "";
		from = "";
		keyword = "";
		summary = "";
		content = "";
		indexImage = "";
		top = 0;
		scroll = 0;
		commend = 0;
		level = 0;
		html = "";
		time = GetDate.getStringDate();
		username = "";
		count = 0;
		comment = 1;
    }

    public String getAuthor() {
        return author;
    }

    public int getCid() {
        return cid;
    }

    public int getCommend() {
        return commend;
    }

    public String getContent() {
        return content;
    }

    public String getFrom() {
        return from;
    }

    public String getHtml() {
        return html;
    }

    public String getId() {
        return id;
    }

    public String getIndexImage() {
        return indexImage;
    }

    public String getKeyword() {
        return keyword;
    }

    public int getLevel() {
        return level;
    }

    public int getScroll() {
        return scroll;
    }

    public String getSummary() {
        return summary;
    }

    public String getTime() {
        return time;
    }

    public String getTitle() {
        return title;
    }

    public int getTop() {
        return top;
    }

    public String getUsername() {
        return username;
    }

    public int getCount() {
        return count;
    }

    public int getComment() {
        return comment;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public void setTop(int top) {
        this.top = top;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public void setTime(String time) {
        this.time = time;
    }

    public void setSummary(String summary) {
        this.summary = summary;
    }

    public void setScroll(int scroll) {
        this.scroll = scroll;
    }

    public void setLevel(int level) {
        this.level = level;
    }

    public void setKeyword(String keyword) {
        this.keyword = keyword;
    }

    public void setIndexImage(String indexImage) {
        this.indexImage = indexImage;
    }

    public void setId(String id) {
        this.id = id;
    }

    public void setHtml(String html) {
        this.html = html;
    }

    public void setFrom(String from) {
        this.from = from;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public void setCommend(int commend) {
        this.commend = commend;
    }

    public void setCid(int cid) {
        this.cid = cid;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public void setCount(int count) {
        this.count = count;
    }

    public void setComment(int comment) {
        this.comment = comment;
    }

	public String getTime1() {
		return time1;
	}

	public void setTime1(String time1) {
		this.time1 = time1;
	}

	public String getTime2() {
		return time2;
	}

	public void setTime2(String time2) {
		this.time2 = time2;
	}
}