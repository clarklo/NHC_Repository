package www;

/**
 * <p>Title: �㯸�t��1.0</p>
 *
 * <p>Description: �Ϥ��T��JavaBean</p>
 *
 * <p>Copyright: Copyright (c) 2013</p>
 *
 * <p>Company: web</p>
 *
 * @version 1.0
 */
public class Picture {
	//�Ϥ��s��
	private int id;
	//�ɮצ�}
	private String file;
	//�T���s��
	private String cid;
	//�Ϥ����O
	private int type;

    public Picture() {
		id = 0;
		file = "";
		cid = "";
		type = 0;
    }

    public String getCid() {
        return cid;
    }

    public String getFile() {
        return file;
    }

    public int getId() {
        return id;
    }

    public int getType() {
        return type;
    }

    public void setType(int type) {
        this.type = type;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setFile(String file) {
        this.file = file;
    }

    public void setCid(String cid) {
        this.cid = cid;
    }
}