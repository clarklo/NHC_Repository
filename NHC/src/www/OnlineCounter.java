package www;

/**
 * <p>Title: �㯸�t��1.0</p>
 *
 * <p>Description: �u�W�H��JavaBean</p>
 *
 * <p>Copyright: Copyright (c) 2013</p>
 *
 * <p>Company: web</p>
 *
 * @version 1.0
 */
public class OnlineCounter {
	private static long online = 0;

	public static long getOnline() {
		return online;
	}

	public static void raise(){
		online++;
	}

	public static void reduce(){
		online--;
		if(online < 0) online = 0;
   }
}