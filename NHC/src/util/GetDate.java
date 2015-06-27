package util;

/**
 * <p>Title: 整站系統1.0</p>
 *
 * <p>Description: 日期時間類</p>
 *
 * <p>Copyright: Copyright (c) 2013</p>
 *
 * <p>Company: web</p>
 *
 * @version 1.0
 */
import java.text.ParsePosition;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

public class GetDate {
	public GetDate() {
	}
	public static Date getNowDate(){
		Date currentTime = new Date();
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String dateString=formatter.format(currentTime);
		ParsePosition pos = new ParsePosition(8);
		Date currentTime_2 = formatter.parse(dateString, pos);
		return currentTime_2;
	}
	public static Date getNowDateShort() {
		Date currentTime = new Date();
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		String dateString=formatter.format(currentTime);
		ParsePosition pos = new ParsePosition(8);
		Date currentTime_2 = formatter.parse(dateString, pos);
		return currentTime_2;
	}

	public static String getStringDate(){
		Date currentTime = new Date();
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String dateString = formatter.format(currentTime);
		return dateString;
	}
	public static String getStringDateShort(){
		Date currentTime = new Date();
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		String dateString = formatter.format(currentTime);
		return dateString;
	}
	
	public static String getDateString()
	{
		String str="";
		str=Calendar.getInstance().get(Calendar.YEAR)+""+Calendar.getInstance().get(Calendar.MONTH)+
		Calendar.getInstance().get(Calendar.DATE)+Calendar.getInstance().get(Calendar.HOUR)+
		Calendar.getInstance().get(Calendar.MINUTE)+Calendar.getInstance().get(Calendar.SECOND);
		
	    return str;
	}
	
	public static void main(String[] args) {
		System.out.println("字元串:"+GetDate.getDateString());

	}
}