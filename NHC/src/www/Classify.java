package www;

/**
 * <p>Title: 整站系統1.0</p>
 *
 * <p>Description: 分類</p>
 *
 * <p>Copyright: Copyright (c) 2013</p>
 *
 * <p>Company: web</p>
 *
 * @version 1.0
 */
public class Classify {
	//類別編號
	private int id;
	//類別名稱
	private String name;
	//父類編號
	private int pid;
	//路徑編號
	private String pathId;
	//路徑名稱
	private String pathName;
	//類別序號
	private int num;
	//外部位址
	private String externURL;
	//是否推薦
	private int commend;
	//是否輸出Rss
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