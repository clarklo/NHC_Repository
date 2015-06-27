package util;

/**
 * <p>Title: 整站系統1.0</p>
 *
 * <p>Description: 特殊字元串過濾</p>
 *
 * <p>Copyright: Copyright (c) 2013</p>
 *
 * <p>Company: web</p>
 *
 * @version 1.0
 */
public class SpecialStringFilter {
	//定義特殊字元串
	private static String invalid[] = {"select", "update", "insert", "delete", "truncate", "drop", "'", "%", ","};

	/*
	 * 如果輸入的字元串中有非法字元串,則返回true,否則返回false
	 */
	public static boolean check(String s){
		boolean status = false;
		if(s != null || s != ""){
			s = s.trim();
			s = s.toLowerCase();
			for(int i = 0; i < invalid.length; i++){
				if(s.indexOf(invalid[i]) != -1){
					status = true;
				}
			}
		}
		return status;
	}
}