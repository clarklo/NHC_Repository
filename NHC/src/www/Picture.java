package www;

/**
 * <p>Title: 整站系統1.0</p>
 *
 * <p>Description: 圖片訊息JavaBean</p>
 *
 * <p>Copyright: Copyright (c) 2013</p>
 *
 * <p>Company: web</p>
 *
 * @version 1.0
 */
public class Picture {
	//圖片編號
	private int id;
	//檔案位址
	private String file;
	//訊息編號
	private String cid;
	//圖片類別
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