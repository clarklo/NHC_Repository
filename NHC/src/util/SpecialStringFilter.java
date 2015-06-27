package util;

/**
 * <p>Title: �㯸�t��1.0</p>
 *
 * <p>Description: �S��r����L�o</p>
 *
 * <p>Copyright: Copyright (c) 2013</p>
 *
 * <p>Company: web</p>
 *
 * @version 1.0
 */
public class SpecialStringFilter {
	//�w�q�S��r����
	private static String invalid[] = {"select", "update", "insert", "delete", "truncate", "drop", "'", "%", ","};

	/*
	 * �p�G��J���r���ꤤ���D�k�r����,�h��^true,�_�h��^false
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