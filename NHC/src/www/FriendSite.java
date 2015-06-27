package www;

/**
 * <p>Title: 整站系統1.0</p>
 *
 * <p>Description: 友情鏈接類</p>
 *
 * <p>Copyright: Copyright (c) 2013</p>
 *
 * <p>Company: web</p>
 *
 * @version 1.0
 */
public class FriendSite {
	//鏈接編號
	private int id;
	//鏈接類型
	private int type;
	//網站名稱
	private String name;
	//網站位址
	private String url;
	//網站logo
	private String logo;
	//網站簡介
	private String introduce;
	//推薦站點
	private int commend;
	//是否透過審核
	private int check;
	//審核人
	private String username;

    public FriendSite() {
		id = 0;
		type = 0;
		name = "";
		url = "";
		logo = "";
		introduce = "無!";
		commend = 0;
		check = 0;
		username = "";
    }

    public int getCheck() {
        return check;
    }

    public int getCommend() {
        return commend;
    }

    public int getId() {
        return id;
    }

    public String getIntroduce() {
        return introduce;
    }

    public String getLogo() {
        return logo;
    }

    public String getName() {
        return name;
    }

    public int getType() {
        return type;
    }

    public String getUrl() {
        return url;
    }

    public String getUsername() {
        return username;
    }

    public void setCheck(int check) {
        this.check = check;
    }

    public void setCommend(int commend) {
        this.commend = commend;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setIntroduce(String introduce) {
        this.introduce = introduce;
    }

    public void setLogo(String logo) {
        this.logo = logo;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setType(int type) {
        this.type = type;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public void setUsername(String username) {
        this.username = username;
    }
}