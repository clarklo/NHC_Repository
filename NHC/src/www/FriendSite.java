package www;

/**
 * <p>Title: �㯸�t��1.0</p>
 *
 * <p>Description: �ͱ��챵��</p>
 *
 * <p>Copyright: Copyright (c) 2013</p>
 *
 * <p>Company: web</p>
 *
 * @version 1.0
 */
public class FriendSite {
	//�챵�s��
	private int id;
	//�챵����
	private int type;
	//�����W��
	private String name;
	//������}
	private String url;
	//����logo
	private String logo;
	//����²��
	private String introduce;
	//���˯��I
	private int commend;
	//�O�_�z�L�f��
	private int check;
	//�f�֤H
	private String username;

    public FriendSite() {
		id = 0;
		type = 0;
		name = "";
		url = "";
		logo = "";
		introduce = "�L!";
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