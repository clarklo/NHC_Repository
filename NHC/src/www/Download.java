package www;

/**
 * <p>Title: �㯸�t��1.0</p>
 *
 * <p>Description: �ɮ�JavaBean</p>
 *
 * <p>Copyright: Copyright (c) 2013</p>
 *
 * <p>Company: web</p>
 *
 * @version 1.0
 */
import util.GetDate;

public class Download {
	//�ɮ׽s��
	private String id;
	//���O�s��
	private int cid;
	//�ɮצW��
	private String title;
	//�}�o��
	private String author;
	//�ӷ�
	private String from;
	//����r
	private String keyword;
	//���e�K�n
	private String summary;
	//��B����
	private String platform;
	//�y��
	private String language;
	//���v�Ҧ�
	private String grant;
	//�U���}
	private String filename;
	//�ɮפj�p
	private int size;
	//���e²��
	private String content;
	//�����Ϥ�
	private String indexImage;
	//�T��
	private int top;
	//�u��
	private int scroll;
	//����
	private int commend;
	//���˵���
	private int level;
	//HTML�ɮ�
	private String html;
	//�o���ɶ�
	private String time;
	//�o���H
	private String username;
	//�U���
	private int count;
	//���\��ק_
	private int comment;

    public Download() {
		id = String.valueOf(System.currentTimeMillis());
		cid = 0;
		title = "";
		author = "";
		from = "";
		keyword = "";
		summary = "";
		platform = "";
		language = "";
		grant = "";
		filename = "";
		size = 0;
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

    public int getCount() {
        return count;
    }

    public String getFilename() {
        return filename;
    }

    public String getFrom() {
        return from;
    }

    public String getGrant() {
        return grant;
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

    public String getLanguage() {
        return language;
    }

    public int getLevel() {
        return level;
    }

    public String getPlatform() {
        return platform;
    }

    public int getScroll() {
        return scroll;
    }

    public int getSize() {
        return size;
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

    public void setSize(int size) {
        this.size = size;
    }

    public void setScroll(int scroll) {
        this.scroll = scroll;
    }

    public void setPlatform(String platform) {
        this.platform = platform;
    }

    public void setLevel(int level) {
        this.level = level;
    }

    public void setLanguage(String language) {
        this.language = language;
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


    public void setGrant(String grant) {
        this.grant = grant;
    }

    public void setFrom(String from) {
        this.from = from;
    }

    public void setFilename(String filename) {
        this.filename = filename;
    }

    public void setCount(int count) {
        this.count = count;
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

    public void setComment(int comment) {
        this.comment = comment;
    }

    private void jbInit() throws Exception {
    }
}