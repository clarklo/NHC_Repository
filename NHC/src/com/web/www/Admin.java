package com.web.www;

/**
 * <p>Title: �㯸�t��1.0</p>
 *
 * <p>Description: �޲z����</p>
 *
 * <p>Copyright: Copyright (c) 2013</p>
 *
 * <p>Company: web</p>
 *
 * @version 1.0
 */
import util.GetDate;
import util.MD5;

public class Admin {
	//�޲z��s��
	private int id;
	//�޲z��Τ�W,�Y�N��
	private String username;
	//�޲z��m�W
	private String name;
	//�޲z��K�X
	private String password;
	//�޲z���v��
	private String permission;
	//�W���n��ɶ�
	private String lastLogin;
	//�O�_�t�κ޲z��
	private int isAdmin;
	//�n���
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