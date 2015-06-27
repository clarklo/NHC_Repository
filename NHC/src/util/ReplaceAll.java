package util;

/**
 * <p>Title: 俱╰参1.0</p>
 *
 * <p>Description: じ﹃蠢传</p>
 *
 * <p>Copyright: Copyright (c) 2013</p>
 *
 * <p>Company: web</p>
 *
 * @version 1.0
 */
public class ReplaceAll {
	/**
	 * 才蠢传ㄧ计
	 */
	public static String replace(String source,String oldString,String newString) {
		if(source == null)
			return null;
		StringBuffer output = new StringBuffer();
		int lengOfsource = source.length();
		int lengOfold = oldString.length();
		int posStart = 0;
		int pos;
		while((pos = source.indexOf(oldString,posStart)) >= 0) {
			output.append(source.substring(posStart,pos));
			output.append(newString);
			posStart = pos + lengOfold;
		}
		if(posStart < lengOfsource) {
			output.append(source.substring(posStart));
		}
		return output.toString();
	}

	/**
	 * 盢炊硄じ﹃ΑてΘ计沮畐粄じ﹃Α
	 *
	 * @param str 璶Αてじ﹃
	 * @return 猭计沮畐じ﹃
	 */
	public static String toSql(String str) {
		String sql = new String(str);
		return replace(sql, "'", "''");
    }
}