package com.web.www;

/**
 * <p>Title: 整站系統1.0</p>
 *
 * <p>Description: 管理員類</p>
 *
 * <p>Copyright: Copyright (c) 2013</p>
 *
 * <p>Company: web</p>
 *
 * @version 1.0
 */
import com.web.util.GetDate;
import com.web.util.MD5;

public class Admin {
	//管理員編號
	private int id;
	//管理員用戶名,即代號
	private String username;
	//管理員姓名
	private String name;
	//管理員密碼
	private String password;
	//管理員權限
	private String permission;
	//上次登錄時間
	private String lastLogin;
	//是否系統管理員
	private int isAdmin;
	//登錄次數
	private int logins;

	public Admin() {
		id = 0;
		username = "";
		name = "";
		password = "";
		permission = "";
		lastLogin = GetDate.getStringDate();
		isAdmin = 0;
		logins = 0;
	}

	public int getId() {
		return id;
	}

	public String getLastLogin() {
		return lastLogin;
	}

	public String getName() {
		return name;
	}

	public String getPassword() {
		return password;
	}

	public String getPermission() {
		return permission;
	}

	public String getUsername() {
		return username;
	}

    public int getIsAdmin() {
        return isAdmin;
    }

    public int getLogins() {
        return logins;
    }

    public void setId(int id) {
		this.id = id;
	}

	public void setLastLogin(String lastLogin) {
		this.lastLogin = lastLogin;
	}

	public void setName(String name) {
		this.name = name;
	}

	public void setPassword(String password) {
		this.password = MD5.toMD5(password);
	}

	public void setPermission(String permission) {
		this.permission = permission;
	}

	public void setUsername(String username) {
		this.username = username;
	}

    public void setIsAdmin(int isAdmin) {
        this.isAdmin = isAdmin;
    }

    public void setLogins(int logins) {
        this.logins = logins;
    }
}