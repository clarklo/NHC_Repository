package www;

/**
 * <p>Title: �㯸�t��1.0</p>
 *
 * <p>Description: ����</p>
 *
 * <p>Copyright: Copyright (c) 2013</p>
 *
 * <p>Company: web</p>
 *
 * @version 1.0
 */
public class Classify {
	//���O�s��
	private int id;
	//���O�W��
	private String name;
	//�����s��
	private int pid;
	//���|�s��
	private String pathId;
	//���|�W��
	private String pathName;
	//���O�Ǹ�
	private int num;
	//�~����}
	private String externURL;
	//�O�_����
	private int commend;
	//�O�_��XRss
	private int isOutputRSS;

	public Classify() {
		id = 0;
		name = "";
		pid = 0;
		pathId = "";
		pathName = "";
		num = 0;
		externURL = "";
		commend = 0;
		isOutputRSS = 0;
	}

	public int getId() {
		return id;
	}

	public String getName() {
		return name;
	}

	public int getNum() {
		return num;
	}

	public String getPathId() {
		return pathId;
	}

	public String getPathName() {
		return pathName;
	}

	public int getPid() {
		return pid;
	}

    public int getCommend() {
        return commend;
    }

    public String getExternURL() {
        return externURL;
    }

    public int getIsOutputRSS() {
        return isOutputRSS;
    }

    public void setId(int id) {
		this.id = id;
	}

	public void setName(String name) {
		this.name = name;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public void setPathId(String pathId) {
		this.pathId = pathId;
	}

	public void setPathName(String pathName) {
		this.pathName = pathName;
	}

	public void setPid(int pid) {
		this.pid = pid;
	}

    public void setCommend(int commend) {
        this.commend = commend;
    }

    public void setExternURL(String externURL) {
        this.externURL = externURL;
    }

    public void setIsOutputRSS(int isOutputRSS) {
        this.isOutputRSS = isOutputRSS;
    }
}